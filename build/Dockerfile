FROM library/java:openjdk-7-jdk
MAINTAINER Marco Bernasocchi <marco@opengis.ch>

# Add versions files
COPY versions.txt /twofishes/versions.txt

# Add (extracted) index directory
COPY index /twofishes/index

# Add server binary
COPY server-assembly.jar /twofishes/server-assembly.jar

EXPOSE 8080 8081 8082 8083
CMD java -xm2048 -jar /twofishes/server-assembly.jar --hfile_basepath /twofishes/index
