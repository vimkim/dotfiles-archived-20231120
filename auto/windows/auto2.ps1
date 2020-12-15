echo "baekjoon"

cd $env:homepath\Documents\Github\baekjoon
git pull
git add .
git commit -m "."
git push

read-host -prompt "press enter to exit"