#! /bin/bash

# Configuration parameters
SOURCE_DIR="${SOURCE_DIR:-/c/Users/jdwh0/Obsidian/Lavafox}"                            # Source directory (default: Lavafox vault)
EXCALIDRAW_DIR="${EXCALIDRAW_DIR:-/c/Users/jdwh0/Obsidian/Lavafox/_Media/Excalidraw}"  # Directory containing Excalidraw files
TEMP_EXPORT_DIR="${TEMP_EXPORT_DIR:-/c/Users/jdwh0/Obsidian/temp}"                     # Temporary export directory
QUARTZ_PROJECT_DIR="${QUARTZ_PROJECT_DIR:-/c/Users/jdwh0/Obsidian/quartzsite}"         # Quartz project root directory
QUARTZ_CONTENT_DIR="${QUARTZ_CONTENT_DIR:-$QUARTZ_PROJECT_DIR/content}"                # Final output directory for Quartz
CACHE_DIR="${CACHE_DIR:-$TEMP_EXPORT_DIR/.cache}"                                      # Cache directory for change detection

# Convert Windows paths to Unix-style for WSL compatibility
SOURCE_DIR=$(echo "$SOURCE_DIR" | sed 's/\\/\//g')
EXCALIDRAW_DIR=$(echo "$EXCALIDRAW_DIR" | sed 's/\\/\//g')
TEMP_EXPORT_DIR=$(echo "$TEMP_EXPORT_DIR" | sed 's/\\/\//g')
QUARTZ_PROJECT_DIR=$(echo "$QUARTZ_PROJECT_DIR" | sed 's/\\/\//g')
QUARTZ_CONTENT_DIR=$(echo "$QUARTZ_CONTENT_DIR" | sed 's/\\/\//g')
CACHE_DIR=$(echo "$CACHE_DIR" | sed 's/\\/\//g')

# Logging function with different levels
log_info() {
    echo -e "\033[0;34m[INFO]\033[0m $1"
}

log_step() {
    echo -e "\033[0;36m[STEP]\033[0m $1"
}

log_success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

log_error() {
    echo -e "\033[0;31m[ERROR]\033[0m $1" >&2
}

# Change detection functions
get_file_hash() {
    local file="$1"
    if [ -f "$file" ]; then
        # Use md5sum if available, otherwise fall back to cksum
        if command -v md5sum >/dev/null 2>&1; then
            md5sum "$file" | cut -d' ' -f1
        elif command -v cksum >/dev/null 2>&1; then
            cksum "$file" | cut -d' ' -f1
        else
            # Fallback to file size and modification time
            stat -c "%s-%Y" "$file" 2>/dev/null || stat -f "%z-%m" "$file"
        fi
    else
        echo "FILE_NOT_FOUND"
    fi
}

get_file_timestamp() {
    local file="$1"
    if [ -f "$file" ]; then
        stat -c "%Y" "$file" 2>/dev/null || stat -f "%m" "$file"
    else
        echo "0"
    fi
}

is_file_changed() {
    local source_file="$1"
    local cache_file="$2"
    local relative_path="$3"
    
    # If cache doesn't exist, file has changed
    if [ ! -f "$cache_file" ]; then
        return 0  # Changed
    fi
    
    # Read cached data
    local cached_hash=$(head -n1 "$cache_file" 2>/dev/null || echo "")
    local cached_timestamp=$(head -n2 "$cache_file" | tail -n1 2>/dev/null || echo "0")
    
    # Get current file data
    local current_hash=$(get_file_hash "$source_file")
    local current_timestamp=$(get_file_timestamp "$source_file")
    
    # If file doesn't exist anymore, it has changed
    if [ "$current_hash" = "FILE_NOT_FOUND" ]; then
        return 0  # Changed
    fi
    
    # Compare timestamps first (faster)
    if [ "$current_timestamp" != "$cached_timestamp" ]; then
        return 0  # Changed
    fi
    
    # If timestamps match, compare hashes for content changes
    if [ "$current_hash" != "$cached_hash" ]; then
        return 0  # Changed
    fi
    
    return 1  # Not changed
}

update_file_cache() {
    local source_file="$1"
    local cache_file="$2"
    local relative_path="$3"
    
    # Create cache directory if it doesn't exist
    mkdir -p "$(dirname "$cache_file")"
    
    # Write current file data to cache
    {
        get_file_hash "$source_file"
        get_file_timestamp "$source_file"
        echo "$relative_path"
        date '+%Y-%m-%d %H:%M:%S'
    } > "$cache_file"
}

# Error handling
set -e  # Exit on error
trap 'log_error "Error occurred at line $LINENO. Exiting..."; exit 1' ERR

# Check if directories exist
log_step "Validating source directory..."
if [ ! -d "$SOURCE_DIR" ]; then
    log_error "Source directory $SOURCE_DIR does not exist"
    exit 1
fi
log_success "Source directory validated"

log_step "Validating Quartz project..."
if [ ! -d "$QUARTZ_PROJECT_DIR" ]; then
    log_error "Quartz project directory $QUARTZ_PROJECT_DIR does not exist"
    exit 1
fi

# Check if package.json exists in Quartz directory to validate it's a Quartz project
if [ ! -f "$QUARTZ_PROJECT_DIR/package.json" ]; then
    log_error "$QUARTZ_PROJECT_DIR does not appear to be a valid Quartz project (no package.json found)"
    exit 1
fi
log_success "Quartz project validated"

# Create necessary directories
log_step "Preparing temporary export directory..."
rm -rf "$TEMP_EXPORT_DIR"
mkdir -p "$TEMP_EXPORT_DIR"
mkdir -p "$CACHE_DIR"
log_success "Temporary directory ready"

# Copy files to temporary location (with change detection)
log_step "Copying files to temporary location..."
COPIED_COUNT=0
SKIPPED_COUNT=0

# Find all files in source directory
find "$SOURCE_DIR" -type f \( -name "*.md" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.webp" -o -name "*.svg" -o -name "*.mp4" -o -name "*.webm" -o -name "*.ogg" -o -name "*.pdf" \) | while read -r source_file; do
    # Calculate relative path
    relative_path="${source_file#$SOURCE_DIR/}"
    target_file="$TEMP_EXPORT_DIR/$relative_path"
    cache_file="$CACHE_DIR/$relative_path.cache"
    
    # Check if file has changed
    if is_file_changed "$source_file" "$cache_file" "$relative_path"; then
        # Create target directory
        mkdir -p "$(dirname "$target_file")"
        
        # Copy file
        cp -p "$source_file" "$target_file"
        
        # Update cache
        update_file_cache "$source_file" "$cache_file" "$relative_path"
        
        echo "COPIED: $relative_path"
    else
        echo "SKIPPED: $relative_path"
    fi
done

# Count results
COPIED_COUNT=$(find "$TEMP_EXPORT_DIR" -type f | wc -l)
log_success "Files processed: $COPIED_COUNT copied, $SKIPPED_COUNT skipped"

# Media files are now handled in the main file copying loop above

# Directory containing the files for processing
DIRECTORY="$TEMP_EXPORT_DIR"

# Process files in parallel using multiple cores
CORES=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
export CORES

log_step "Processing Excalidraw references..."
# First, rename .excalidraw.png files to .png (only if they exist)
if find "$DIRECTORY" -name "*.excalidraw.png" -type f | grep -q .; then
    find "$DIRECTORY" -name "*.excalidraw.png" -type f | while read -r file; do
        if [ -f "$file" ]; then
            # Get the directory and base name without .excalidraw.png
            dir=$(dirname "$file")
            basename=$(basename "$file" .excalidraw.png)
            new_name="$dir/$basename.png"
            
            # Rename the file
            mv "$file" "$new_name"
            log_info "Renamed: $(basename "$file") -> $(basename "$new_name")"
        fi
    done
fi

# Process only changed markdown files for Excalidraw references
PROCESSED_FILES=0
find "$DIRECTORY" -type f -name "*.md" | while read -r file; do
    if [ -f "$file" ]; then
        # Check if file needs processing by looking for .excalidraw.png references
        if grep -q "\.excalidraw\.png" "$file" 2>/dev/null; then
            # Store the original modification date
            original_date=$(stat -c %y "$file" 2>/dev/null || stat -f "%Sm" "$file")
            # Process the file - convert .excalidraw.png references to .png
            sed "s/\.excalidraw\.png/\.png/g" "$file" > "$file.tmp"
            mv "$file.tmp" "$file"
            touch -d "$original_date" "$file" 2>/dev/null || touch -t $(date -r "$original_date" "+%Y%m%d%H%M.%S") "$file"
            echo "PROCESSED: $file"
        fi
    fi
done

# Clean up .excalidraw.md files
find "$TEMP_EXPORT_DIR" -name "*.excalidraw.md" -type f -delete 2>/dev/null || true
log_success "Excalidraw references processed"

log_step "Processing markdown files..."
# Process only changed markdown files
PROCESSED_MD_COUNT=0
SKIPPED_MD_COUNT=0

# Find all markdown files and check which ones need processing
find "$DIRECTORY" -type f -name "*.md" | while read -r file; do
    if [ -f "$file" ]; then
        # Calculate relative path for cache lookup
        relative_path="${file#$DIRECTORY/}"
        cache_file="$CACHE_DIR/$relative_path.cache"
        
        # Check if this file was recently copied (indicating it needs processing)
        if [ -f "$cache_file" ]; then
            # Check if the cache was updated recently (within last few seconds)
            cache_age=$(($(date +%s) - $(stat -c %Y "$cache_file" 2>/dev/null || stat -f "%m" "$cache_file")))
            if [ "$cache_age" -lt 10 ]; then
                # File was recently copied, needs processing
                echo "PROCESS: $file"
            else
                # File is old, check if it needs processing by looking for patterns
                if grep -q -E '(\$\$[^$]*\$\$|!\[\[.*\.excalidraw\.png\]\])' "$file" 2>/dev/null; then
                    echo "PROCESS: $file"
                else
                    echo "SKIP: $file"
                fi
            fi
        else
            # No cache, process the file
            echo "PROCESS: $file"
        fi
    fi
done | while read -r action file; do
    if [ "$action" = "PROCESS" ] && [ -f "$file" ]; then
        # Store the original modification date
        original_date=$(stat -c %y "$file" 2>/dev/null || stat -f "%Sm" "$file")
        
        # Process the file with awk, handling both front matter and equations
        awk -v RS="" -v ORS="\n\n" -v FRONT_MATTER=0 -v P=0 '
        function process_equations(line,    equation, before_eq, after_eq) {
            while (match(line, /\$\$[^$]*\$\$/)) {
                equation = substr(line, RSTART+2, RLENGTH-4)
                before_eq = substr(line, 1, RSTART-1)
                after_eq = substr(line, RSTART+RLENGTH)
                
                if (length(before_eq) > 0) print before_eq
                print "$$\n" equation "\n$$" after_eq
                next
            }
            return line
        }
        
        function process_images(line) {
            # Process Obsidian image references to markdown format
            gsub(/!\[\[([^\]]*\.excalidraw)\.png\]\]/, "![[\\1.png]]", line)
            # Process image references to use relative paths
            # gsub(/!\[([^\]]*)\]\(([^)]*_Media[^)]*)\)/, "![\\1](\\2)", line)
            return line
        }
        
        NR == 1 && /^---$/ {
            FRONT_MATTER = 1
            print
            next
        }
        
        FRONT_MATTER && /^---$/ && FNR > 1 {
            P = 1
            FRONT_MATTER = 0
            print
            next
        }
        
        {
            if (!FRONT_MATTER || P) {
                $0 = process_equations($0)
                $0 = process_images($0)
                print $0 "  "
            } else {
                print
            }
        }' "$file" > "$file.tmp"
        
        mv "$file.tmp" "$file"
        touch -d "$original_date" "$file" 2>/dev/null || touch -t $(date -r "$original_date" "+%Y%m%d%H%M.%S") "$file"
        echo "PROCESSED: $file"
    elif [ "$action" = "SKIP" ]; then
        echo "SKIPPED: $file"
    fi
done

log_success "Markdown files processed"

log_step "Cleaning up paths..."
# Clean up paths only in files that contain "Public/" references
find "$DIRECTORY" -type f | while read -r file; do
    if [ -f "$file" ] && grep -q "Public/" "$file" 2>/dev/null; then
        original_date=$(stat -c %y "$file" 2>/dev/null || stat -f "%Sm" "$file")
        sed "s/Public\///g" "$file" > "$file.tmp"
        mv "$file.tmp" "$file"
        touch -d "$original_date" "$file" 2>/dev/null || touch -t $(date -r "$original_date" "+%Y%m%d%H%M.%S") "$file"
        echo "CLEANED: $file"
    fi
done
log_success "Paths cleaned up"

# Final step: Copy to Quartz content directory if specified differently
if [ "$QUARTZ_CONTENT_DIR" != "$SOURCE_DIR/content" ]; then
    log_step "Copying processed files to Quartz content directory..."
    mkdir -p "$QUARTZ_CONTENT_DIR"
    cp -r "$TEMP_EXPORT_DIR"/* "$QUARTZ_CONTENT_DIR"
    log_success "Files copied to Quartz content directory"
fi

# Build and deploy
log_step "Building Quartz site..."
cd "$QUARTZ_PROJECT_DIR"
if ! npx quartz build; then
    log_error "Failed to build Quartz site"
    exit 1
fi

log_success "Build completed successfully!"
