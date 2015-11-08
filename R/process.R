
# Function for processing the text read from ibuttons. Still needs lots of work. 
process <- function(dat){
	tmp <- grep("[0-9]+/[0-9]+/[0-9]", dat, value = TRUE) ## Extract relevant lines
	date <- as.Date(gsub("\\s[0-9]+:.*", "",  tmp),"%d/%m/%y") ## Will get the date
	AMPM <- gsub(".*\\s([A-Z]+).*", "\\1",  tmp) ## Will AM/PM
	time <- gsub(".*\\s([0-9]+:[0-9]+:[0-9]+).*", "\\1", tmp) ## Will get the time
	unit <- gsub(".*,?([RHC]),.*", "\\1", tmp)
	temp.hum <- as.numeric(gsub(".*,([0-9]+.*)", "\\1", tmp))
	#date.time <- as.Date(strftime(gsub("(^[0-9].*\\s[0-9].*\\s[APM]+),.*", "\\1",  tmp),"%d/%m/%y %I:%M:%S %p"), "%d/%m/%y %I:%M:%S %p") ## Will get the date and time and format correct

	return(data.frame(Date = date, Time = paste0(time ,AMPM), Units = ifelse(unit == "C", unit, paste0("R",unit)), Temperature.Humidity = temp.hum))
}

