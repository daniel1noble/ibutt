
# Main function. Process and store ibutton data as lists or amalgamated data frame, which can be easily queried.

ibuttProc <- function(dir, list = TRUE){
	imp <- import(dir)
	
	d <- lapply(imp, function(x) process(x))	
		if(list == TRUE){
		return(d)
		} else {
		plyr::ldply(d)
		}
}