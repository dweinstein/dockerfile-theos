#!/usr/bin/env sh

if [ -z "$1" ]
then
  echo "need device ip"
  exit 1
fi

/usr/bin/scp "root@$1":/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate .
/usr/bin/scp "root@$1":/Library/Frameworks/CydiaSubstrate.framework/Headers/CydiaSubstrate.h .

