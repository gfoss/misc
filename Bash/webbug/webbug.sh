#!/bin/bash
# 
# ----------------------------------------
# LogRhythm Labs - Document Bugger
# greg.foss[at]logrhythm.com
# v0.1 - 2/25/2015
#
# This script simply automates the process of embedding webbugs in documents
# ----------------------------------------

# flat file with listing of documents to bug
file=$1
# server in the format: http://server.com/webbug-directory
server=$2

if [ -z $1 ]
then
   	echo "usage:"
   	echo "webbug.sh [file] [server]"
   	echo "	file	=> file.txt"
   	echo "	server	=> http://server/webbug-directory"
   	echo ""
   	exit 0;
fi

files=$(cat $file)
for doc in $files; do
	filename=$(echo $doc | cut -d"." -f1)
	ext=$(echo $doc | cut -d"." -f 2)
	if [ -f $doc ]
	then
		echo " [ + ] cloning $doc and injecting webbug into $filename-bugged.$ext"
		# webbug
		# this is really buggy and only works with HTML office documents... See here for more information: http://ha.ckers.org/webbug.html
		sed -e :a -e '$d;N;2,2ba' -e 'P;D' $doc >> $filename-bugged.$ext
		echo "<img src=\"$server/index.php?id=$filename&type=img\" width=\"1\" height=\"1\" />" >> $filename-bugged.$ext
		echo "</body>" >> $filename-bugged.$ext
		echo "</html>" >> $filename-bugged.$ext
	else
		echo " [ + ] no such file, creating $doc and injecting webbug"
		touch $doc
		# webbug
		echo "<html><head>" >> $doc
		echo "<link rel=\"stylesheet\" href=\"$server/index.php?id=$filename&type=css\">" >> $doc
		echo "</head></body>" >> $doc
		echo "<img src=\"$server/index.php?id=$filename&type=img\" width=\"1\" height=\"1\" />" >> $doc
		echo "</body></html>" >> $doc
	fi
done
echo ""
