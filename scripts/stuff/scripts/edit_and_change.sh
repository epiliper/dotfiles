#!/bin/bash
[ $# -eq 0 ] &&  echo "must supply an argument" && exit 1
[ $# -eq 1 ] &&  echo "must supply a write command" && exit 1
[ $# -eq 2 ] &&  echo "must supply a exec command" && exit 1

file="$1"
editcmd="$2"
runcmd="$3"

fname=$(basename $file)

chk="/tmp/${fname}.chk"

[ -f $chk ] || md5sum $file > $chk

$editcmd "$file"

# [ md5sum -c /tmp/${fname}.chk ] || $runcmd
md5sum -c $chk | grep -q OK || $runcmd
exit 0
