#!/bin/sh

print_help() {
    echo "Usage : shelfsorter [-p|-s {i|n|v|l|b|h}]"
    echo "Used primarily for sorting furniture data with"
    echo "FILE as underlying data."
    echo "  -p 	  	print data contents and exit"
    echo "  -s	  	sort by additional argument: id (i),"
    echo "	       	 name (n), weight (w), length (l),"
    echo "	      	 width (b), height (h), print data"
    echo "	      	 contents and exit"
    echo "  --help  display this help and exit"
}

print_file() {
    echo "ID      Namn            Vikt    L       B       H"
    while read line; do
        echo "$line"
    done
}

sort_file() {
    echo "ID      Namn            Vikt    L       B       H"
    case $1 in
        i) sort -t "	" -n # Delimiter ",". Numeriskt
			;;
        n) sort -t "	" -k 2 # Sorterar med kolumn 2 som nyckel
        	;;
        v) sort -t "	" -n -k 3
        	;;
        l) sort -t "	" -n -k 4
        	;;
        b) sort -t "	" -n -k 5
        	;;
        h) sort -t "	" -n -k 6
        	;;
        *) clear
           echo "Ogiltig attribut !"
        	;;
    esac
}

# main
while getopts "ps:-:" opt; do # ":" kräver värden
    case $opt in
        -) case "${OPTARG}" in
            	help)
                	print_help
                	exit
                	;;
        	esac
        	;;
    	p) print_file
            exit
		    ;;
        s) sort_file "${OPTARG}"
            exit
            ;;
        *) echo "Ogiltigt tillval!"
            ;;
    esac
done