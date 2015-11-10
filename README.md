# ibutt

Package for processing and organising temperature and humidity data generated from iButtons and Hyrdochrons. Only simple functions are available at the moment. 

## Installation instructions

**ibutt** is not on CRAN and installation will require that you install from the github repo or an alternative way. I'm currently working on options for this. Although, probably the easiest way to load the package is to clone the repo:

```{r}
git clone git@github.com:daniel1noble/ibutt.git
```

In R, use the devtools package to load all package contents:

```{r}
install.packages("devtools")
library(devtools)
load_all("PATHTO/ibutt/")
```

You can then load data and use all functions. Help files should exist (although they are crappy) for the few functions available and example data (humidity and temperature) are also available. 

This package is still in its infancy and there is much to expand and improve upon.

Daniel Noble
daniel.noble@unsw.edu.au





