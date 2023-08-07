#!/bin/bash

echo "" >> "${1}.md"
for each in `ls $1`;do
    echo "![$each]($each)" >> "${1}.md"
done

