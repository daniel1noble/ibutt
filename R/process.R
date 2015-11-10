#' Function for processing the text read from ibuttons. Still needs work.
#' @param dat a text/csv string imported from a directory containing csv files for ibutton data.

process <- function(dat){
	tmp <- grep("^[0-9]+/", dat, value = TRUE) ## Extract relevant lines
	    
	    #Do all the processing of the text.
	    date <- as.Date(gsub("\\s[0-9]+:.*", "",  tmp),"%d/%m/%y") ## Will get the date
	    AMPM <- gsub(".*\\s([A-Z]+).*", "\\1",  tmp) ## Will AM/PM
	    time <- gsub(".*\\s([0-9]+:[0-9]+:[0-9]+).*", "\\1", tmp) ## Will get the time
	  time24 <- substr(strptime(time, format = "%I:%M:%S %p"),12,19)
	    unit <- gsub(".*,?([RHC]),.*", "\\1", tmp)
	temp.hum <- as.numeric(gsub(".*,([0-9]+.*)", "\\1", tmp))
	date.time <- chron::chron(dates = date, times = time24, format = c('y-m-d', 'h:m:s'))

	return(data.frame(Date.time = date.time, Date = date, Time = paste0(time ,AMPM), Units = ifelse(unit == "C", unit, paste0("R",unit)), Temperature.Humidity = temp.hum))
}

