#!/bin/bash
SUITE=0
COVERAGE=3764

for i in $* ; do
  ./pngtest ./large-png-suite/$i.png
done

# capture the last line of the output
output=$(gcov *.c)
lastline=$(echo $output | tail -1)

# get the percentage coverage
readarray -t arr < <( grep -E -o '[0-9]+' <<<"$lastline" )
target=${arr[0]}${arr[1]}

# reset coverage
rm *.gcda pngout.png

if [ $target -ge $COVERAGE ] ; then
  SUITE=1
fi

if [ $SUITE -eq 1 ] ; then
  exit 1 # interesting
fi

exit 0
}
