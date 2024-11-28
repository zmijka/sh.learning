#!/usr/bin/env bash
#===============================================================================
#
#          FILE: V.sh
#
#         USAGE: see ./V.sh -v
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: zmijka, 
#       CREATED: 09.12.2023 23:09:47
#      REVISION: 0.1
#===============================================================================

function usage(){
	printf "Usage: $0 [Options [parameters]]\n"
    printf "\n"
    printf "Options:\n"
    printf " -r [name VM]		run VM\n"
    printf " -l     			list avalable VMs\n"
    printf " -lr     			list running VMs\n"
	printf " -h     			this help\n"

return 0
}


while [ ! -z "$1" ];do
	case "$1" in
    	
		-h)
        	shift
			usage
        	;;

        -r)
        	shift
			VBoxManage startvm $1 --type=headless
			echo "Uruchamiam $1"	
			;;

        -l)
       		shift
			echo "List all VMs:"
         	VBoxManage list vms | cut -d '"' -f 2
 			;;

		-lr)
			shift
			echo "List running VMs:"
			VBoxManage list vms runningvms | cut -d '"' -f 2
			;;
        
		-lab)
			shift
			echo "Uruchamiam LAB"
			;;
		*)
			echo "Incorrect input provided"
			usage

		esac
	shift
done
