
#' Main function to process and store ibutton data as lists or amalgamated data frame, which can be easily queried.
#' @param dir The directory of the ibutton and/or hydrochron files. 
#' @param list A logical argument specifying whether the data frame returned should be kept as a list or amalgamated into a data frame that can be queried using column names.
#' @return A data.frame or list of temperatures/humidity across the dates and times that data was collected. 
#' @examples
#' data <- ibuttProc("data/", list = TRUE)	


ibuttProc <- function(dir, list = TRUE){
	imp <- import(dir)

		if(length(list.files(dir, pattern = ".csv")) > 1){
		d   <- lapply(imp, function(x) process(x))	
			if(list == TRUE){
			return(d)
			} else {
			plyr::ldply(d)
			}
		} else {
		d   <- process(imp)
		}

 	return(d)
}