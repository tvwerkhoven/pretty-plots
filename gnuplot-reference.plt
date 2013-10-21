# gnuplot-reference.plt -- old gnuplot reference script
# Copyright (C) 2011--2013 Tim van Werkhoven (timvanwerkhoven@gmail.com)
#
# This work is licensed under the Creative Commons Attribution-Share Alike 
# 3.0 Unported License. To view a copy of this license, visit 
# http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative 
# Commons, 171 Second Street, Suite 300, San Francisco, California,94105, USA.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# Reset all gnuplot settings
reset

# We want to get eps files
set terminal postscript eps enhanced color size 4,2.8 "Palatino-Roman" 14

# By default change the legend key a bit
set key on box spacing 2 samplen 6 at screen 0.95, 0.93

# Set output filename
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
