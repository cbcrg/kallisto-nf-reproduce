!#/usr/bin/env Rscript

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

install.packages("devtools")

devtools::install_github("pachterlab/sleuth")
