#!/bin/sh

one=0
ten=0
twenty=0
thirty=0
forty=0
fifty=0
sixty=0
seventy=0
eighty=0
ninety=0
while read p;
do
	line=`echo $p`
	age=`echo $p|awk 'BEGIN{FS=","}{print $1}'`
	num=`echo "$age"|bc -l`
	if [[ $num -ge 0 && $num -lt 10 ]];
	then
		one=`echo "$one+1"|bc -l`
	elif [[ $num -ge 10 && $num -lt 20 ]];
	then
		ten=`echo "$ten+1"|bc -l`
	elif [[ $num -ge 20 && $num -lt 30 ]];
	then
		twenty=`echo "$twenty+1"|bc -l`
	elif [[ $num -ge 30 && $num -lt 40 ]];
	then
		thirty=`echo "$thirty+1"|bc -l`
	elif [[ $num -ge 40 && $num -lt 50 ]];
	then
		forty=`echo "$forty+1"|bc -l`
	elif [[ $num -ge 50 && $num -lt 60 ]];
	then
		fifty=`echo "$fifty+1"|bc -l`
	elif [[ $num -ge 60 && $num -lt 70 ]];
	then
		sixty=`echo "$sixty+1"|bc -l`
	elif [[ $num -ge 70 && $num -lt 80 ]];
	then
		seventy=`echo "$seventy+1"|bc -l`
	elif [[ $num -ge 80 && $num -lt 90 ]];
	then
		eighty=`echo "$eighty+1"|bc -l`
	elif [[ $num -ge 90 && $num -lt 100 ]];
	then
		ninety=`echo "$ninety+1"|bc -l`
	fi

done <heart.csv

echo "age_group,num" > q4_d.csv
echo "0-10,$one" >> q4_d.csv
echo "10-20,$ten" >> q4_d.csv
echo "20-30,$twenty" >> q4_d.csv
echo "30-40,$thirty" >> q4_d.csv
echo "40-50,$forty" >> q4_d.csv
echo "50-60,$fifty" >> q4_d.csv
echo "60-70,$sixty" >> q4_d.csv
echo "70-80,$seventy" >> q4_d.csv
echo "80-90,$eighty" >> q4_d.csv
echo "90-100,$ninety" >> q4_d.csv

gnuplot Q4_d.p
open output_graph_q4_d.pdf