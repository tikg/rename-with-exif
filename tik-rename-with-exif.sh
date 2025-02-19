#!/bin/bash

# Check if the file extension is provided
if [ -z "$1" ]; then
  echo "Usage: ./rename_photo.sh <extension>"
  exit 1
fi

# Define the file extension (case-insensitive)
extension="$1"
target_dir="_exif_renamed"

# Create the target directory if it doesn't exist
mkdir -p "$target_dir"

# tik added
ls -lh *.${1}

# Loop through all files with the specified extension
for file in *."$extension"; do
  # Skip if no files are found
  if [ ! -f "$file" ]; then
    continue
  fi

  # Run exiftool and capture the output
  output=$(exiftool -CreateDate -Make "$file")

  # Extract the CreateDate and Make fields
  create_date=$(echo "$output" | grep "Create Date" | awk -F': ' '{print $2}')
  make=$(echo "$output" | grep "Make" | awk -F': ' '{print $2}')

  # Format the date and time
  formatted_date=$(echo "$create_date" | sed 's/://g' | sed 's/ /_/g' | cut -c1-13)

  # Create the new filename
  new_filename="${formatted_date}_${make}.${extension}"

  # Move the file to the target directory with the new name
  mv "$file" "$target_dir/$new_filename"

  echo "Renamed and moved: $file -> $target_dir/$new_filename"
  
  # repeat command but redirect to log file
  echo "Renamed and moved: $file -> $target_dir/$new_filename" >> $(date +"%Y-%m-%d_%H00_%Z")-rename-with-exif.log

done

echo "All files processed and moved to $target_dir."

ls -lh $target_dir/*.${1}
