##chmod +x /var/lib/jenkins/workspace/TestApp/src/main/resources/test-script.sh
#BUILD_ID=dontKillMe /var/lib/jenkins/workspace/TestApp/src/main/resources/test-script.sh
##command-jenkins:: BUILD_ID=dontKillMe /var/lib/jenkins/workspace/HelloProject/src/main/resources/test-script.sh

echo start

echo $WORKSPACE
sourFile=$WORKSPACE/target/TestApp-1.0-SNAPSHOT.jar
echo $sourFile
destFile=/var/lib/jenkins/jobs/data/TestApp-1.0-SNAPSHOT.jar
echo $destFile

#StopServer
echo insideStop
echo ” “
echo “Stoping process on port: 9050”
fuser -k 9050/tcp > redirection &
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

nohup nice java -jar $destFile –server.port=9050 &

echo “COMMAND: nohup nice java -jar $destFile “

echo ” “