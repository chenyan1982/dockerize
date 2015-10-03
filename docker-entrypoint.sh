#!/bin/bash

mkdir $HUBOT_NAME
cd $HUBOT_NAME
yo hubot --owner="Sky.Y.Chen <chenyanhasmail@gmail.com>" \
	--name="yaya" \
	--description="丫丫机器人" \
	--adapter=campfire \
	--default

/bin/hubot
