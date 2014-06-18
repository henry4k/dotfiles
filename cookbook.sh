#!/bin/sh
# Praktische und coole Shell-Scripte

# Tabs mit Leerzeichen vielen Dateien ersetzen:
find src res -regextype posix-extended -regex '.+\.(cpp|h|nut)' | xargs -n 2 -- sed -ir 's/\t/    /g'

# Alle Tables einer Datenbank dropppen:
db="browsersupport_dm"
for table in $(echo "show tables;" | mysql -u root $db | tail -n +2); do
    echo "drop table $table;" | mysql -u root $db
done

# Alle Customer Namen aus einem gitweb Server auslesen:
curl 'xgit/' 2>/dev/null | perl -ne '/href="\/\?p=(.+?)\.git/g; print $1,"\n"' | perl -ne '/customer\/(.+?)\//; print $1,"\n"' | uniq

# Praktisch für download scripte:
xargs -n 1 -E x youtube-dl
# ^- Einfach URLs pasten und 'x' schreiben um einen Batch abzuarbeiten.

# Dateien eines Baums der größe nach sortiert anzeigen
find . -printf '%s %p\n' | sort -n | less
