Twofishes Docker Image
======================

Docker image that runs Foursquare's Twofishes server with prebuilt index files.

Exposes ports: 8080, 8081, 8082, 8083


Instruction to run an hosted build
------------------

docker run -d heyman/twofishes


Instructions to build
---------------------

set the wanted versions in build.sh
run ./build.sh

the build script will do the following things:
- downloads both the Twofishes binary jar file and the prebuilt index files and
adds them to the same directory as the Dockerfile. The prebuilt index files is 
unzipped first.

The following files are downloaded:
1. server-assembly-0.84.9.jar (downloaded from http://twofishes.net/binaries/server-assembly-0.84.9.jar)
2. 2015-03-05-20-05-30.753698 (unzipped from http://twofishes.net/indexes/revgeo/2015-03-05.zip)


Instruction to run your build
------------------

docker run -d twofishes:server_0.84.9-index_2015-03-05

use -P to automatically map all the exposed ports
