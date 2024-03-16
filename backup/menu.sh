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
	local options=('file' 'directory' 'back' 'quit')
	select opt in "${options[@]}"; do
		case $opt in 
			'file')
				echo 'file operation'
				;;
			'directory')
				echo 'directory operation'
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
