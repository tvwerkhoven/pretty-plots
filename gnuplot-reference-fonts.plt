# gnuplot-reference-fonts.plt -- gnuplot example script for fonts
# Copyright (C) 2011  Tim van Werkhoven (t.i.m.vanwerkhoven@xs4all.nl)
#
# This work is licensed under the Creative Commons Attribution-Share Alike 
# 3.0 Unported License. To view a copy of this license, visit 
# http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative 
# Commons, 171 Second Street, Suite 300, San Francisco, California,94105, USA.

# Reset all gnuplot settings
reset
unset key
set samples 100

set encoding utf8

set terminal pdf colour enhanced fname "Helvetica" fsize 8 size 10cm,6.1cm
#set terminal post colour enhanced font "Helvetica" 8 size 10cm,6.1cm

set title "Color-blind compatible color scheme {\305}"

set output "gnuplot-reference-fonts.pdf"
plot sin(x) + 0 with lp ls 1,\
 sin(x) + 1 with lp ls 2,\
 sin(x) + 2 with lp ls 3,\
 sin(x) + 3 with lp ls 4
