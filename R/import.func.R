
import <- function(fileList){
	lis <- as.list(list.files(fileList, pattern = ".csv"))
	dat <- lapply(lis, function(x) read.table(x, sep = ","))
	names(dat) <- unlist(lis)
	return(dat)
}


