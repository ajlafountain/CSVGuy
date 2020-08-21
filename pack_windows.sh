#/bin/bash

PROJECT_NAME=$(basename $PWD)

#Check for and delete files and folders from passed runs
[ -f ${PROJECT_NAME}.zip ] && rm ${PROJECT_NAME}.zip
[ -d windows_release_tmp ] && rm -r windows_release_tmp
[ -d windows_release_tmp/app ] && rm -r windows_release_tmp/app

#Create folders and copy files
mkdir windows_release_tmp
mkdir windows_release_tmp/app
cp build_windows/*".dll" windows_release_tmp/app
cp build_windows/*".exe" windows_release_tmp/app
cp -r assets windows_release_tmp/app/assets

#Create launcher
cat << EOF > windows_release_tmp/app_launcher.bat
cd app
start $PROJECT_NAME.exe
exit
EOF

#Pack zip
mv windows_release_tmp ${PROJECT_NAME}
zip -rm ${PROJECT_NAME}.zip ${PROJECT_NAME}

