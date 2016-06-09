#!/usr/bin/env ruby
# tool to make mapfile 
# 
extent = "-373391.500 665607.031 497443.450 1361106.085"

ARGV.sort.each do |item|

  	#SouthwestAlaska.2010027.terra.250m.tif
  	name = File.basename(item, ".aa.tif")
  	year = name.split(".")[1][0,4]
	puts("        LAYER")
	puts("                NAME \"#{name}\"")
	puts("                TYPE raster")
	puts("                STATUS on")
	puts("                OFFSITE 0 0 0")
	puts("                DATA \"#{item}\"")
 	puts("		      EXTENT #{extent}")
	puts("                GROUP \"#{year} MODIS Rapid Response\"")
	puts("                INCLUDE \"includes/projections/3338.include.map\"")
	puts("                DEBUG ON")
	puts("                METADATA")
	puts("                WMS_TITLE \"#{name}\"")
	puts("                WMS_GROUP_TITLE \"MODIS Rapid Response\"")
	puts("                WMS_EXTENT \"#{extent}\"")
	puts("                WMS_ABSTRACT \"TBD\"")
	puts("                END")
	puts("        END")
end

