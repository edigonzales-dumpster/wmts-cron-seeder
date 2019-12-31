#!/bin/bash
timestamp=`date +%Y/%m/%d-%H:%M:%S`
echo "System path is $PATH at $timestamp"
mapcache_seed -c /mapcache/mapcache.xml -t ch.so.agi.grundbuchplan_sw -f -z 0,6 -n 4 -d /mapcache/wmts-seeding-perimeter.gpkg -l kanton1000m
