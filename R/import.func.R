#' Import a list of .csv files generated from iButtons and Hydrochrons. Save these files to a list and name the data.frames the file names
#' @param dir Directory path to the folder containing the temperature/humidity data. Files should be .csv. If more than one file is found it will separate each file as a list, if only one file is found then it will be read singly.
#' @return A character string containing the ibutton or hydrochron data. 

import <- function(dir){
	list <- as.list(list.files(dir, pattern = ".csv"))

		if(length(list) > 1){
			dat <- lapply(list, function(x) readLines(paste0(dir,x)))
			names(dat) <- unlist(list)
		} else{
			dat <- readLines(paste0(dir, list))
		}
	return(dat)
	
}

