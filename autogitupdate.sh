#!/bin/zsh
cd ~
cd ~/runtime_config/
git status
git add .
git commit -m "test"
git push origin master
cd ~/mymanual
git status
git add .
git commit -m "test"
git push origin master
