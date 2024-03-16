#!/bin/bash



d=0
f=0
g=0
date=$(date)

# define functions for ach menu
function main_menu () {
	local PS3="please enter your choice : "
	local options=('foperation' 'soperation' 'log' 'quit')
	select opt in "${options[@]}"; do
		case $opt in 
			'foperation')
				echo 'file\directory operation'
				foperation
				;;
			'soperation')
				echo 'service\system operation'
				soperation
				;;
			'log')
				echo 'this program log'
				;;
			"quit")
				exit 0
				;;
			*)
				echo " Invalid option: $REPLY "
				;;
		esac
	done						
}

############################################################################################################3

# function for File Directory operation
function foperation () {
	local PS3="please enter your choice : "
	local options=('man file_dir' 'search fie_dir' 'back' 'quit')
	select opt in "${options[@]}"; do
		case $opt in 
			'man file_dir')
				echo '	'
				echo 'file_dir operation'
				file_dir
				;;
			'search file_dir')
				echo 'search file\dir'
				;;
			'back')
				main_menu
				;;
			"quit")
				exit 0
				;;
			*)
				echo " Invalid option: $REPLY "
				;;
		esac
	done						
}



# Main function file_dir
function file_dir (){
	local options=("Create a file" "Create a directory" "Copy a file/directory" "Move a file/directory" "Rename a file/directory" "Delete a file/directory" "back" "Exit")
	local PS3="Please enter your choice: "
	select opt in "${options[@]}"; do
	    	case $opt in
      			"Create a file")
        		create_file
        		;;
			"Create a directory")
			create_dir
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
			"back")
			foperation	
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
function create_file() {
  	read -p "Enter filename (including path): " filename
  	touch " $fileame"
	if [[ $? -eq 0 ]]; then
	  echo "File '$filename' created successfully."
  	else
    	  echo "Failed to create file '$filename'."
  	fi
}


# Function to create a file
function create_dir() {
  	read -p "Enter filename (including path): " dirname
  	mkdir "$filename"
  	if [[ $? -eq 0 ]]; then
    	  echo "Directory '$filename' created successfully."
  	else
    	  echo "Failed to create directory '$dirname'."
  	fi
}

# Function to copy a file/directory
function copy_file_dir() {
  	read -p "Enter source file/directory path: " source
  	read -p "Enter target directory path: " target
  	if [[ -f "$source" ]]; then
    	  cp "$source" "$target"
  	elif [[ -d "$source" ]]; then
    	  cp -r "$source" "$target"
  	else
    	  echo "Error: Source '$source' does not exist or is not a file/directory."
    	  return 1
  	fi
  	if [[ $? -eq 0 ]]; then
    	  echo "Copied $source to $target successfully."
  	else
    	  echo "Failed to copy $source to $target ."
 	fi
}

# Function to move a file/directory
function move_file_dir() {
  	read -p "Enter source file/directory path: " source
  	read -p "Enter target directory path: " target
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
function rename_file_dir() {
  	read -p "Enter file/directory path: " path
  	read -p "Enter new name: " new_name
  	  mv "$path" "$path/$new_name"
  	if [[ $? -eq 0 ]]; then
    	  echo "Renamed '$path' to '$path/$new_name' successfully."
  	else
    	  echo "Failed to rename '$path'."
  	fi
}


# Function to delete a file/directory
function delete_file_dir() {
  read -p "Enter file/directory path: " path
  read -p "Are you sure you want to delete '$path' (y/N)? " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
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





############################################################################################################

# function for serivce and system operatioon
function soperation () {
	local PS3="please enter your choice : "
	local options=('service' 'system' 'back' 'quit')
	select opt in "${options[@]}"; do
		case $opt in 
			'service')
				echo 'service operation'
				;;
			'system')
				echo 'system operation'
				bash syscar.sh
				system
				;;
			'back')
				main_menu
				;;
			"quit")
				exit 0
				;;
			*)
				echo " Invalid option: $REPLY "
				;;
		esac
	done						
}


# define funtion for system monitor
function system () {
	local PS3="please enter your choice : "
	local options=('CPUMonitor' 'MemoryMonitor' 'DiskSpaceUsage' 'back' 'saveLOG')
	select opt in "${options[@]}"; do
		case $opt in 
			'CPUMonitor')
				echo '	'
					echo 'service operation'
					echo "	"
					top -n 1 -b
					d=1
					echo '	'
					echo '	'
					system
					;;
				'MemoryMonitor')
					echo '	'
					echo 'system operation'
					echo "	"
					free
					f=1
					echo '	'
					echo '	'
					system
					;;
				'DiskSpaceUsage')
					echo '   '
					echo 'Here is yoour Disks Info'
					df -hT
					g=1
					echo '	'
					echo '  '
					system
					;;	
				'back')
					main_menu
					;;
				"saveLOG")
					echo "Logs Saved ......"
					# for CPU
					if [[ $d -eq 1 ]]; then
						echo "CPU cahr Saved $d "
						date >>LOG
						uptime >> LOG
						top -n 1 -b >> LOG
						d=0
						echo "point $date saved, var is $d " 
						echo '	'
					fi	
					# for memory
					if [[ $f -eq 1 ]]; then
						echo "Memory char saved $f "
						date >>LOG
						uptime >> LOG
						free >> LOG
						f=0
						echo "point $date saved, var is $f "
						echo '	'
					fi	
					# for disk
					if [[ $g -eq 1 ]]; then
						echo "Disk cahr saved $g " 
						date >>LOG
						uptime >> LOG
						df -hT >> LOG
						g=0
						echo "point $date saved, va is $g"
						echo '	'
					fi
					;;
				*)
					echo " Invalid option: $REPLY "
					;;
			esac
		done	
	}


###########################################################################################################

# call the main menu
main_menu
