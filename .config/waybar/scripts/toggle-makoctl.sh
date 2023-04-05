MODE=$(makoctl mode)
if [ "$MODE" == "paused" ]; then makoctl mode -s default; fi
if [ "$MODE" == "default" ]; then makoctl mode -s paused; fi
