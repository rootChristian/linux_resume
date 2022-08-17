#!/usr/bin/awk -f
BEGING {sum=0}
{sum=sum+$7}
END {print sum}
