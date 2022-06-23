#!/usr/bin/env bash

read -p "What is the name of your project? [Recommended: use lowercase, and if it is many words, use kebab-case] : " name

read -p "What's your development handle / username? : " username

mv project $name
mv project-lib $name-lib
mv project-test $name-test
mv project-doc $name-doc
mv profile/project.rkt profile/$name.rkt
mv $name-test/tests/project.rkt $name-test/tests/$name.rkt
mv $name-doc/scribblings/project.scrbl $name-doc/scribblings/$name.scrbl

sed -i '' s/"<project>"/$name/g CONTRIBUTING.rst
sed -i '' s/"<project>"/$name/g Makefile
sed -i '' s/"<project>"/$name/g README.rst
sed -i '' s/"<project>"/$name/g profile/$name.rkt
sed -i '' s/"<project>"/$name/g $name/info.rkt
sed -i '' s/"<project>"/$name/g $name-lib/info.rkt
sed -i '' s/"<project>"/$name/g $name-test/info.rkt
sed -i '' s/"<project>"/$name/g $name-doc/info.rkt
sed -i '' s/"<project>"/$name/g $name-test/tests/$name.rkt
sed -i '' s/"<project>"/$name/g $name-doc/scribblings/$name.scrbl
sed -i '' s/"<project>"/$name/g .github/workflows/docs.yml

sed -i '' s/"<username>"/$username/g CONTRIBUTING.rst
sed -i '' s/"<username>"/$username/g Makefile
sed -i '' s/"<username>"/$username/g README.rst
sed -i '' s/"<username>"/$username/g profile/$name.rkt
sed -i '' s/"<username>"/$username/g $name/info.rkt
sed -i '' s/"<username>"/$username/g $name-lib/info.rkt
sed -i '' s/"<username>"/$username/g $name-test/info.rkt
sed -i '' s/"<username>"/$username/g $name-doc/info.rkt
sed -i '' s/"<username>"/$username/g $name-test/tests/$name.rkt
sed -i '' s/"<username>"/$username/g $name-doc/scribblings/$name.scrbl
sed -i '' s/"<username>"/$username/g .github/workflows/docs.yml
