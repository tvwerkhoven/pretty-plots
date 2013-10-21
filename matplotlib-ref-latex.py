#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
#
# @file matplotlib-ref-latex.py -- matplotlib example script for latex
# Copyright (C) 2011--2013 Tim van Werkhoven (timvanwerkhoven@gmail.com)
#
# This example was modified from http://matplotlib.org/users/usetex.html
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

import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt

### Plot using mathtex
print "Generating matplotlib-ref-latex-mathtext.pdf..."

plt.figure(1, figsize=(6,4))
ax = plt.axes([0.1, 0.1, 0.8, 0.7])
t = np.arange(0.0, 1.0+0.01, 0.01)
s = np.cos(2*2*np.pi*t)+2
plt.plot(t, s, 'b-')

plt.xlabel(r'time (s)')
plt.ylabel(r'voltage (mV)',fontsize=16)
plt.title(r"\TeX\ is Number $\sum_{n=1}^\infty\frac{-e^{i\pi}}{2^n}$!",
      fontsize=16, color='r')
plt.grid(True)
plt.savefig('matplotlib-ref-latex-mathtext.pdf')


# Select PDF backend
#mpl.rcParams['backend'] = 'PDF'

# Use LaTex for rendering
#mpl.rcParams['text.usetex'] = 'True'

print "Generating matplotlib-ref-latex-tex.pdf..."

mpl.rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']))
mpl.rc('text', usetex=True)

plt.figure(2, figsize=(6,4))
ax = plt.axes([0.1, 0.1, 0.8, 0.7])
t = np.arange(0.0, 1.0+0.01, 0.01)
s = np.cos(2*2*np.pi*t)+2
plt.plot(t, s)

plt.xlabel(r'\textbf{time (s)}')
plt.ylabel(r'\textit{voltage (mV)}',fontsize=16)
plt.title(r"\TeX\ is Number $\displaystyle\sum_{n=1}^\infty\frac{-e^{i\pi}}{2^n}$!",
      fontsize=16, color='r')
plt.grid(True)
plt.savefig('matplotlib-ref-latex-tex.pdf')

# EOF
