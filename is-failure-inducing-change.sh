#!/bin/bash
FAILED=0

cp wireworld-original.c new_wireworld-original.c

for i in $* ; do
  cat patch.$i | patch -p0 wireworld-original.c
done

gcc -c wireworld-original.c || FAILED=1

mv new_wireworld-original.c wireworld-original.c

if [ $FAILED -eq 1 ] ; then
  exit 1 # interesting
fi
exit 0
}
