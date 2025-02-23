#! /bin/bash

# Configuration parameters
SOURCE_DIR="${SOURCE_DIR:-/c/Users/jdwh0/Obsidian/Lavafox}"                    # Source directory (default: Lavafox vault)
EXCALIDRAW_DIR="${EXCALIDRAW_DIR:-/c/Users/jdwh0/Obsidian/Lavafox/_Media/Excalidraw}"  # Directory containing Excalidraw files
TEMP_EXPORT_DIR="${TEMP_EXPORT_DIR:-/c/Users/jdwh0/Obsidian/temp}"            # Temporary export directory
QUARTZ_PROJECT_DIR="${QUARTZ_PROJECT_DIR:-/c/Users/jdwh0/Obsidian/quartzsite}" # Quartz project root directory
QUARTZ_CONTENT_DIR="${QUARTZ_CONTENT_DIR:-$QUARTZ_PROJECT_DIR/content}"       # Final output directory for Quartz

# Convert Windows paths to Unix-style for WSL compatibility
SOURCE_DIR=$(echo "$SOURCE_DIR" | sed 's/\\/\//g')
EXCALIDRAW_DIR=$(echo "$EXCALIDRAW_DIR" | sed 's/\\/\//g')
TEMP_EXPORT_DIR=$(echo "$TEMP_EXPORT_DIR" | sed 's/\\/\//g')
QUARTZ_PROJECT_DIR=$(echo "$QUARTZ_PROJECT_DIR" | sed 's/\\/\//g')
QUARTZ_CONTENT_DIR=$(echo "$QUARTZ_CONTENT_DIR" | sed 's/\\/\//g')

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
log_success "Temporary directory ready"

# Copy files to temporary location
log_step "Copying files to temporary location..."
cp -r -p "$SOURCE_DIR"/* "$TEMP_EXPORT_DIR"
log_success "Files copied to temporary location"

# Directory containing the files for processing
DIRECTORY="$TEMP_EXPORT_DIR"

# Process files in parallel using multiple cores
CORES=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
export CORES

log_step "Processing Excalidraw references..."
# Use parallel for Excalidraw processing
find "$DIRECTORY" -type f -print0 | parallel -0 -j "$CORES" '
    file={}
    if [ -f "$file" ]; then
        # Store the original modification date
        original_date=$(stat -c %y "$file" 2>/dev/null || stat -f "%Sm" "$file")
        # Process the file
        sed "s/.excalidraw/.excalidraw.png/g" "$file" > "$file.tmp"
        mv "$file.tmp" "$file"
        touch -d "$original_date" "$file" 2>/dev/null || touch -t $(date -r "$original_date" "+%Y%m%d%H%M.%S") "$file"
    fi
'
find "$TEMP_EXPORT_DIR" -name "*.excalidraw.md" -type f -delete
log_success "Excalidraw references processed"

log_step "Processing markdown files..."
# Process markdown files in parallel
find "$DIRECTORY" -type f -name "*.md" -print0 | parallel -0 -j "$CORES" '
    file={}
    if [ -f "$file" ]; then
        # Store the original modification date
        original_date=$(stat -c %y "$file" 2>/dev/null || stat -f "%Sm" "$file")
        
        # Process the file with awk, handling both front matter and equations
        awk -v RS="" -v ORS="\n\n" -v FRONT_MATTER=0 -v P=0 '"'"'
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
                print $0 "  "
            } else {
                print
            }
        }'"'"' "$file" > "$file.tmp"
        
        mv "$file.tmp" "$file"
        touch -d "$original_date" "$file" 2>/dev/null || touch -t $(date -r "$original_date" "+%Y%m%d%H%M.%S") "$file"
    fi
'
log_success "Markdown files processed"

log_step "Cleaning up paths..."
# Clean up paths in parallel
find "$DIRECTORY" -type f -print0 | parallel -0 -j "$CORES" '
    file={}
    if [ -f "$file" ]; then
        original_date=$(stat -c %y "$file" 2>/dev/null || stat -f "%Sm" "$file")
        sed "s/Public\///g" "$file" > "$file.tmp"
        mv "$file.tmp" "$file"
        touch -d "$original_date" "$file" 2>/dev/null || touch -t $(date -r "$original_date" "+%Y%m%d%H%M.%S") "$file"
    fi
'
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
