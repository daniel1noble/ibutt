
# Import a list of .csv files generated from iButtons and Hydrochrons. Save these files to a list and name the data.frames the file names

import <- function(fileList){
	lis <- as.list(list.files(fileList, pattern = ".csv"))
	dat <- lapply(lis, function(x) readLines(paste0(fileList,x)))
	names(dat) <- unlist(lis)
	return(dat)
}


