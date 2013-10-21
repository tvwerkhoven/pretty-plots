# gnuplot-def_pdf_term.plt -- gnuplot defaults for PDF terminal
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

# Set terminal to UTF8
set encoding utf8

set terminal pdf colour enhanced fname "Helvetica" fsize 8 size 10cm,6.1cm
#set terminal post colour enhanced font "Helvetica" 8 size 10cm,6.1cm
