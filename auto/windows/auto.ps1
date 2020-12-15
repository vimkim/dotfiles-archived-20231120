# use Windows Task Scheduler
# action: powershell.exe %homepath%\dkenv\runtime_config\auto\windows\auto.ps1
# don't forget to sign in github credential.

echo "runtime config && dkenv"

cd $env:homepath\dkenv\runtime_config
git pull
git add .
git commit -m "."
git push

cd $env:homepath\dkenv
git pull
git add .
git commit -m "."
git push

# Write-Host -NoNewLine 'Press any key to continue...';
# $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');