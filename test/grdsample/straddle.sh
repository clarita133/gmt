#!/bin/bash
#	$Id$
# Testing gmt grdsample over a periodic grid boundary
# Problem was issue # 1086
ps=straddle.ps
gmt grdcut earth_relief_1m.grd -R179/196/49/61 -Gc.nc
gmt grdsample earth_relief_1m.grd -I0.1/0.1 -R179/196/49/61 -Gs.nc
gmt grdimage c.nc -JM3.5i -P -K -Xc -Baf -BWSne -Cjet > $ps
gmt grdimage s.nc -J -O -Y4.8i -Baf -BWSne -Cjet >> $ps