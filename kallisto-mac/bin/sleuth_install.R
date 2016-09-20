#!/usr/bin/env Rscript
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
install.packages("devtools", repos='http://cran.us.r-project.org')
devtools::install_github("pachterlab/sleuth", ref = "v0.28.0" )
