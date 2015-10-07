#!/bin/bash

mkdir $HUBOT_NAME
cd $HUBOT_NAME
yo hubot --owner="Sky.Y.Chen <chenyanhasmail@gmail.com>" \
	--name="iSoft" \
	--description="丫丫机器人" \
	--adapter=campfire \
	--default
	
sed -i '/hubot-heroku-keepalive/d' external-scripts.json

echo $(pwd)
echo $(ls)
cd bin
echo $(ls)
hubot
