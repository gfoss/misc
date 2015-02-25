# [LogRhythm Labs - Document Bugger]
 
 greg.foss[at]logrhythm.com

 v0.1 - 2/25/2015

-----

#[About]

This script simply automates the process of embedding webbugs in documents...

#[Howto]
		usage:
		webbug.sh [file] [server]
			file	=> files.txt
			server	=> http://server/webbug-directory

		'file' is a file that contains a list of documents that you would like to either create+bug or just bug. These documents should be within the same directory as the script and file itself.

		'server' is the location of your webbug server installation. Do not add a trailing slash (/).

-----

#[Webbug Server Parsing]
		
SIEM parsing rules developed to integrate Webbugserver into LogRhythm: https://bitbucket.org/ethanr/webbugserver

LogRhythm RegEX for Webbug Server:
		
		^ID=(?<objectname>.*?)\s+TYPE=(?<subject>.*?)\s+IP_ADDRESS=<sip>?\s+USER_AGENT=(?<object>.*?)?DATE

LogRhythm UDLA Query Settings:
		
		<?xml version="1.0"?><UDLAConfigParams><ConnectionType>0</ConnectionType><ConnectionString>Driver={MySQL ODBC 5.3 ANSI Driver};Name=webbugserver;Server=127.0.0.1;Port=3306;Database=webbug;User=adhd;Password=adhd;Option=3</ConnectionString><QueryStatement>SELECT id, type, ip_address, user_agent, from_unixtime( time) as date, time FROM requests LIMIT &lt;Max_Message_Count&gt;;</QueryStatement><OutputFormat>ID=&lt;id&gt; TYPE=&lt;type&gt; IP_ADDRESS=&lt;ip_address&gt; USER_AGENT=&lt;user_agent&gt; DATE=&lt;date&gt;</OutputFormat><UniqueIdentifierField>id</UniqueIdentifierField><MessageDateField>date</MessageDateField><StateFieldType>Increment</StateFieldType><StateField>time</StateField><StateFieldConversion>&lt;NONE&gt;</StateFieldConversion><GetUTCDateStatement>&lt;NONE&gt;</GetUTCDateStatement></UDLAConfigParams>

#[License]

Copyright (c) 2015, Greg Foss All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. Neither the name of Greg Foss nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.