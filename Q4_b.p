set terminal pdf 
set output 'output_graph_q4_b.pdf'
set title 'Heart Data'
set datafile separator ","
set xlabel 'Age'
set ylabel 'Blood Pressure'
plot 'heart.csv' using 3:xtic(1) title "Heart data"