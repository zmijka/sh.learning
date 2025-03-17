#!/usr/bin/env bash
#===============================================================================
#
#          FILE: V.sh
#
#         USAGE: ./V.sh
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
	printf "Usage: $0 Options arg1 [arg2 ...]\n"
    printf "\n"
    printf "Options:\n"
    printf " -r [name VM]		run VM\n"
    printf " -l     		list avalable VMs\n"
    printf " -lr     		list running VMs\n"
	printf " -h     		this help\n"

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

			if [ "$#" -lt 1 ]; then
  				usage
	    		exit 1
			fi

			# DEFAULT_ARG="$0"
			# echo $DEFAULT_ARG
			# shift
			# size_t="$#"
			# echo $size_t

			for arg in "$@"
			do
				VBoxManage startvm $arg --type=headless
				echo $arg
			done


# for k in `seq 0 $[roztab2-1]`
# do
#         echo -n ${tab2[$k]}
# done

			shift

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

        *)
			echo "Incorrect input provided"
			usage

		esac
	shift
done
