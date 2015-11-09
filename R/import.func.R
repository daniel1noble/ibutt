#' Import a list of .csv files generated from iButtons and Hydrochrons. Save these files to a list and name the data.frames the file names
#' @param dir Directory path to the folder containing the temperature/humidity data. Files should be .csv.

import <- function(dir){
	list <- as.list(list.files(dir, pattern = ".csv"))
	dat <- lapply(list, function(x) readLines(paste0(dir,x)))
	names(dat) <- unlist(list)
	return(dat)
}

