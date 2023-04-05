#!/bin/bash

MODE=$(makoctl mode)
COUNT=$(makoctl list | jq ' .data[0] | length')
ENABLED=
DISABLED=
if [ $COUNT != 0 ]; then DISABLED=" $COUNT"; fi
if [ "$MODE" == "default" ]; then echo $ENABLED; else echo $DISABLED; fi
