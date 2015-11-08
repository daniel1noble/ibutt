
# Import a list of .csv files generated from iButtons and Hydrochrons. Save these files to a list and name the data.frames the file names

import <- function(dir){
	list <- as.list(list.files(dir, pattern = ".csv"))
	dat <- lapply(list, function(x) readLines(paste0(dir,x)))
	names(dat) <- unlist(list)
	return(dat)
}

