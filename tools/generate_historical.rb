#!/usr/bin/env ruby
# tool to make mapfile 
# 
require "date"
extent = "-373391.500 665607.031 497443.450 1361106.085"

sorted_by_date = ARGV.sort { |x,y|  x.split("_")[-5,2].join  <=> y.split("_")[-5,2].join }

sorted_by_date.each do |item|
	#terra_modis_true_color_20131228_211900_nps_aa_nad83.tif
  	#SouthwestAlaska.2010027.terra.250m.tif
	platform = "terra"
	platform = "aqua" if ( item.include?("aqua"))
	source = "gina"
	source = "lads" if ( item.include?("lads") ||  platform == "aqua")
	data_type = "367"
	data_type = "natural_color" if (item.include?("true_color"))
	data_type = "false_color" if (item.include?("false_color"))

	#skip these for now
	next if data_type == "367" || data_type == "false_color"

	date_of_data =  DateTime.strptime( item.split("_")[-5,2].join, "%Y%m%d%H%M%S")
	name = date_of_data.strftime("SouthwestAlaska.%Y%j.%H%M.#{platform}.#{source}.#{data_type}")
	year = date_of_data.year
	puts("        LAYER")
	puts("                NAME \"#{name}\"")
	puts("                TYPE raster")
	puts("                STATUS on")
	puts("                OFFSITE 0 0 0")
	puts("                DATA \"#{item}\"")
 	puts("		      EXTENT #{extent}")
	puts("                GROUP \"#{year} GINA Historical\"")
	puts("                INCLUDE \"includes/projections/3338.include.map\"")
	puts("                DEBUG ON")
	puts("                METADATA")
	puts("                WMS_TITLE \"#{name}\"")
	puts("                WMS_GROUP_TITLE \"#{year} GINA Historical\"")
	puts("                WMS_EXTENT \"#{extent}\"")
	puts("                WMS_ABSTRACT \"TBD\"")
	puts("                END")
	puts("        END")
end

