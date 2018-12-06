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

## 2. Define or source functions used in this script ---------------------------

source()

## 3. Load and explore data ----------------------------------------------------

dir("data")
x <- read.csv("data/Book1.csv")
head(x)

lm_out <- lm(x$a~x$b)

dir.create("results")
capture.output(summary(lm_out)) %>% write(., "results/lm_out.txt")

## -------------------------------END-------------------------------------------
