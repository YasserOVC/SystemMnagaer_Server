#!/bin/bash


# Main function file_dir
file_dir (){
local options=("Create a file" "Copy a file/directory" "Move a file/directory" "Rename a file/directory" "Delete a file/directory" "Exit"\)
PS3\="Please enter your choice\: "
select opt in "<span{options[@]}"; do
    case $opt in
      "Create a file")
        create_file
        ;;
      "Copy a file/directory")
        copy_file_dir
        ;;
      "Move a file/directory")
        move_file_dir
        ;;
      "Rename a file/directory")
        rename_file_dir
        ;;
      "Delete a file/directory")
        delete_file_dir
        ;;
      "Exit")
        exit 0
        ;;
      *)
        echo "Invalid option: $REPLY"
        ;;
    esac
  done
}

# Function to create a file
create_file() {
  get_input "Enter filename (including path): " filename
  touch "$filename"
  if [[ $? -eq 0 ]]; then
    echo "File '$filename' created successfully."
  else
    echo "Failed to create file '$filename'."
  fi
}

# Function to copy a file/directory
copy_file_dir() {
  get_input "Enter source file/directory path: " source
  get_input "Enter target directory path: " target
  if [[ -f "$source" ]]; then
    cp "$source" "$target"
  elif [[ -d "$source" ]]; then
    cp -r "$source" "$target"
  else
    echo "Error: Source '$source' does not exist or is not a file/directory."
    return 1
  fi
  if [[ $? -eq 0 ]]; then
    echo "Copied '$source' to '$target' successfully."
  else
    echo "Failed to copy '$source' to '$target'."
  fi
}

# Function to move a file/directory
move_file_dir() {
  get_input "Enter source file/directory path: " source
  get_input "Enter target directory path: " target
  if [[ -f "$source" ]]; then
    mv "$source" "$target"
  elif [[ -d "$source" ]]; then
    mv -r "$source" "$target"
  else
    echo "Error: Source '$source' does not exist or is not a file/directory."
    return 1
  fi
  if [[ $? -eq 0 ]]; then
    echo "Moved '$source' to '$target' successfully."
  else
    echo "Failed to move '$source' to '$target'."
  fi
}

# Function to rename a file/directory
rename_file_dir() {
  get_input "Enter file/directory path: " path
  get_input "Enter new name: " new_name
  mv "$path" "$path/$new_name"
  if [[ $? -eq 0 ]]; then
    echo "Renamed '$path' to '$path/$new_name' successfully."
  else
    echo "Failed to rename '$path'."
  fi
}

# Function to delete a file/directory
delete_file_dir() {
  get_input "Enter file/directory path: " path
  read -p "Are you sure you want to delete '$path' (y/N)? " confirm
  if [[ "<span class="math-inline">confirm" \=\~ ^\[Yy\]</span> ]]; then
    if [[ -f "$path" ]]; then
      rm "$path"
    elif [[ -d "$path" ]]; then
      rm -rf "$path"
    else
      echo "Error: Path '$path' does not exist or is not a file/directory."
      return 1
    fi
    if [[ $? -eq 0 ]]; then
      echo "Deleted '$path' successfully."
    else
      echo "Failed to delete '$path'."
    fi
  fi
}



