# PowerShell wrapper for the exporter script
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

function Process-MarkdownFile {
    param(
        [Parameter(Mandatory)]
        [string]$FilePath
    )
    
    # Store original timestamp
    $originalTimestamp = (Get-Item $FilePath).LastWriteTime
    
    # Read file content
    $content = Get-Content $FilePath -Raw
    
    # Process Excalidraw references
    $content = $content -replace '\.excalidraw\b', '.excalidraw.png'
    
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
} elseif (Test-Path "$WindowsTempDir\*") {
    Remove-Item -Path "$WindowsTempDir\*" -Recurse -Force -ErrorAction Stop
    Write-Success "Cleaned existing temporary directory"
} else {
    Write-Success "Using empty temporary directory"
}

Write-Step "Copying files to temporary location..."
try {
    Copy-Item -Path "$WindowsSourceDir\*" -Destination $WindowsTempDir -Recurse -Force -ErrorAction Stop
    Write-Success "Files copied to temporary location"
} catch {
    Write-Error "Failed to copy files: $_"
    exit 1
}

Write-Step "Processing files in parallel..."
# Get all markdown files
$markdownFiles = Get-ChildItem -Path $WindowsTempDir -Filter "*.md" -Recurse -File
if ($markdownFiles.Count -eq 0) {
    Write-Warning "No markdown files found to process"
    exit 0
}
Write-Info "Found $($markdownFiles.Count) markdown files to process"

# Calculate number of cores (leave one core free for system)
$maxThreads = [Math]::Max(1, (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors - 1)
Write-Info "Using $maxThreads threads for parallel processing"

# Check PowerShell version for parallel processing method
$PSVersion = $PSVersionTable.PSVersion.Major
if ($PSVersion -ge 7) {
    # PowerShell 7+ - Use native parallel processing
    Write-Info "Using PowerShell 7+ parallel processing"
    try {
        $markdownFiles | ForEach-Object -ThrottleLimit $maxThreads -Parallel {
            # Import the Process-MarkdownFile function into this parallel scope
            ${function:Process-MarkdownFile} = $using:MyInvocation.MyCommand.ScriptBlock.Module.ExportedFunctions['Process-MarkdownFile'].ScriptBlock
            
            # Process the file
            Process-MarkdownFile -FilePath $_.FullName
        } -ErrorAction Stop
    } catch {
        Write-Error "Error during parallel processing: $_"
        exit 1
    }
} else {
    # PowerShell 5.1 - Use jobs for parallel processing
    Write-Info "Using PowerShell jobs for parallel processing"
    
    # Create a script block for processing
    $scriptBlock = {
        param($filePath)
        
        # Define the Process-MarkdownFile function in this scope
        function Process-MarkdownFile {
            param([string]$FilePath)
            
            # Store original timestamp
            $originalTimestamp = (Get-Item $FilePath).LastWriteTime
            
            # Read file content
            $content = Get-Content $FilePath -Raw
            
            # Process Excalidraw references
            $content = $content -replace '\.excalidraw\b', '.excalidraw.png'
            
            # Write back to file
            $content | Set-Content $FilePath -NoNewline
            
            # Restore timestamp
            (Get-Item $FilePath).LastWriteTime = $originalTimestamp
        }
        
        # Process the file
        Process-MarkdownFile -FilePath $filePath
    }
    
    try {
        # Start jobs for each file
        $jobs = @()
        foreach ($file in $markdownFiles) {
            # Check running job count
            $runningJobs = @(Get-Job -State Running -ErrorAction SilentlyContinue)
            while ($runningJobs.Count -ge $maxThreads) {
                Start-Sleep -Milliseconds 100
                $runningJobs = @(Get-Job -State Running -ErrorAction SilentlyContinue)
            }
            
            # Start new job
            $jobs += Start-Job -ScriptBlock $scriptBlock -ArgumentList $file.FullName
            Write-Progress -Activity "Processing Files" -Status "Processing $($jobs.Count) of $($markdownFiles.Count)" -PercentComplete (($jobs.Count / $markdownFiles.Count) * 100)
        }
        
        Write-Progress -Activity "Processing Files" -Status "Waiting for jobs to complete..." -PercentComplete 99
        
        # Wait for all jobs to complete and collect results
        foreach ($job in $jobs) {
            $result = $job | Wait-Job | Receive-Job -ErrorAction Stop
            if ($job.State -eq 'Failed') {
                throw "Job failed: $($job.ChildJobs[0].JobStateInfo.Reason.Message)"
            }
        }
        
        Write-Progress -Activity "Processing Files" -Completed
        
        # Clean up jobs
        $jobs | Remove-Job -Force
    } catch {
        Write-Progress -Activity "Processing Files" -Completed
        Write-Error "Error during parallel processing: $_"
        Get-Job | Remove-Job -Force -ErrorAction SilentlyContinue
        exit 1
    }
}

Write-Success "File processing completed"

Write-Step "Cleaning up Excalidraw files..."
try {
    $excalidrawFiles = Get-ChildItem -Path $WindowsTempDir -Filter "*.excalidraw.md" -Recurse
    if ($excalidrawFiles.Count -gt 0) {
        $excalidrawFiles | Remove-Item -Force
        Write-Info "Removed $($excalidrawFiles.Count) Excalidraw markdown files"
    }
} catch {
    Write-Warning "Failed to clean up some Excalidraw files: $_"
}

Write-Step "Moving processed files to Quartz content directory..."
try {
    # Ensure Quartz content directory exists and is empty
    if (!(Test-Path $WindowsQuartzContentDir)) {
        New-Item -ItemType Directory -Path $WindowsQuartzContentDir -Force | Out-Null
    } else {
        Remove-Item -Path "$WindowsQuartzContentDir\*" -Recurse -Force
    }

    # Move processed files to Quartz content directory
    Copy-Item -Path "$WindowsTempDir\*" -Destination $WindowsQuartzContentDir -Recurse -Force
    Write-Success "Files moved to Quartz content directory"
} catch {
    Write-Error "Failed to move files to Quartz content directory: $_"
    exit 1
}

# Count exported files
$ExportedFiles = (Get-ChildItem -Path $WindowsQuartzContentDir -Recurse -File).Count
Write-Success "Export completed successfully!"
Write-Info "Exported $ExportedFiles files to Quartz content directory"
