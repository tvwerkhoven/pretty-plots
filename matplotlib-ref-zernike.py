#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
#
# @file matplotlib-ref-zernike.py -- plot zernike functions with matplotlib
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

import numpy as np
from scipy.misc import factorial as fac

from mpl_toolkits.mplot3d import Axes3D
from matplotlib.colors import ListedColormap, Normalize
from matplotlib import cm
from matplotlib import pyplot as plt

### Init zernike generation functions (from libtim.zern)

def zernike_rad(m, n, rho):
	if (np.mod(n-m, 2) == 1):
		return rho*0.0

	wf = rho*0.0
	for k in range((n-m)/2+1):
		wf += rho**(n-2.0*k) * (-1.0)**k * fac(n-k) / ( fac(k) * fac( (n+m)/2.0 - k ) * fac( (n-m)/2.0 - k ) )

	return wf

def zernike(m, n, rho, phi):
	if (m > 0): return zernike_rad(m, n, rho) * np.cos(m * phi)
	if (m < 0): return zernike_rad(-m, n, rho) * np.sin(-m * phi)
	return zernike_rad(0, n, rho)

def zernikel(j, rho, phi):
	n = 0
	while (j > n):
		n += 1
		j = j - n
	m = -n+2*j
	return zernike(m, n, rho, phi)

# Make colormap based on Paul Tol's best visibility gradients. See 
# <http://www.sron.nl/~pault/> for more info on these colors. Also see
# <http://matplotlib.sourceforge.net/api/colors_api.html>
# and <http://www.scipy.org/Cookbook/Matplotlib/Show_colormaps> on some 
# matplotlib examples

colhue = np.arange(256.)/256
colred = 0.237 - 2.13*colhue + 26.92*colhue**2 - 65.5*colhue**3 + 63.5*colhue**4 - 22.36*colhue**5
colgrn = ((0.572 + 1.524*colhue - 1.811*colhue**2)/(1 - 0.291*colhue + 0.1574*colhue**2))**2
colblu = 1/(1.579 - 4.03*colhue + 12.92*colhue**2 - 31.4*colhue**3 + 48.6*colhue**4 - 23.36*colhue**5)
colmap = ListedColormap(np.r_[[colred],[colgrn],[colblu]].T, name='sron_blue-red', N=256)

### Generate coordinate grid in polar coordinates
r = np.linspace(0, 1.0, 15)**0.5
p = np.linspace(0, 2*np.pi, 100)
R,P = np.meshgrid(r,p)
# transform them to cartesian system
X,Y = R*np.cos(P), R*np.sin(P)

circ_rad = (X**2 + Y**2)**0.5

### Generate Zernike modes 5, 7, 11, 15

for zmode in (5, 7, 11, 15):
	print "Generating matplotlib-ref-zernike_%d.pdf..." % zmode
	zern_wf = zernikel(zmode, circ_rad, np.arctan2(X, Y))

	fig = plt.figure(1+zmode); plt.clf()
	ax = fig.add_subplot(111, projection='3d')
	
	ax.plot_surface(X, Y, zern_wf, rstride=1, cstride=1, cmap=colmap)
	ax.set_xlabel(r'X')
	ax.set_ylabel(r'Y')
	ax.set_zlabel(r'$\phi$')
	ax.set_title("Zernike mode j=%d" % zmode)
	
	plt.show()
	plt.savefig("matplotlib-ref-zernike_%d.pdf" % zmode)
	plt.savefig("matplotlib-ref-zernike_%d.eps" % zmode)
	plt.close()

# EOF
