# gnuplot-reference-lines.plt -- gnuplot example script
# Copyright (C) 2010  Tim van Werkhoven (t.i.m.vanwerkhoven@xs4all.nl)
#
# This work is licensed under the Creative Commons Attribution-Share Alike 
# 3.0 Unported License. To view a copy of this license, visit 
# http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative 
# Commons, 171 Second Street, Suite 300, San Francisco, California,94105, USA.

# Reset all gnuplot settings
reset
unset key
set samples 100

set terminal pdf colour enhanced size 8cm,5cm 

set title "Color-blind compatible color schemes"

# Change linestyles according to http://www.sron.nl/~pault/
# 4-style mode, gray compatible:
set style line 1 linetype 1 linecolor rgb "#332288" linewidth 2.2 pointtype 1
set style line 2 linetype 2 linecolor rgb "#88CCEE" linewidth 2.2 pointtype 2
set style line 3 linetype 3 linecolor rgb "#999933" linewidth 2.2 pointtype 3
set style line 4 linetype 4 linecolor rgb "#AA4499" linewidth 2.2 pointtype 4

set output "gnuplot-reference-lines-bw.pdf"
plot sin(x) + 0 with lp ls 1,\
 sin(x) + 1 with lp ls 2,\
 sin(x) + 2 with lp ls 3,\
 sin(x) + 3 with lp ls 4

# 5--8 style set, colors only
set style line 1 linetype 1 linecolor rgb "#332288" linewidth 2.2 pointtype 1
set style line 2 linetype 2 linecolor rgb "#88CCEE" linewidth 2.2 pointtype 2
set style line 3 linetype 3 linecolor rgb "#117733" linewidth 2.2 pointtype 3
set style line 4 linetype 4 linecolor rgb "#DDCC77" linewidth 2.2 pointtype 4
set style line 5 linetype 5 linecolor rgb "#CC6677" linewidth 2.2 pointtype 5
set style line 6 linetype 7 linecolor rgb "#AA4499" linewidth 2.2 pointtype 7
set style line 7 linetype 7 linecolor rgb "#44AA99" linewidth 2.2 pointtype 7
set style line 8 linetype 7 linecolor rgb "#882255" linewidth 2.2 pointtype 7

set output "gnuplot-reference-lines-col.pdf"
plot sin(x) + 0 with lp ls 1,\
 sin(x) + 1 with lp ls 2,\
 sin(x) + 2 with lp ls 3,\
 sin(x) + 3 with lp ls 4,\
 sin(x) + 4 with lp ls 5,\
 sin(x) + 5 with lp ls 6,\
 sin(x) + 6 with lp ls 7,\
 sin(x) + 7 with lp ls 8
