#!/bin/bash

if [ -d "./"$HUBOT_NAME ] 
then
	cd $HUBOT_NAME  
else
	mkdir $HUBOT_NAME
	cd $HUBOT_NAME
	yes | yo hubot --owner="Sky.Y.Chen <chenyanhasmail@gmail.com>" \
		--name="isoft" \
		--description="坚力软件" \
		--adapter=campfire \
		--defaults
		
        cp -f /package.json package.json
        npm install
        export HUBOT_QQ_ID=3060869034
	export HUBOT_QQ_PASS=password01
	export HUBOT_QQ_GROUP="坚力软件"
	# Don't deploy on Heroku		
	# sed -i '/hubot-heroku-keepalive/d' ./external-scripts.json
fi

bin/hubot -a qq

