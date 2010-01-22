 # Reset all gnuplot settings
 reset
 
 # We want to get eps files
 set terminal postscript eps enhanced color size 4,2.8 "Palatino-Roman" 14
 
 # By default change the legend key a bit
 set key on box spacing 2 samplen 6 at screen 0.95, 0.93
 
 # Set output to default name, perl wrapper will clean this up
 set output "gnuplot-reference.eps"
 
 # Plot sine functions spaced vertically to display the different linestyles
 plot sin(x) + 0 with lp ls 0,\
  sin(x) + 1 with lp ls 1,\
  sin(x) + 2 with lp ls 2,\
  sin(x) + 3 with lp ls 3,\
  sin(x) + 4 with lp ls 4,\
  sin(x) + 5 with lp ls 5,\
  sin(x) + 6 with lp ls 6,\
  sin(x) + 7 with lp ls 7,\
  sin(x) + 8 with lp ls 8,\
  sin(x) + 9 with lp ls 9,\
  sin(x) + 10 with lp ls 10;
