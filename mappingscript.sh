#!/bin/sh

readarray array <<< $( cat "$@" )


for element in ${array[@]}
do
 echo "checking ip for $element"
 ipadress=`dig +short $element | tail -n1`
echo "the ip is $ipadress"
result=`curl --silent https://ipvigilante.com/$ipadress | jq -r ".data.country_name"`
 echo "$element - $result" >> result.txt

 done


