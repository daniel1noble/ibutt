#' Function for processing the text read from ibuttons.
#' @param dat A text/csv string imported from a directory containing files for ibutton data.
#' @return Returns a processed data frame with the following:
#'	\enumerate{
#'		\item Date: A character string with the date.
#'		\item AMPM: A character string defining 12 hr clock, AM or PM.				
#'		\item time: A character string of the time %H:%M:%S
#'		\item time24: A character string containing the time in 24 hr format.
#'		\item unit: The unit of measurement. 'C' = Celsius; 'RH' = Relative humidity in percentage
#'		\item temp.hum: The temperature and humidity measurements from the ibutton
#'		\item date.time: A formatted time string (as.numeric) based on time from July 1, 1970. Date/time can be used for plotting or querying using functions for numeric classes.
#'}
#' @author Daniel Noble - daniel.noble@unsw.edu.au
#' @export

process <- function(dat){
	oldw <- getOption("warn")
	options(warn = -1)

	tmp <- grep("^[0-9]+/", dat, value = TRUE) ## Extract relevant lines

	    #Do all the processing of the text.
	            date <- gsub("\\s[0-9]+:.*", "",  tmp) ## Will get the date
	       AMPM <- gsub(".*\\s([A-Z]+).*", "\\1",  tmp) ## Will AM/PM
	           time <- gsub(".*\\s([0-9]+:[0-9]+:[0-9]+).*", "\\1", tmp) ## Will get the time
	 timeAMPM <- paste0(time, " ",AMPM)
	        time24 <- substr(strptime(timeAMPM, format = "%I:%M:%S %p"), 12,19)
	            unit <- gsub(".*,?([RHC]),.*", "\\1", tmp)
	   temp.hum <- as.numeric(gsub(".*,([0-9]+.*)", "\\1", tmp))
   	    date.time <- as.POSIXct(paste(date, time24, " "), format = "%d/%m/%y %H:%M:%S")
           options(warn = oldw)
           
	return(data.frame(Date.time = date.time, Units = ifelse(unit == "C", unit, paste0("R",unit)), Temp.Hum = temp.hum))
}

