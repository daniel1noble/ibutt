# ibutt

[![Build Status](https://travis-ci.org/daniel1noble/ibutt.png?branch =master)](https://travis-ci.org/daniel1noble/ibutt)

Package for processing and organising temperature and humidity data generated from iButtons and Hyrdochrons. 

## Installation instructions

**ibutt** is not on CRAN and installation will require that you install from the github repo or using devtools. To install use the following code:

```{r}
install.packages("devtools")
library(devtools)
install_github("daniel1noble/ibutt")
library(ibutt)
```

You can then load data and use all functions. Only simple functions are available at the moment. Help files exist for the few functions available, although they are not well documented as of yet and I am still working on a manual. Some example data (humidity and temperature) are also available if you want to give a few things a try, but I have yet figured out how to source a folder from an R package to make the examples work! So, unfortunately, no examples are functional. However, you can see what a data file would look like. 

This package is still in its infancy and there is much to expand and improve upon so if you have any queries, questions, concerns or just some suggestions on how to improve code I would greatly appreciate it.

Daniel Noble 

daniel.noble@unsw.edu.au

**Note**: This package is under active development and I don't gaurentee that everything will work, or whether it will necessarily do things correctly! Please make sure, if you use this package, to check that things are working as you expect them to be working. If there are any problems please don't hesitate to contact me.




