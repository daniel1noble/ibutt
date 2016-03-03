pkgname <- "ibutt"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('ibutt')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("ibuttProc")
### * ibuttProc

flush(stderr()); flush(stdout())

### Name: ibuttProc
### Title: Import and subset iButton files and data.
### Aliases: ibuttProc

### ** Examples

dir <- paste0(system.file("extdata",  package="ibutt"), "/")
data <- ibuttProc(dir, date = "2015-11-06", time = c("10:00", "11:00"), list = TRUE)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
