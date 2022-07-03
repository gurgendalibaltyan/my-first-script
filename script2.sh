#!/bin/bash
while getopts w:c:l:f: flag
do
    case "${flag}" in
	f) f=${OPTARG};;
        w) w=${OPTARG};;
        c) c=${OPTARG};;
        l) l=${OPTARG};;
    esac
done
if ! [ -z "$l" ] && ! [ -z "$f" ]
then
	./script2.sh  -w $w -c $c > $l/$f
else

	echo "your chosen file path: $f"
	echo "your chosen word: $w"
	echo "your chosen  character: $c"
	echo "your chosen path/log: $l"
	word_count=`cat lorem-ipsum.txt | wc -w`
	echo "all words in txt: $word_count";
	characters_count=`cat lorem-ipsum.txt| tr -d ' ' | tr -d '\t'| tr -d '\n'| wc -m`
	echo "all characters in txt: $characters_count";
	if ! [ -z "$w" ]
	then
		your_words_count=`grep -o -i -w $w lorem-ipsum.txt | wc -l`
		echo "count of  $w : $your_words_count";
	fi

	if ! [ -z "$c" ]
	then
		input=`echo -n "$c" | wc -c`
		if (( $input > 1 ))
		then
			echo "please input the right amount of char"
		else
			your_chars_count=`grep -o -i  $c lorem-ipsum.txt | wc -l`
        		echo "count of  $c : $your_chars_count";
		fi
	fi
fi
