#!/usr/bin/env sh
AMZ_OUI="00:fc:8b 0c:47:c9 18:74:2e 34:d2:70 38:f7:3d 40:b4:cd 44:65:0d 50:f5:da 68:37:e9 68:54:fd 6c:56:97 74:75:48 74:c2:46 78:e1:03 84:d6:d0 88:71:e5 a0:02:dc ac:63:be b4:7c:9c f0:27:2d f0:d2:f1 fc:65:de
 fc:a1:83 fc:a6:67"
LAST=0
[ ! -z "$KEY" ] || exit 1
tcpdump -nel arp 2>/dev/null | while read line; do
  set -- $line
  if [ "${AMZ_OUI#*${2%%?????????}}" != "$AMZ_OUI" -a $(expr $(date +%s) - $LAST) -gt 2 ]; then
    LAST=$(date +%s)
    curl -s -X POST -H "Content-Type: application/json" -d "{\"value1\":\"$1\"}" https://maker.ifttt.com/trigger/$2/with/key/$KEY 2>&1 >/dev/null
  fi
done
