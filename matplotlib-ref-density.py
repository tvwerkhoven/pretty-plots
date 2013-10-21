#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
# 
# @file matplotlib-ref-density.py -- matplotlib example script
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

import pylab as plt
import numpy as np
import matplotlib

# Make colormap based on Paul Tol's best visibility gradients. See
# <http://www.sron.nl/~pault/> for more info on these colors. Also see
# <http://matplotlib.sourceforge.net/api/colors_api.html>
# and <http://www.scipy.org/Cookbook/Matplotlib/Show_colormaps> on some
# matplotlib examples

# Deviation around zero colormap (blue--red)
cols = []
for x in np.linspace(0,1, 256):
	rcol = 0.237 - 2.13*x + 26.92*x**2 - 65.5*x**3 + 63.5*x**4 - 22.36*x**5
	gcol = ((0.572 + 1.524*x - 1.811*x**2)/(1 - 0.291*x + 0.1574*x**2))**2
	bcol = 1/(1.579 - 4.03*x + 12.92*x**2 - 31.4*x**3 + 48.6*x**4 - 23.36*x**5)
	cols.append((rcol, gcol, bcol))

cm_plusmin = matplotlib.colors.LinearSegmentedColormap.from_list("PaulT_plusmin", cols)
# This colormap is very similar to the built-in cmap RdYlBu, see <http://www.scipy.org/Cookbook/Matplotlib/Show_colormaps>

# Linear colormap (white--red)
from scipy.special import erf

cols = []
for x in np.linspace(0,1, 256):
	rcol = (1 - 0.392*(1 + erf((x - 0.869)/ 0.255)))
	gcol = (1.021 - 0.456*(1 + erf((x - 0.527)/ 0.376)))
	bcol = (1 - 0.493*(1 + erf((x - 0.272)/ 0.309)))
	cols.append((rcol, gcol, bcol))

cm_linear = matplotlib.colors.LinearSegmentedColormap.from_list("PaulT_linear", cols)
# This colormap is very similar to the built-in cmap YlOrBr, see <http://www.scipy.org/Cookbook/Matplotlib/Show_colormaps>

# Linear colormap (rainbow)
cols = [(0,0,0)]
for x in np.linspace(0,1, 254):
	rcol = (0.472-0.567*x+4.05*x**2)/(1.+8.72*x-19.17*x**2+14.1*x**3)
	gcol = 0.108932-1.22635*x+27.284*x**2-98.577*x**3+163.3*x**4-131.395*x**5+40.634*x**6
	bcol = 1./(1.97+3.54*x-68.5*x**2+243*x**3-297*x**4+125*x**5)
	cols.append((rcol, gcol, bcol))

cols.append((1,1,1))
cm_rainbow = matplotlib.colors.LinearSegmentedColormap.from_list("PaulT_rainbow", cols)
# This colormap is close to the built-in cmap 'Spectral', see <http://www.scipy.org/Cookbook/Matplotlib/Show_colormaps>

# Plot examples
tmpim = np.arange(256).reshape(1,-1)
print "Generating matplotlib-ref-density-plusmin.*..."
plt.figure(1); plt.clf()
plt.title("www.sron.nl/~pault plus-min variation colormap (like RdYlBu)")
plt.imshow(tmpim, cmap=plt.get_cmap(cm_plusmin), aspect='auto')
plt.savefig("matplotlib-ref-density-plusmin.pdf")
plt.savefig("matplotlib-ref-density-plusmin.eps")

print "Generating matplotlib-ref-density-linear.*..."
plt.figure(2); plt.clf()
plt.title("www.sron.nl/~pault linear colormap (like YlOrBr)")
plt.imshow(tmpim, cmap=plt.get_cmap(cm_linear), aspect='auto')
plt.savefig("matplotlib-ref-density-linear.pdf")
plt.savefig("matplotlib-ref-density-linear.eps")

print "Generating matplotlib-ref-density-rainbow.*..."
plt.figure(3); plt.clf()
plt.title("www.sron.nl/~pault rainbow colormap (like Spectral)")
plt.imshow(tmpim, cmap=plt.get_cmap(cm_rainbow), aspect='auto')
plt.savefig("matplotlib-ref-rainbow.pdf")
plt.savefig("matplotlib-ref-rainbow.eps")


# EOF
