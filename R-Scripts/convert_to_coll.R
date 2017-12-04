# name: convert_to_coll.R
# purpose: convert coastal site data into a format friendly to Max's coll object


#make a new data table from the data with only the variables we want with no NA's

no_NA <- na.omit(data.frame(lat = coastal_site_data$`Latitude (WGS-84)`, lon = coastal_site_data$`Longitude (WGS-84)`, edate = coastal_site_data$`Early Date (BCE/CE)`, ldate = coastal_site_data$`Late Date (BCE/CE)`))


#Put these variables into separate vectors.
lat <- no_NA$lat
lon <- no_NA$lon
edate <- no_NA$edate
ldate <- no_NA$ldate


#grab the length of one of the vectors. This is to create the vector from 0-length needed for col.
number_length <- length(lat) - 1

#make the actual vectors containing 0-length,
numbers <- c(0:number_length)

#create the vector needed for the coll value list.
c_list <- paste(lat, lon, edate, ldate, sep = " ")

#attach the semicolon
c_list_semic <- paste(c_list, ";", sep="")

#finally, marry the number list and the space-separated list of values.
c_list_vec <- paste(numbers, c_list_semic, sep = ",")

#write to .txt
write(c_list_vec, file = "coastal_data_col.txt")