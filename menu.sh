#!/bin/bash

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


# call the main menu
main_menu
