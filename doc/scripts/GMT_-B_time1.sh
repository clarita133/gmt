#!/usr/bin/env bash
gmt set FORMAT_DATE_MAP=-o FONT_ANNOT_PRIMARY +9p
gmt basemap -R2000-4-1T/2000-5-25T/0/1 -JX5i/0.2i -Bpa7Rf1d -Bsa1O -BS -ps GMT_-B_time1
