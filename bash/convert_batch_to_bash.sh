#!/bin/bash

# Create output directory if it doesn't exist
mkdir -p bash_scripts

# Process each .bat file in the bash directory
for bat_file in bash/*.bat; do
    # Skip if no .bat files found
    [ -e "$bat_file" ] || continue
    
    # Get the base filename without extension
    base_name=$(basename "$bat_file" .bat)
    
    # Create the output .sh file
    echo "Converting $bat_file to bash_scripts/${base_name}.sh"
    
    # Add shebang and convert the content
    echo '#!/bin/bash' > "bash_scripts/${base_name}.sh"
    echo '' >> "bash_scripts/${base_name}.sh"
    
    # Convert Windows paths to Unix paths and clean up the content
    sed 's/\/\//\//g' "$bat_file" | \
    tr -d '\r' | \
    sed 's|^vcpkg|./vcpkg.exe|' | \
    sed 's/^@/# /' | \
    sed 's/^REM /\# /' | \
    sed 's/^rem /\# /' | \
    sed 's/^pause$/\# pause/' | \
    sed 's/^::/\# /' | \
    sed 's/^echo /\# echo /' | \
    sed 's/^set /\# set /' | \
    sed 's/^cd /\# cd /' | \
    sed 's/^pushd /\# pushd /' | \
    sed 's/^popd/\# popd/' | \
    sed 's/^if /\# if /' | \
    sed 's/^for /\# for /' | \
    sed 's/^in /\# in /' | \
    sed 's/^do /\# do /' | \
    sed 's/^done/\# done/' | \
    sed 's/^%/\$/' >> "bash_scripts/${base_name}.sh"
    
    # Make the script executable
    chmod +x "bash_scripts/${base_name}.sh"
done

echo "Conversion complete. Bash scripts are in the bash_scripts directory."
