#!/bin/bash

mkdir repos_git
cd repos_git

repos=$(curl -s https://api.github.com/users/pcanabarro/repos | awk '/ssh_url/{print$2}' | sed 's/^"//g' | sed 's/",$//g')

for repo in $repos
    do
        git clone $repo
    done

