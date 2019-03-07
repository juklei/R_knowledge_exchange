## Describe the purpose of the script
## 
##
## First edit: 
## Last edit: 
##
## Author: Your Name


### Kate made a change 


## 1. Clear environment and load libraries -------------------------------------

rm(list = ls())

if(!require(dplyr)){install.packages("dplyr")}

## 2. Define or source functions used in this script ---------------------------

source("scripts/....")

fun <- function(x){summary(lm(x[, 1] ~ x[, 2]))}

## 3. Load and explore data ----------------------------------------------------

dir("data")
mydata <- read.csv("data/mydata.csv")
head(mydata)

## Create dummy data set:
mydata <- expand.grid(tree = c(20, 30, 40, 10), lichen = c(1, 3, 4, 12))

## 4. Do things ----------------------------------------------------------------

lm_out <- fun(x = mydata)

## Export:

dir.create("results")
capture.output(lm_out) %>% write(., "results/lm_out.txt")

## -------------------------------END-------------------------------------------
