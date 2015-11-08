.First <-
function () 
{
    library(plyr)
    library(plotrix)
    cat("\nWelcome at", date(), "\n")
}
.resize <-
function () 
{
    w <- system2("tput", "cols", stdout = TRUE)
    w <- as.integer(w)
    if (is.finite(w)) {
        options(width = w)
    }
}
