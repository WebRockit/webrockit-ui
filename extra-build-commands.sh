#!/bin/sh

# include any additional steps that need to be followed, just prior to building the rpm here
# this script will be run from the target build target path

PROBLEMS=0
OLDPWD=`pwd`

mkdir -p ./etc/init.d
mv ./opt/webrockit-ui/ext/webrockit-ui.init ./etc/init.d/webrockit-ui
chmod 755 ./etc/init.d/webrockit-ui
cp ./opt/webrockit-ui/config/config.yml.example .
rm -rf ./opt/webrockit-ui/config/*
mv config.yml.example ./opt/webrockit-ui/config/config.yml

if [ $? -ne 0 ]
then
    PROBLEMS=99
fi
cd ${OLDPWD}

if [ ${PROBLEMS} -ne 0 ]
then
    exit 1
else
    exit 0
fi
