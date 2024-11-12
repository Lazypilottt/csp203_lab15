#!/bin/bash
 
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file.dat>"
    exit 1
fi
 
 
input_file=$1
 
output_file="heart_output.tex"
echo "\documentclass{article}" > $output_file
echo "\usepackage{geometry}" >> $output_file
echo "\geometry{a4paper, margin=1in}" >> $output_file
echo "\usepackage{longtable}" >> $output_file
echo "\title{Heart Data}" >> $output_file
echo "\begin{document}" >> $output_file
echo "\begin{longtable}{|c|c|c|c|c|c|c|c|c|c|c|c|c|c|}" >> $output_file
echo "\hline" >> $output_file
 
 
header=$(head -n 1 $input_file)
IFS=',' read -r -a headers <<< "$header"
for ((i=0; i<${#headers[@]}; i++)); do
    if [ "$i" -eq $((${#headers[@]} - 1)) ]; then
        echo -n "${headers[i]}" >> $output_file
    else
        echo -n "${headers[i]} & " >> $output_file
    fi
done
echo "\\\\" >> $output_file
echo "\hline" >> $output_file
echo "\endfirsthead" >> $output_file
echo "\hline" >> $output_file
 
 
tail -n +2 $input_file | while IFS=',' read -r -a row; do
    for ((i=0; i<${#row[@]}; i++)); do
        if [ "$i" -eq $((${#row[@]} - 1)) ]; then
            echo -n "${row[i]}" >> $output_file
        else
            echo -n "${row[i]} & " >> $output_file
        fi

    done
    echo "\\\\" >> $output_file
    echo "\hline" >> $output_file
done
 
 
echo "\end{longtable}" >> $output_file
echo "\end{document}" >> $output_file
echo "LaTeX file created: $output_file"
