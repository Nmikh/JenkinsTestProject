##command-jenkins- BUILD_ID=dontKillMe /var/lib/jenkins/workspace/HelloProject/src/main/resources/test-script.sh 9000

# COMMAND LINE VARIABLES
# deploy port SECOND ARGUMENT
# Ex: 8090 | 8091 | 8092
echo start

serverPort=$1
echo $1

#####
##### DONT CHANGE HERE ##############
#jar file
# $WORKSPACE is a jenkins var
echo $WORKSPACE
sourFile=$WORKSPACE/target/TestApp-1.0-SNAPSHOT.jar
echo $sourFile
destFile=/var/lib/jenkins/jobs/data/TestApp-1.0-SNAPSHOT.jar
echo $destFile
### FUNCTIONS
##############

#StopServer
echo insideStop
echo ” “
echo “Stoping process on port: $serverPort”
fuser -k $severport/tcp > redirection &
echo ” “

#DeleteFiles
echo “Deleting $destFile”
rm -rf $destFile

echo ” “

#CopyFiles
echo “Copying files from $sourFile”
cp $sourFile $destFile

echo ” “

#Run
#echo “java -jar $destFile –server.port=$serverPort $properties” | at now + 1 minutes

nohup nice java -jar $destFile –server.port=$serverPort

echo “COMMAND: nohup nice java -jar $destFile “

echo ” “