 # Reset all gnuplot settings
 reset
 
 # SVG terminal, seems to work fine, dimension units little ambiguous
 set terminal svg size 800,600 dynamic font "FuturaMedium" butt
 set output "gnuplot-reference-2-density.svg"
 
 # PDF Terminal, seems to work fine with custom fonts
 # set terminal pdf colour enhanced font "FuturaMedium" size 8cm,5cm
 # set output "gnuplot-reference-2-density.pdf"
  
 # See 'help enhanced' for more info about text and encoding. Also see 
 # ps_guide.ps supplied with the Gnuplot documentation (i.e. in 
 # /sw/share/doc/gnuplot/psdoc/ps_guide.ps)
 
 # See http://en.wikipedia.org/wiki/Windows_Glyph_List_4 for a list of glyphs 
 set title "This is a test: { e^{{/Symbol=6 m}/2}} {/Helvetica \305} {/Symbol \245} {/Helvetica e^{-{/Symbol m}^2/2}}"
 
 # Default margin tends to be too small for low letters (g, y, etc)
 set bmargin 3.5
 
 # No key for 3d plots
 unset key
 
 # For showing a grid or not
 unset grid
 
 # Enable coloring
 set pm3d
 # Hide 'invisible' parts
 set hidden3d

 # 15 contour levels
 set cntrparam levels 15
 # Use this for contours
 set style line 1 lc rgb "black" lw 1.5

 set contour both
 # Show contours
 show contour
 
 # We use parametric plots
 set parametric
 set urange[0:pi*1.001]
 
 # Increase samplerate
 set samples 45,45
 set isosamples 45,45
 
 # Colors for variations around 0 (blue-red) see <http://www.sron.nl/~pault/>
 rcol(x) = 0.237 - 2.13*x + 26.92*x**2 - 65.5*x**3 + 63.5*x**4 - 22.36*x**5
 gcol(x) = ((0.572 + 1.524*x - 1.811*x**2)/(1 - 0.291*x + 0.1574*x**2))**2
 bcol(x) = 1/(1.579 - 4.03*x + 12.92*x**2 - 31.4*x**3 + 48.6*x**4 - 23.36*x**5)
 set palette model RGB functions rcol(gray), gcol(gray), bcol(gray)
 
 # Gradient colors, see <http://www.sron.nl/~pault/>
 # rcol(x) = (1 - 0.392*(1 + erf((x - 0.869)/ 0.255)))
 # gcol(x) = (1.021 - 0.456*(1 + erf((x - 0.527)/ 0.376)))
 # bcol(x) = (1 - 0.493*(1 + erf((x - 0.272)/ 0.309)))
 # set palette model RGB functions rcol(gray), gcol(gray), bcol(gray)
 
 splot v*sin(u),v*cos(u), sqrt(6) * (v**2 * sin(2*u)) title "3D Plot"  with lines ls 1