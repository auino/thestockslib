#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <comment>"
	exit 0
fi

git add .
git commit -m "$1"
git push -u origin master

python3 setup.py sdist bdist_wheel
python3 -m twine upload dist/*

rm -rf build 2> /dev/null
rm -rf dist 2> /dev/null
rm -rf thestockslib.egg-info 2> /dev/null
