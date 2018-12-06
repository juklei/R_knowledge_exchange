## Describe the purpose of the script
## 
##
## First edit: 
## Last edit: 
##
## Author: Julian Klein

## 1. Clear environment and load libraries -------------------------------------

rm(list = ls())

if(!require(dplyr)){install.packages("dplyr")}
require("dplyr")


dir.create("results")
capture.output(summary(lm_out)) %>% write(., "results/lm_out.txt")

## -------------------------------END-------------------------------------------
