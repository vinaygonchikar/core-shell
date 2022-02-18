#!/bin/bash
set -e
#pass the file path of .github & repo url while executing script 
##clone the repository that passes as a input while execting
git clone $2
##get the folder name from git url
FOLDER_NAME=$(echo $2 | cut -d'/' -f5 | cut -d'.' -f1)
cd $FOLDER_NAME
NO_BRANCH_COUNT=$(git branch -a | wc -l)
echo "number of branches in this repository is '$NO_BRANCH_COUNT"
echo "path of workflow is $1"
echo "project url is $2"


COUNT=3
while [ $c -le $NO_BRANCH_COUNT ]
do
	echo "Welcone $COUNT branch"
    BRANCH_NAME=$(git branch -a | head -$COUNT | cut -d'/' -f3 | tail -1)
    echo "target branch is $BRANCH_NAME"
    git checkout $BRANCH_NAME
    cp $1 .
    git add .
    git commit -m "add files requires for GitHub action"
    git push
	(( COUNT++ ))
done


