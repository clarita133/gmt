#!/bin/sh
#
#	$Id: time_testing_4.sh,v 1.5 2007-11-15 04:20:42 remko Exp $
#
# This script runs some simple test to verify the that new time scheme
# has been implemented successfully

# Finally we use a custom epoch that uses days since 1969-07-21T02:56:00.
# Hence the output should cover the first five 24-hour periods following
# the historic Apollo 11 moon-landing; these 24-hour periods crosses
# normal day boundaries:

. ../functions.sh
header "Test time conversions (rel time & custom)"

sample1d -I0.5 << EOF > $$.d
0	0
4	1
EOF
cat << EOF > $$.answer
1969-07-21T02:56:00
1969-07-21T14:56:00
1969-07-22T02:56:00
1969-07-22T14:56:00
1969-07-23T02:56:00
1969-07-23T14:56:00
1969-07-24T02:56:00
1969-07-24T14:56:00
1969-07-25T02:56:00
EOF
gmtconvert $$.d -fi0t -fo0T --TIME_EPOCH=1969-07-21T02:56:00 --TIME_UNIT=d > $$.result

paste $$.result $$.answer | awk '{if ($1 != $3) print $0}' > fail

rm -f $$.*

passfail time_testing_4
