# PowerShell wrapper for the exporter script with change detection
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Function definitions must come before any script execution
function Write-Step {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )
    Write-Host "=> $Message" -ForegroundColor Cyan
}

function Write-Success {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )
    Write-Host "[OK] $Message" -ForegroundColor Green
}

function Write-Info {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )
    Write-Host "[INFO] $Message" -ForegroundColor Blue
}

# Change detection functions
function Get-FileHash {
    param([string]$FilePath)
    
    if (Test-Path $FilePath) {
        try {
            $fileStream = [System.IO.File]::OpenRead($FilePath)
            $hasher = [System.Security.Cryptography.MD5]::Create()
            $hashBytes = $hasher.ComputeHash($fileStream)
            $fileStream.Close()
            $hasher.Dispose()
            return [System.BitConverter]::ToString($hashBytes) -replace '-', ''
        }
        catch {
            # Fallback to file size and modification time
            $fileInfo = Get-Item $FilePath
            return "$($fileInfo.Length)-$($fileInfo.LastWriteTime.Ticks)"
        }
    }
    return "FILE_NOT_FOUND"
}

function Test-FileChanged {
    param(
        [string]$SourceFile,
        [string]$CacheFile,
        [string]$RelativePath
    )
    
    # If cache doesn't exist, file has changed
    if (-not (Test-Path $CacheFile)) {
        return $true
    }
    
    try {
        # Read cached data
        $cacheContent = Get-Content $CacheFile -ErrorAction SilentlyContinue
        if ($cacheContent.Count -lt 2) {
            return $true
        }
        
        $cachedHash = $cacheContent[0]
        $cachedTimestamp = $cacheContent[1]
        
        # Get current file data
        $currentHash = Get-FileHash $SourceFile
        $currentTimestamp = if (Test-Path $SourceFile) { (Get-Item $SourceFile).LastWriteTime.Ticks.ToString() } else { "0" }
        
        # If file doesn't exist anymore, it has changed
        if ($currentHash -eq "FILE_NOT_FOUND") {
            return $true
        }
        
        # Compare timestamps first (faster)
        if ($currentTimestamp -ne $cachedTimestamp) {
            return $true
        }
        
        # If timestamps match, compare hashes for content changes
        if ($currentHash -ne $cachedHash) {
            return $true
        }
        
        return $false
    }
    catch {
        # If there's any error reading cache, assume file has changed
        return $true
    }
}

function Update-FileCache {
    param(
        [string]$SourceFile,
        [string]$CacheFile,
        [string]$RelativePath
    )
    
    try {
        # Create cache directory if it doesn't exist
        $cacheDir = Split-Path $CacheFile -Parent
        if (-not (Test-Path $cacheDir)) {
            New-Item -ItemType Directory -Path $cacheDir -Force | Out-Null
        }
        
        # Write current file data to cache
        $currentHash = Get-FileHash $SourceFile
        $currentTimestamp = if (Test-Path $SourceFile) { (Get-Item $SourceFile).LastWriteTime.Ticks.ToString() } else { "0" }
        
        @(
            $currentHash
            $currentTimestamp
            $RelativePath
            (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        ) | Set-Content $CacheFile -Encoding UTF8
    }
    catch {
        Write-Warning "Failed to update cache for $($RelativePath): $_"
    }
}

function Process-MarkdownFile {
    param(
        [Parameter(Mandatory)]
        [string]$FilePath
    )
    
    # Store original timestamp
    $originalTimestamp = (Get-Item $FilePath).LastWriteTime
    
    # Read file content
    $content = Get-Content $FilePath -Raw
    
    # Process Excalidraw references - convert .excalidraw.png to .png
    $content = $content -replace '\.excalidraw\.png\b', '.png'
    
    # Process equations - convert inline $$ to block format
    # $content = $content -replace '\$\$([^$]+)\$\$', "`n`n$$`$1`$$`n`n"
    
    # Process Obsidian image references - convert .excalidraw.png to .png and flatten _Media paths
    $content = $content -replace '!\[\[([^\]]*\.excalidraw)\.png\]\]', '![[$1.png]]'
    
    # Flatten _Media paths - convert _Media/Excalidraw/filename to _Media/filename
    $content = $content -replace '!\[\[_Media/Excalidraw/([^/\]]+)\]\]', '![[_Media/$1]]'
    $content = $content -replace '!\[\[_Media/Excalidraw/([^/\]]+\.png)\]\]', '![[_Media/$1]]'
    
    # Write back to file
    $content | Set-Content $FilePath -NoNewline
    
    # Restore timestamp
    (Get-Item $FilePath).LastWriteTime = $originalTimestamp
}

# Script execution starts here
Write-Host "`nQuartz Export Process" -ForegroundColor Yellow
Write-Host "==================`n" -ForegroundColor Yellow

Write-Step "Checking Git Bash installation..."
# Find Git Bash location
$GitBashPath = "C:\Program Files\Git\bin\bash.exe"
if (!(Test-Path $GitBashPath)) {
    $GitBashPath = "C:\Program Files (x86)\Git\bin\bash.exe"
}
if (!(Test-Path $GitBashPath)) {
    Write-Error "Could not find Git Bash installation. Please install Git for Windows."
    exit 1
}
Write-Success "Found Git Bash at: $GitBashPath"

# Set up paths using Windows-style paths first
Write-Step "Setting up directory paths..."
$WindowsSourceDir = "C:\Users\jdwh0\Obsidian\Lavafox"
$WindowsExcalidrawDir = "C:\Users\jdwh0\Obsidian\Lavafox\_Media\Excalidraw"
$WindowsTempDir = "C:\Users\jdwh0\Obsidian\temp"
$WindowsQuartzDir = "C:\Users\jdwh0\Obsidian\quartzsite"
$WindowsQuartzContentDir = Join-Path $WindowsQuartzDir "content"
$WindowsCacheDir = Join-Path $WindowsTempDir ".cache"

# Verify Windows paths exist
if (!(Test-Path $WindowsSourceDir)) {
    Write-Error "Source directory not found: $WindowsSourceDir"
    exit 1
}

# Convert to Git Bash style paths for environment variables
$BashSourceDir = $WindowsSourceDir -replace "\\", "/" -replace "^([A-Za-z]):", "/`$1"
$BashExcalidrawDir = $WindowsExcalidrawDir -replace "\\", "/" -replace "^([A-Za-z]):", "/`$1"
$BashTempDir = $WindowsTempDir -replace "\\", "/" -replace "^([A-Za-z]):", "/`$1"
$BashQuartzDir = $WindowsQuartzDir -replace "\\", "/" -replace "^([A-Za-z]):", "/`$1"
$BashQuartzContentDir = $WindowsQuartzContentDir -replace "\\", "/" -replace "^([A-Za-z]):", "/`$1"

# Set environment variables for any remaining bash scripts
$env:SOURCE_DIR = $BashSourceDir
$env:EXCALIDRAW_DIR = $BashExcalidrawDir
$env:TEMP_EXPORT_DIR = $BashTempDir
$env:QUARTZ_PROJECT_DIR = $BashQuartzDir
$env:QUARTZ_CONTENT_DIR = $BashQuartzContentDir

Write-Success "Directory paths configured:"
Write-Host "  Source:     $env:SOURCE_DIR"
Write-Host "  Temporary:  $env:TEMP_EXPORT_DIR"
Write-Host "  Quartz:     $env:QUARTZ_PROJECT_DIR"
Write-Host ""

# Create temp directory if it doesn't exist
Write-Step "Setting up temporary directory..."
if (!(Test-Path $WindowsTempDir)) {
    New-Item -ItemType Directory -Path $WindowsTempDir -Force | Out-Null
    Write-Success "Created temporary directory"
}
elseif (Test-Path "$WindowsTempDir\*") {
    Remove-Item -Path "$WindowsTempDir\*" -Recurse -Force -ErrorAction Stop
    Write-Success "Cleaned existing temporary directory"
}
else {
    Write-Success "Using empty temporary directory"
}

# Create cache directory
if (!(Test-Path $WindowsCacheDir)) {
    New-Item -ItemType Directory -Path $WindowsCacheDir -Force | Out-Null
    Write-Success "Created cache directory"
}

Write-Step "Copying files to temporary location (with change detection)..."
$copiedCount = 0
$skippedCount = 0

# Get all files that need to be processed
$allFiles = Get-ChildItem -Path $WindowsSourceDir -Recurse -File | Where-Object { 
    $_.Extension -match '\.(md|png|jpg|jpeg|gif|webp|svg|mp4|webm|ogg|pdf)$' 
}

Write-Info "Found $($allFiles.Count) files to check"

foreach ($sourceFile in $allFiles) {
    # Calculate relative path
    $relativePath = $sourceFile.FullName.Substring($WindowsSourceDir.Length + 1)
    
    # Check if this is a media file that should go to _Media folder
    $isMediaFile = $relativePath -match '^_Media\\'
    if ($isMediaFile) {
        # For media files, flatten the structure to go directly to _Media
        $fileName = Split-Path $relativePath -Leaf
        $targetFile = Join-Path (Join-Path $WindowsTempDir "_Media") $fileName
        $cacheFile = Join-Path (Join-Path $WindowsCacheDir "_Media") "$fileName.cache"
    }
    else {
        # For regular files, maintain directory structure
        $targetFile = Join-Path $WindowsTempDir $relativePath
        $cacheFile = Join-Path $WindowsCacheDir "$relativePath.cache"
    }
    
    # Check if file has changed
    if (Test-FileChanged $sourceFile.FullName $cacheFile $relativePath) {
        # Create target directory
        $targetDir = Split-Path $targetFile -Parent
        if (!(Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        }
        
        # Copy file
        Copy-Item -Path $sourceFile.FullName -Destination $targetFile -Force
        
        # Update cache
        Update-FileCache $sourceFile.FullName $cacheFile $relativePath
        
        Write-Info "COPIED: $relativePath"
        $copiedCount++
    }
    else {
        Write-Info "SKIPPED: $relativePath"
        $skippedCount++
    }
}

Write-Success "Files processed: $copiedCount copied, $skippedCount skipped"

# Media files are now handled in the main file copying loop above

Write-Step "Renaming Excalidraw image files..."
# Rename .excalidraw.png files to .png
$excalidrawImageFiles = Get-ChildItem -Path $WindowsTempDir -Filter "*.excalidraw.png" -Recurse -File
if ($excalidrawImageFiles.Count -gt 0) {
    Write-Info "Found $($excalidrawImageFiles.Count) Excalidraw image files to rename"
    foreach ($file in $excalidrawImageFiles) {
        $newName = $file.Name -replace '\.excalidraw\.png$', '.png'
        Rename-Item -Path $file.FullName -NewName $newName -Force
        Write-Info "Renamed: $($file.Name) -> $newName"
    }
    Write-Success "Excalidraw image files renamed"
}
else {
    Write-Info "No Excalidraw image files found to rename"
}

Write-Step "Processing files (only changed files)..."
# Get all markdown files and check which ones need processing
$markdownFiles = Get-ChildItem -Path $WindowsTempDir -Filter "*.md" -Recurse -File
if ($markdownFiles.Count -eq 0) {
    Write-Warning "No markdown files found to process"
    exit 0
}

$processedCount = 0
$skippedCount = 0

foreach ($file in $markdownFiles) {
    # Calculate relative path for cache lookup
    $relativePath = $file.FullName.Substring($WindowsTempDir.Length + 1)
    $cacheFile = Join-Path $WindowsCacheDir "$relativePath.cache"
    
    # Check if this file was recently copied (indicating it needs processing)
    $needsProcessing = $false
    
    if (Test-Path $cacheFile) {
        # Check if the cache was updated recently (within last few seconds)
        $cacheAge = (Get-Date) - (Get-Item $cacheFile).LastWriteTime
        if ($cacheAge.TotalSeconds -lt 10) {
            # File was recently copied, needs processing
            $needsProcessing = $true
        }
        else {
            # File is old, check if it needs processing by looking for patterns
            $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
            if ($content -match '(\$\$[^$]*\$\$|!\[\[.*\.excalidraw\.png\]\]|!\[\[_Media/Excalidraw/)') {
                $needsProcessing = $true
            }
        }
    }
    else {
        # No cache, process the file
        $needsProcessing = $true
    }
    
    if ($needsProcessing) {
        Process-MarkdownFile -FilePath $file.FullName
        Write-Info "PROCESSED: $relativePath"
        $processedCount++
    }
    else {
        Write-Info "SKIPPED: $relativePath"
        $skippedCount++
    }
}

Write-Success "File processing completed: $processedCount processed, $skippedCount skipped"

Write-Step "Cleaning up Excalidraw files..."
try {
    $excalidrawFiles = Get-ChildItem -Path $WindowsTempDir -Filter "*.excalidraw.md" -Recurse
    if ($excalidrawFiles.Count -gt 0) {
        $excalidrawFiles | Remove-Item -Force
        Write-Info "Removed $($excalidrawFiles.Count) Excalidraw markdown files"
    }
}
catch {
    Write-Warning "Failed to clean up some Excalidraw files: $_"
}

Write-Step "Moving processed files to Quartz content directory..."
try {
    # Ensure Quartz content directory exists and is empty
    if (!(Test-Path $WindowsQuartzContentDir)) {
        New-Item -ItemType Directory -Path $WindowsQuartzContentDir -Force | Out-Null
    }
    else {
        Remove-Item -Path "$WindowsQuartzContentDir\*" -Recurse -Force
    }

    # Move processed files to Quartz content directory
    Copy-Item -Path "$WindowsTempDir\*" -Destination $WindowsQuartzContentDir -Recurse -Force
    Write-Success "Files moved to Quartz content directory"
}
catch {
    Write-Error "Failed to move files to Quartz content directory: $_"
    exit 1
}

# Count exported files
$ExportedFiles = (Get-ChildItem -Path $WindowsQuartzContentDir -Recurse -File).Count
Write-Success "Export completed successfully!"
Write-Info "Exported $ExportedFiles files to Quartz content directory"
