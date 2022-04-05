#!/bin/zsh
SUITE=0
COVERAGE=3764

for i in $* ; do
  ./pngtest ./large-png-suite/$i.png
done

# capture the last line of the output
output=$(gcov *.c)
lastline=$(echo $output | tail -1)

# get the percentage coverage
target=$(cut -c 16-17 <<< $lastline)$(cut -c 19-20 <<< $lastline)

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
