 # Reset all gnuplot settings
 reset
 
 # Enable macros
 set macro
 # Increase the number of samples slightly
 set samples 100
 # For showing a grid or not
 # set grid

 # SVG terminal, seems to work fine, dimension units little ambiguous
 # set terminal svg size "800,600" font "Futura" enhanced dynamic butt
 
 # PDF Terminal, seems to work fine with custom fonts
 set terminal pdf colour enhanced font "FuturaMedium" size 8cm,5cm 
   
 # By default change the legend key a bit
 set key on box spacing 1 samplen 6 at screen 0.95, 0.81

 # See 'help enhanced' for more info about text and encoding. Also see 
 # ps_guide.ps supplied with the Gnuplot documentation (i.e. in 
 # /sw/share/doc/gnuplot/psdoc/ps_guide.ps)
 # See http://en.wikipedia.org/wiki/Windows_Glyph_List_4 for a list of glyphs
 
 #set encoding iso_8859_1
 set title "This is a test: { e^{{/Symbol=6 m}/2}} {/Helvetica \305} {/Symbol \245} {/Helvetica e^{-{/Symbol m}^2/2}}"
 
 # Default margin tends to be too small for low letters (g, y, etc)
 set bmargin 3.5
 
 # Set output to default name, perl wrapper will clean this up
 
 # Change linestyles according to http://www.sron.nl/~pault/
 # 4-style mode, gray compatible:
 set style line 1 linetype 1 linecolor rgb "#332288" linewidth 2.2 pointtype 1
 set style line 2 linetype 2 linecolor rgb "#88CCEE" linewidth 2.2 pointtype 2
 set style line 3 linetype 3 linecolor rgb "#999933" linewidth 2.2 pointtype 3
 set style line 4 linetype 4 linecolor rgb "#AA4499" linewidth 2.2 pointtype 4

 set output "gnuplot-reference-2-lines-bw.pdf"
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

 set output "gnuplot-reference-2-lines-col.pdf"
 plot sin(x) + 0 with lp ls 1,\
  sin(x) + 1 with lp ls 2,\
  sin(x) + 2 with lp ls 3,\
  sin(x) + 3 with lp ls 4,\
  sin(x) + 4 with lp ls 5,\
  sin(x) + 5 with lp ls 6,\
  sin(x) + 6 with lp ls 7,\
  sin(x) + 7 with lp ls 8
  