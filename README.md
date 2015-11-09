# ibutt

Package for processing and organising temperature and humidity data generated from iButtons and Hyrdochrons. Only simple functions are available at the moment. 

# Installation instructions

**ibutt** is not on CRAN and installation will require that you install from the githib repo or an alternative way. I'm currently working on options for this. Although, if you need the functions, just download the zip, set the working directory to ibutt-master and source R/. Below is some code to do this.

```{r}
filelist <- paste0(getwd(),"/R/", list.files(paste0(getwd(),"/R")))

for(i in 1:length(filelist)){
	source(filelist[i])
}
```
Daniel Noble
daniel.noble@unsw.edu.au





