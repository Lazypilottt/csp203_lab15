#!/bin/sh

echo "\documentclass{article}" > doc.tex
echo "\usepackage{amsmath}" >> doc.tex
echo "\usepackage{caption}" >> doc.tex
echo "\usepackage{graphicx}" >> doc.tex
echo "\usepackage{pgfplotstable}" >> doc.tex
echo "\usepackage{booktabs}" >> doc.tex
echo "\usepackage{placeins}" >> doc.tex
echo "\\\title{Document}" >> doc.tex
echo "\\\author{Aditya Yadav}" >> doc.tex
echo "\\\begin{document}" >> doc.tex
echo "\maketitle" >> doc.tex
echo "\section{Table}" >> doc.tex
echo "\\\begin{table}[h!]" >> doc.tex
echo "\\\centering" >> doc.tex
echo "\\\caption{Heart Data}" >> doc.tex
echo "\pgfplotstabletypeset[" >> doc.tex
echo "col sep=space," >> doc.tex
echo "header=true," >> doc.tex
echo "string type," >> doc.tex
echo "]{$1}" >> doc.tex
echo "\\\end{table}" >> doc.tex
echo "\\\end{document}" >> doc.tex
