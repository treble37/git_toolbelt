#!/bin/bash

set -e

git rev-list --reverse HEAD |
while read rev; do
	git log --oneline -1 $rev
	echo REV $rev;
	git ls-tree -r $rev |
	awk '{print $3}' |
	xargs git show |
	wc -l
done
