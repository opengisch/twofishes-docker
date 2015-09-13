#!/bin/bash

###########CONFIGURE HERE###############

INDEX_VERSION="2015-03-05"
SERVER_ASSEMBLY_VERSION="0.84.9"

###########END CONFIGURE HERE###########

SERVER_ASSEMBLY="server-assembly-$SERVER_ASSEMBLY_VERSION"

#get the dependencies
wget -c http://twofishes.net/binaries/$SERVER_ASSEMBLY.jar
wget -c http://twofishes.net/indexes/revgeo/$INDEX_VERSION.zip

#keep original server zip to avoid redownload
cp $SERVER_ASSEMBLY.jar build/server-assembly.jar 

#unzip index file to build/index folder removing unneeded sublevel 
unzip -d index $INDEX_VERSION.zip
INDEX_EXTRACT_VERSION=("index"/*)
mkdir build/index/
mv -f $INDEX_EXTRACT_VERSION/ build/index/
rmdir index

#create text file vit used versions
echo $SERVER_ASSEMBLY > build/versions.txt
echo $INDEX_EXTRACT_VERSION >> build/versions.txt

RUN_CMD="java -Xmx2048m -jar build/server-assembly --hfile_basepath build/index/"
echo "To manually run execute:"
echo $RUN_CMD
#$RUN_CMD

cd build
echo "docker build -t ""twofishes:server_$SERVER_ASSEMBLY_VERSION-index_$INDEX_VERSION"" ."
