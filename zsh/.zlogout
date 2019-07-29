echo "push runtime_config"
cd ~/dkenv/runtime_config
git pull
git add .
git commit -m "logout"
git push origin master

cd ~/dkenv
git pull
git add .
git commit -m "logout"
git push origin master
echo "bye!"
