# LogRhythm Labs - Document Bugging
 
 greg.foss[at]logrhythm.com

 v0.1 - 2/25/2015

-----

#About

This script simply automates the process of embedding webbugs in documents.

#Howto
		usage:
		webbug.sh [file] [server]
			file	=> files.txt
			server	=> http://server/webbug-directory

		'file' is a file that contains a list of documents that you would like to either create+bug or just bug. These documents should be within the same directory as the script and file itself.

		'server' is the location of your webbug server installation. Do not add a trailing slash (/).

-----

#Webbug Server Parsing
		
SIEM parsing rules were developed to work with Webbugserver: https://bitbucket.org/ethanr/webbugserver

LogRhythm RegEX for Webbug Server:
		
		^ID=(?<objectname>.*?)\s+TYPE=(?<subject>.*?)\s+IP_ADDRESS=<sip>?\s+USER_AGENT=(?<object>.*?)?DATE

LogRhythm UDLA Query Settings:
		
		<?xml version="1.0"?><UDLAConfigParams><ConnectionType>0</ConnectionType><ConnectionString>Driver={MySQL ODBC 5.3 ANSI Driver};Name=webbugserver;Server=127.0.0.1;Port=3306;Database=webbug;User=adhd;Password=adhd;Option=3</ConnectionString><QueryStatement>SELECT id, type, ip_address, user_agent, from_unixtime( time) as date, time FROM requests LIMIT &lt;Max_Message_Count&gt;;</QueryStatement><OutputFormat>ID=&lt;id&gt; TYPE=&lt;type&gt; IP_ADDRESS=&lt;ip_address&gt; USER_AGENT=&lt;user_agent&gt; DATE=&lt;date&gt;</OutputFormat><UniqueIdentifierField>id</UniqueIdentifierField><MessageDateField>date</MessageDateField><StateFieldType>Increment</StateFieldType><StateField>time</StateField><StateFieldConversion>&lt;NONE&gt;</StateFieldConversion><GetUTCDateStatement>&lt;NONE&gt;</GetUTCDateStatement></UDLAConfigParams>