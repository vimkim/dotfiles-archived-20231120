echo "push runtime_config"
cd ~/dkenv/runtime_config
git add .
git commit -m "logout"
git push origin master

cd ~/dkenv
git add .
git commit -m "logout"
git push origin master
echo "bye!"
