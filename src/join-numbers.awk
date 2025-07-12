#!/usr/bin/mawk -f

#
# Join numeric tokens with AWK
#
# Repository: https://github.com/fabiolimace/awk-tools/
#

function join_numbers(    i, n, x) {
	while (match($0, /[ ][0-9,.()-]+[ ][0-9,.()-]+[ ]?/)) {
		i = RSTART;
		n = RLENGTH;
		x = substr($0, i, n);
		gsub(" ", "", x);
		$0 = substr($0, 0, i-1) " " x " " substr($0, i+n)
	}
}

{
	join_numbers();
}

