#!/usr/bin/env sh
AMZ_OUI="00:fc:8b 0c:47:c9 18:74:2e 34:d2:70 38:f7:3d 40:b4:cd 44:65:0d 50:f5:da 68:37:e9 68:54:fd 6c:56:97 74:75:48 74:c2:46 78:e1:03 84:d6:d0 88:71:e5 a0:02:dc ac:63:be b4:7c:9c f0:27:2d f0:d2:f1 fc:65:de
 fc:a1:83 fc:a6:67"
LAST=0
[ ! -z "$DATE" ] || DATE=%F_%T%z
[ ! -z "$KEY" ] || exit 1
tcpdump -nel arp 2>/dev/null | while read line; do
  set -- $line
  if [ "${AMZ_OUI#*${2%%?????????}}" != "$AMZ_OUI" -a $(expr $(date +%s) - $LAST) -gt 2 ]; then
    LAST=$(date +%s)
    curl -s -X POST -H "Content-Type: application/json" -d "{\"value1\":\"$(date +"$DATE")\"}" https://maker.ifttt.com/trigger/$2/with/key/$KEY 2>&1 >/dev/null
    [ "$QUIET" == "1" ] || date +"$DATE $2"
    [ "$MUSIC" != "1" ] || (beep -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f659.25 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f587.33 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f523.25 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f493.88 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f440.00 -l120 -d0 -n -f523.25 -l120 -d0 -n -f493.88 -l120 -d0 -n -f440.00 -l120 -d0 -n -f1 -l0 -D120 -n -f1 -l0 -D120 -n -f659.25 -l120 -d0 -n -f1 -l0 -D120 -n -f880.00 -l120 -d0 -n -f1 -l0 -D120 -n -f1 -l0 -D120 -n -f1 -l0 -D120 -n -f1 -l0 -D120 -n -f1 -l0 -D120 -n -f1 -l0 -D120 -n -f1 -l0 -D120 && beep -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f659.25 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f587.33 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f523.25 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f493.88 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f329.63 -l120 -d0 -n -f415.30 -l120 -d0 -n -f440.00 -l120 -d0 -n -f466.16 -l120 -d0 -n -f493.88 -l120 -d0 -n -f523.25 -l120 -d0 -n -f554.37 -l120 -d0 -n -f587.33 -l120 -d0 -n -f622.25 -l120 -d0 -n -f659.25 -l120 -d0 -n -f698.46 -l120 -d0 -n -f739.99 -l120 -d0 -n -f783.99 -l120 -d0 -n -f830.61 -l120 -d0 -n -f880.00 -l120 -d0 &)
  fi
done
