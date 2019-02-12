#!/bin/bash
echo "This is the data passed from the user"
echo "------------------------------------------"
echo $repo


echo "Cloning the git repo - must be accessable"
echo "------------------------------------------"
git clone $repo files


echo "Copying all the files in the git repo"
echo "------------------------------------------"
cp -r ./files/* .
cp -r ./files/* ./etmain .

echo ""
echo "Starting the server..."
echo "------------------------------------------"
sh ./startScript.sh