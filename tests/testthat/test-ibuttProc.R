context("Check correct data processing")

test_that("Check that processDat is working right by testing data class", {
	dir <- paste0(system.file("extdata",  package="ibutt"),"/")
	x   <-  ibuttProc(dir, date = "2015-11-06", time = c("10:00", "11:00"), list = TRUE)
	x2 <-  ibuttProc(dir, date = "2015-11-06", time = c("10:00", "11:00"), list = FALSE)

	expect_is(x, "list", info = "x is not a list as expected")
	expect_is(x2, "data.frame", info = "x is not a dataframe as expected")
})