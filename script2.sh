#!/bin/bash
while getopts w:c:l: flag
do
    case "${flag}" in
        w) w=${OPTARG};;
        c) c=${OPTARG};;
        l) l=${OPTARG};;
    esac
done
echo "your chosen word: $w";
echo "your chosen  character: $c";
echo "your chosen path/log: $l";
word_count=`echo | cat lorem-ipsum.txt | wc -w`
echo "all words in txt: $word_count";
characters_count=`echo | cat lorem-ipsum.txt| tr -d ' ' | tr -d '\t'| tr -d '\n'| wc -m`
echo "all characters in txt: $characters_count";
if ! [ -z "$w" ]
then
	your_words_count=`grep -o -i $w lorem-ipsum.txt | wc -l`
	echo "count of  $w : $your_words_count";
fi

if ! [ -z "$c" ]
then
        your_chars_count=`grep -o -i $c lorem-ipsum.txt | wc -l`
        echo "count of  $c : $your_chars_count";
fi

if ! [ -z "$l" ]
then
        ./script2.sh  -w $w -c $c > $l/sadasdasd.txt
fi


