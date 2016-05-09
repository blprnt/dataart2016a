For this project, I wanted to explore saltwater intrusion of the potable water wells in South Florida. Sea level rise has already corrupted some wells and I was curious about how pervasive that may or may not be. I scraped data from the [National Water Information System](http://nwis.waterdata.usgs.gov/nwis), which does have an API, but it is incredibly confusing to use and doesn't seem to list the data I was looking for. 

I ended up finding the data by getting a list of wells in south florida and pasting the well ID into a page I accidentally found with detailed information on the salinity readings of a [particular well](http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=255011080124501&agency_cd=USGS&format=wide_rdb). I then repeated the process to get information about the well's location on [a separate page](http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=255011080124501&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list). The page with location information also contains salinity readings, but not in a way that is easy for me to access programmatically. All of the information for where I pulled the data for the wells is at the bottom of the page, but I also created [a spreadsheet](https://docs.google.com/spreadsheets/d/15JE_ih0h6BBfOtye682o1HBgs5N-I2mnlhvmIrHFxCU/edit?usp=sharing).

I only mapped seven wells because the process of scraping and adding it to the spreadsheet took hours, even for this small sample. I then created an animation of the speed of their salinity since the recordings began in the late 70s/early 80s. I roughly mapped them over an image of Miami-Dade county. It was interesting to see that the wells along the southern part of the county became contaminated much faster than ones along the eastern shore.


![Screenshot](https://github.com/crystal-b/dataart2016a/blob/master/homework/crystal/project1/salinity_miami-dade-county.png)



**PROBLEMS:** 
Monitoring began in the late 70s/early 80s, but it’s likely that some wells were built afterward. Also, not all wells are measured each year so the exact point of salinity cannot be determined. 


**QUESTIONS:** 
* At which point does salinity become dangerous to the wells future? To drinkability?

* What is the relationship between the South Florida Water Management District and the US Geological Survey / National Water Information System)?

* Why do they not measure all wells annually? Are there times of the year when salinity may be greater due to tidal changes?

* What is the amount of error afforded by the monitoring process/equipment?

* What does this mean?: "In order to display changes in bulk conductivity between induction logs collected over the period of record, each log has been adjusted to a median conductivity value at a depth that corresponds to a stable lithologic feature which produces a consistent conductivity profile, based on data collected in 2011 and 2012. These adjustments compensate for small variations in equipment response resulting from variations in environmental conditions and/or probe calibrations. For this station, induction logs are adjusted to a mean response of 15.6 mS/m at a depth of 112.1 ft below land surface. The resulting plot of logs collected from 2011 to the current year is provided in this report."


**SOME ANSWERS:**
* [Information on induction sampling](http://www.sflorida.er.usgs.gov/edl_data/text/induction.html#induction)

* Induction logs are used to assess the movement of the fresh-water/salt-water interface in ground water.

* Conductivity values from freshwater-saturated rocks typically are less than 25 mS/m, whereas conductivity values from saltwater-saturated rocks are typically greater than 67 mS/m (Hittle, 1999).
fresh water(25 mS/m) < wiggle room > saltwater (67 ms/m)


**WELLS I MAPPED IN MIAMI-DADE COUNTY:**
* 255011080124501

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=255011080124501&agency_cd=USGS&format=wide_rdb

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=255011080124501&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


* 254828080161501
G - 354
http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=254828080161501&agency_cd=USGS&format=wide_rdb

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=254828080161501&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


* 254335080170501
G - 432
http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=254335080170501&agency_cd=USGS&format=wide_rdb

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=254335080170501&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


* 254855080163701
G - 548
http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=254855080163701&agency_cd=USGS&format=wide_rdb

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=254855080163701&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


* No Data: South Florida - G 553


* 254841080164401
G - 571
http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=254841080164401&agency_cd=USGS&format=wide_rdb

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=254841080164401&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


* 255350080105801
G - 894
http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=255350080105801&agency_cd=USGS&format=wide_rdb


http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=255350080105801&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


* 254107080165201
G - 896
http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=254107080165201&agency_cd=USGS&format=wide_rdb

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=254107080165201&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


* 254201080173001
G - 901
http://nwis.waterdata.usgs.gov/fl/nwis/qwdata?pm_cd_compare=Greater%20than&radio_multiple_parm_cds=00940,99220,00095&radio_parm_cds=parm_cd_list&site_no=254201080173001&agency_cd=USGS&format=wide_rdb

http://nwis.waterdata.usgs.gov/fl/nwis/qwdata/?site_no=254201080173001&agency_cd=USGS&inventory_output=0&rdb_inventory_output=file&TZoutput=0&pm_cd_compare=Greater%20than&radio_parm_cds=parm_cd_list&radio_multiple_parm_cds=00940%2C99220%2C00095&format=html_table&qw_attributes=0&qw_sample_wide=wide&rdb_qw_attributes=0&date_format=YYYY-MM-DD&rdb_compression=file&submitted_form=brief_list


