usage()

{   
    script=$1
    echo "Usage: `basename $script` $*" 1>&2 
    exit 2
}


#
#  A simple test for the above function
#

usage $0 filename username ...
