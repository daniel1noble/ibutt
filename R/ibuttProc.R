
#' Sub setting a specific date.
#' @param d The processed iButton data frame.
#' @param date The date, as a character string, one wishes to subset. Note that the format of the date should be "year-month-day" with only a four digit year.
#' @return A data.frame consisting of the sub temperature and humidity values that are subset by the hour or time range of interest.

subdate <- function(d, date){
	dD <- subset(d, format(Date.time, "%Y-%m-%d")  == date)
	return(dD)
}

## Subset function. Range of time format c(lower, upper) as a character vector
#' Function for sub setting a specific hour or range of times
#' @param d The processed iButton data frame.
#' @param time The hour (e.g. "11" or "14") or time range (e.g. c("11:30", "11:45")) one wishes to subset. Note that time should be given in a 24 hr clock. Time range is structured as a character string vector consisting of the lower time followed by the upper time limits as: c(lower time, upper time). When sub setting only a single hour period, simply just use the hour one is interested in sub setting.
#' @return A data.frame consisting of the sub temperature and humidity values that are subset by the hour or time range of interest.
#' @examples
#' #Get a range of temperatures
#' time <- subtime("./data/temp.csv", time = c("07:00", "08:00"))
#' #Get an hour
#' time <- subtime("./data/temp.csv", time = c("11"))


subtime <- function(d, time){
	if(length(time) >1){
	#subset range of times
	dT <- subset(d, format(Date.time, "%H:%M")  >= time[1] & format(Date.time, "%H:%M")  <= time[2])
	}else{
	#subset particular hour
	dT <- subset(d, format(Date.time, "%H")  == time )
	}
    return(dT)
}

#' Import and subset iButton files and data.
#' @param dir The directory of the ibutton and/or hydrochron files. 
#' @param date  The date, as a character string, that one wishes to subset. Note that the format of the date should be "year-month-day" with only a four digit year.
#' @param time The hour (e.g. "11" or "14") or time range [e.g. c("11:30", "11:45")] one wishes to subset. Note that time should be given in a 24 hr clock. Time range is structured as a character string vector consisting of the lower time followed by the upper time limits as: c(lower time, upper time). When sub setting only a single hour period, simply just use the hour one is interested in sub setting. You must use two digits to to query each hour (i.e. "09" NOT "9").
#' @param list A logical argument specifying whether the data frame returned should be kept as a list or amalgamated into a data frame that can be queried using column names.
#' @return A data.frame or list of temperatures/humidity across the dates and times that data was collected. 
#' @examples
#' data <- ibuttProc("data/", date = "2015-11-02", time = c("07:00", "08:00"), list = TRUE)	

ibuttProc <- function(dir, date, time, list = TRUE){
	imp <- import(dir)

		if(length(list.files(dir, pattern = ".csv")) > 1){
		d   <- lapply(imp, function(x) process(x))

		# Subset date of interest
		dDate <- lapply(d, function(x) subdate(x, date))
		# Subset time of interest
		dfin<- lapply(dDate, function(x) subtime(x, time))
			if(list == TRUE){
			return(dfin)
			} else {
			return(plyr::ldply(dfin))
			}
		} else {
		d   <- process(imp)
		# Subset time and date of interest
		dDate <- subdate(d, date)
		dfin<-subtime(x, time)
		return(dfin)
		}
}




