set terminal pdf 
set output 'output_graph_q4_a.pdf'
set title 'Heart Data'
set datafile separator ","
set xlabel 'sex'
set ylabel 'count'
set key out top box
set style data histograms
set style fill solid
plot 'Q4A.csv' using 2:xtic(1) ti col lc "blue" , '' using 3:xtic(1) title col lc "green"