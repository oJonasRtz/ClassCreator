#!/bin/bash

#Check input
if [ $# -lt 2 ]; then
	echo "How to use: ./createClass.sh <class name> <folder>"
	exit 1
fi

CLASSNAME=$1
FOLDER=$2


#copy files
cp ClassTemplate.hpp ${CLASSNAME}.hpp
cp ClassTemplate.cpp ${CLASSNAME}.cpp

#Replace CLASSNAME
sed -i "s/ClassTemplate/${CLASSNAME}/g" ${CLASSNAME}.hpp
sed -i "s/ClassTemplate/${CLASSNAME}/g" ${CLASSNAME}.cpp
sed -i "s/CLASSTEMPLATE_HPP/$(echo ${CLASSNAME} | tr '[:lower:]' '[:upper:]')_HPP/g" ${CLASSNAME}.hpp

echo "Class ${CLASSNAME} successfuly created!"

mv ${CLASSNAME}.hpp ${FOLDER}/includes
mv ${CLASSNAME}.cpp ${FOLDER}/src
