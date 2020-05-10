

#### CHAPTER 4 - IMPORTING ####



### PACKAGES 

# Install package on computer (from CRAN repository)
install.packages("readr")

# load package in R session
library(readr)


### WORKING DIRECTORY

# Set working directory (tells R where to import files from/export files to)
setwd(
"C:/Users/Théo/Desktop/Work/Greatlearning.in/Statistics Podcasts/Introduction to R/Datasets/")

# Get working directory
getwd()


### Import .Txt with space separated values

# read.table() function to import .txt files
Titanic = read.table("Titanic_space_separated.txt", header=TRUE) # No "sep" term, as space is the default separator
class(Titanic)


### SEE DATA

# See all data
View(Titanic)

## See first 10 rows
head(Titanic,10)

# See last 5 rows
tail(Titanic,5)


### SEE OVERVIEWS

# Overview function N°1
str(Titanic)

# Change column's type to character
Titanic$Sex = as.character(Titanic$Sex) # Sex column is overwritten by "character" version of Sex column

# Overview function N°2
summary(Titanic)

# Change column's type to factor
Titanic$Sex = as.factor(Titanic$Sex)


### Import .txt with comma separated values

# read.table() function to import .txt files
Orange = read.table("Orange_comma_separated.txt", header = TRUE, sep = ",") # sep= "," for comma separated files
class(Orange)

summary(Orange)

Orange$Tree = as.factor(Orange$Tree)


### Import .csv file

# load readr for read_csv() function
library(readr)

#  Use read_csv() to import .csv files
Countries = read_csv("Countries Population.csv")

summary(Countries)
Countries$`Country Name` = as.factor(Countries$`Country Name`)
Countries$`Country Code` = as.factor(Countries$`Country Code`)
## Note: Column names have spaces in them, hence are not in proper format. R add `this quotes` to treat columns normally
## Next chapter covers how to get proper format for column names


### Import excel document

# Install readxl package to machine and load in Rsession to use read_excel() fucntion
install.packages("readxl")
library(readxl)

# Use read_excel() to import xlsx documents
Countries_Region <- read_excel("Countries Region Mapping.xlsx")
# Can also use Rstudio interface

class(Countries_Region)

# Make Countries_Region a proper data frame object
Countries_Region= as.data.frame(Countries_Region)
