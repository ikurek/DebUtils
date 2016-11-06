#!/usr/bin/env bash

echo ""
echo ""
echo "CleanPPAs - Uruchom z parametrem --delete aby automatycznie usunąć nieużywane źródła"
echo ""
echo ""

for f in /etc/apt/sources.list.d/*.list; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" "$f" | while read -r ENTRY ; do
    echo "Wpis: $ENTRY"
        HOST=$(cut -d/ -f3 <<< "$ENTRY")

        if [ "ppa.launchpad.net" = "$HOST" ]; then
          USER=$(cut -d/ -f4 <<< "$ENTRY")
          PPA=$(cut -d/ -f5 <<< "$ENTRY")
          packageCount=$(awk '$1=="Package:" {if (a[$2]++ == 0) {system("dpkg -l "$2)}}' /var/lib/apt/lists/*"$USER"*"$PPA"*Packages 2>/dev/null | awk '/^ii/' | wc -l)
          echo "PPA: ppa:$USER/$PPA"
          echo "Nazwa: $f"
          echo "$packageCount pakietów zainstalowanych"
          if [ "$packageCount" -eq 0 ] && [ "$1" == "--delete" ]; then
            sudo rm "$f" && echo "$f usunięty"
          fi
          echo
        else 
          USER=$(cut -d/ -f3 <<< "$ENTRY")
          PPA=$(cut -d/ -f4 <<< "$ENTRY")
          packageCount=$(awk '$1=="Pakiet:" {if (a[$2]++ == 0) {system("dpkg -l "$2)}}' /var/lib/apt/lists/*"$USER"*Packages 2>/dev/null | awk '/^ii/' | wc -l)
          echo "REPO: $USER/$PPA"
          echo "Nazwa: $f"
          echo "$packageCount pakietów zainstalowanych"
          if [ "$packageCount" -eq 0 ] && [ "$1" == "--delete" ]; then
            sudo rm "$f" && echo "$f usunięty" 
          fi
          echo
        fi
    done
done

echo "Koniec!"
echo ""
echo ""
