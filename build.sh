#!/bin/bash

result=0

echo "** Running jasmine"
rake jasmine:ci
result+=$?

echo "** Running rspec"
rspec
result+=$?

if [ $result -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

exit $result