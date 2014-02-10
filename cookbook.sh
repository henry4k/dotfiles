#!/bin/sh
find src res -regextype posix-extended -regex '.+\.(cpp|h|nut)' | xargs -n 2 -- sed -ir 's/\t/    /g'

db="browsersupport_dm"
for table in $(echo "show tables;" | mysql -u root $db | tail -n +2); do
    echo "drop table $table;" | mysql -u root $db
done
