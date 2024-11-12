set terminal pdf 
set output 'output_graph_q4_c.pdf'
set title 'Heart Data'
set datafile separator ","
set xlabel 'Age'
set ylabel 'Blood Pressure'
set style data linespoints
plot 'heart.csv' using 5:xtic(1) title "heart data"