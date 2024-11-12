filename = 'Q4D.csv'
startRow = 1
endRow = 7
set terminal pdf
set output "output_graph_q4_d.pdf"
set datafile separator ','
stats filename u 2 every ::startRow::endRow noout prefix "Data"
endRow = (endRow - startRow > Data_records - 1 ? Data_records + startRow - 1 : endRow)
angleToDegree(x) = x * 360 / Data_sum
percentage(x) = x * 100 / Data_sum
chartCenterX = 0
chartCenterY = 0
pieRadius = 1
labelYMin = 0.0
labelYMax = 0.95 * pieRadius
labelXPos = 1.5 * pieRadius
labelYPos(i) = labelYMax - i * (labelYMax - labelYMin) / (1.0 * endRow - startRow)
set style fill solid 1     # filled pie-chart
unset key                  # no automatic labels
unset tics                 # remove tics
unset border               # remove borders; if a label is missing, comment to see what is happening
set size ratio -1              # equal scale length
set xrange [-pieRadius:2 * pieRadius]  # [-1:2] leaves space for labels
set yrange [-pieRadius:pieRadius]    # [-1:1]
angleOffset = 0             # initialize angle offset
chartColor = 0              # initialize color
plot filename u (chartCenterX):(chartCenterY):(pieRadius):(angleOffset):(angleOffset = angleOffset + angleToDegree($2)):(chartColor = chartColor + 1) every ::startRow::endRow w circle lc var,\
     for [i = 0 : endRow - startRow] '+' u (labelXPos):(labelYPos(i)) w p pt 5 ps 4 lc i + 1,\
     for [i = 0 : endRow - startRow] filename u (labelXPos):(labelYPos(i)):(sprintf('%05.2f%% %s', percentage($2), stringcolumn(1))) every ::i + startRow::i + startRow w labels left offset 3, 0
