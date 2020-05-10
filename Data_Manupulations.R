#### CHAPTER 5. Data Manipulations ####

# Working Directory
#setwd("C:/Users/Théo/Desktop/Work/Greatlearning.in/Statistics Podcasts/Introduction to R/Datasets/")

# Import dataset
library(readr)
Countries = read_csv("Countries Population.csv")

## Get info about functions
?colnames
?make.names()

## Give data frame's columns proper names
colnames(Countries) = make.names(colnames(Countries))

colnames(Countries)

# Set columns in right format
Countries$Country.Name= as.factor(Countries$Country.Name)
Countries$Country.Code= as.factor(Countries$Country.Code)

# Summary
summary(Countries)

### FILTERING/SUBSETTING

# Focus on first rows
First.Countries.Pop = head(Countries$Total.Population.2017,10)
First.Countries.Pop

# Create logical vector
Big.First.Countries.Flag = First.Countries.Pop>10000000 ## Condition: More than 10 million
Big.First.Countries.Flag


# Use logical statement to filter data
Countries[Countries$Total.Population.2017>10000000,]
Big.countries = Countries[Countries$Total.Population.2017>10000000,] ## Condition: More than 10 million


Small.Countries = Countries[Countries$Total.Population.2017<=2000000,] ## Condition: Less or equal to 2 million


# 2 logical conditions
#AND 
Big.and.Small.Countries= Countries[Countries$Total.Population.2017>10000000 & Countries$Total.Population.2017<=2000000,]

# OR
Big.and.Small.Countries= Countries[Countries$Total.Population.2017>10000000 |Countries$Total.Population.2017<=2000000,]

### BINDING

## Appending Datasets

Big.and.Small.Countries2= rbind(Big.countries,Small.Countries)


## Binding Columns

Big.Country.Flag = Big.and.Small.Countries2$Total.Population.2017>10000000

Big.and.Small.Countries2 = cbind(Big.and.Small.Countries2, Big.Country.Flag)


View(Big.and.Small.Countries2)

summary(Big.and.Small.Countries2)



### TRANSFORMING

# Have total population expressed in millions
Countries$Population.2017.Millions = Countries$Total.Population.2017 / 1000000

# Logarithm
Countries$Random.Pop.Transform = log(Countries$Total.Population.2017)
head(Countries$Random.Pop.Transform)
# Revert back with exponential
Countries$Random.Pop.Transform =exp(Countries$Random.Pop.Transform)
head(Countries$Random.Pop.Transform)



#### SORTING

# Sort Countries in ascending order of population
Countries = Countries[order(Countries$Total.Population.2017),]
View(Countries)


# Sort in descending order of population
Countries = Countries[order(-Countries$Total.Population.2017),]
View(Countries)
