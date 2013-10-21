# gnuplot-reference-density.plt -- gnuplot example script
# Copyright (C) 2010  Tim van Werkhoven (t.i.m.vanwerkhoven@xs4all.nl)
#
# This work is licensed under the Creative Commons Attribution-Share Alike 
# 3.0 Unported License. To view a copy of this license, visit 
# http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative 
# Commons, 171 Second Street, Suite 300, San Francisco, California,94105, USA.

# Reset all gnuplot settings
reset

set terminal pdf colour enhanced size 8cm,8cm

set title "Color-gradient scheme testplot"

unset key
unset grid
unset contour

set pm3d
set hidden3d
set view map

set style line 1 lc rgb "black" lw 1.5
set parametric
set urange[0:pi*1.001]

set samples 45,45
set isosamples 45,45

# Colors for variations around 0 (blue-red) see <http://www.sron.nl/~pault/>
rcol(x) = 0.237 - 2.13*x + 26.92*x**2 - 65.5*x**3 + 63.5*x**4 - 22.36*x**5
gcol(x) = ((0.572 + 1.524*x - 1.811*x**2)/(1 - 0.291*x + 0.1574*x**2))**2
bcol(x) = 1/(1.579 - 4.03*x + 12.92*x**2 - 31.4*x**3 + 48.6*x**4 - 23.36*x**5)
set palette model RGB functions rcol(gray), gcol(gray), bcol(gray)

set output "gnuplot-reference-density-var.pdf"
splot v*sin(u),v*cos(u), sqrt(6) * (v**2 * sin(2*u)) title "3D Plot"  with lines ls 1

# Gradient colors, see <http://www.sron.nl/~pault/>
rcol(x) = (1 - 0.392*(1 + erf((x - 0.869)/ 0.255)))
gcol(x) = (1.021 - 0.456*(1 + erf((x - 0.527)/ 0.376)))
bcol(x) = (1 - 0.493*(1 + erf((x - 0.272)/ 0.309)))
set palette model RGB functions rcol(gray), gcol(gray), bcol(gray)

set output "gnuplot-reference-density-grad.pdf"
splot v*sin(u),v*cos(u), sqrt(6) * (v**2 * sin(2*u)) title "3D Plot"  with lines ls 1