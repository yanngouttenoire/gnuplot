set terminal epscairo font 'Gill Sans,9' rounded fontscale 0.6
set output "polargrid.eps"
unset border
set polar
set angles degrees

set style line 100 linecolor rgb '#808080'
set style line 101 linecolor rgb '#808080' linetype 0 
set style line 1 lc rgb '#A00000' pt 6 ps 1 lt 1 lw 2
set style line 2 lc rgb '#00A0A0' pt 6 ps 1 lt 1 lw 2
set style line 3 lc rgb '#00A000' pt 6 ps 1 lt 1 lw 2
set style line 6 lc rgb '#A000A0' pt 6 ps 1 lt 1 lw 2
set style line 4 lc rgb '#0000A0' pt 6 ps 1 lt 1 lw 2
set style line 5 lc rgb '#A0A000' pt 6 ps 1 lt 1 lw 2

set grid polar 30 ls 101

set size square 
set border linestyle 101
unset xtics
unset ytics
set key bmargin center
set format r ""
set rtics scale 0

amplitude=1.1
set_label(x, text) = sprintf("set label '%s' at (amplitude*cos(%f)), (amplitude*sin(%f))     center", text, x, x) #this places a label on the outside

#here all labels are created
eval set_label(0, "0°")
eval set_label(60, "60°")
eval set_label(120, "120°")
eval set_label(180, "180°")
eval set_label(240, "240°")
eval set_label(300, "300°")

set style line 11 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot

#and finally the plot
plot "polargrid.dat" using ($1)*180/3.14:2 title "polargrid" w l lc rgb "#00A000"

