#!/bin/sh
# dot.sh

echo "usage: ./dot.sh {dot_file} [jpg|png|svg|jpeg]"

file=$1

echo "input count: ""$#"

if [ $# -gt 1 ]
then
    if [[ $2="jpg" ||  $2="png" ||  $2="svg" || $2="jpeg" ]]
    then
        format=$2
    else
        format="png"
    fi
else
    format="png"
fi

echo "format needed: "$format

filename=${file%.*}
extension=${file##*.}
outfile=${filename}.$format

echo "target file: "$outfile

formatsetting="-T"$format

echo "format setting: "$formatsetting

dot $formatsetting $file -o $outfile
open -a Safari $outfile
