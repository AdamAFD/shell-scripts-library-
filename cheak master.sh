#! /bin/bash

    echo "enter project dir"
    PROJECT_DIR=$1
     
    echo "enter target branch"
    TARGET_BRANCH=$2

    echo "enter  remote project url"
    PROJECT_REMOTE_URL=$3

    
    if [[ -d $PROJECT_DIR ]]
    then
        cd $PROJECT_DIR  
        git checkout $TARGET_BRANCH
        is_exist=$(echo $?)
        if [[ $is_exist -eq 0 ]]
        then
            git rev-list HEAD > branch_commit.txt #List commits
            remote_branch_sha=$(git ls-remote $PROJECT_REMOTE_URL HEAD | awk '{ print $1}')
            if grep -Fxq "$remote_branch_sha"  ./branch_commit.txt
            then
                echo "Your local repo already up to date."
            else
                echo "Your local repo is not up to date, please pull the new change on remote repo."
            fi
        else
            echo "Wrong branch name."
        fi

    else
        echo"this directory does not exist, please clone the project to your local system then pass its dir path."
    fi        
