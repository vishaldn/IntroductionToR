

#### CHAPTER 6. JOINS, SUMMARY TABLES AND EXPORT ####


## Import Libraries
library(readr)  ## To import .csv
library(readxl) ## To import .xls/.xlsx


# Set Working Directory
setwd("C:/Users/Théo/Desktop/Work/Greatlearning.in/Statistics Podcasts/Introduction to R/Datasets/")

# Import first dataset
Countries = read_csv("Countries Population.csv")
summary(Countries)

# Clean column names and set right data types
colnames(Countries) = make.names(colnames(Countries))
Countries$Country.Name = as.factor(Countries$Country.Name)
Countries$Country.Code = as.factor(Countries$Country.Code)
summary(Countries)


# Import second dataset
Countries_Map = read_excel("Countries Region Mapping.xlsx")
summary(Countries_Map)

# Set right data types
Countries_Map$Country.Code = as.factor(Countries_Map$Country.Code)
Countries_Map$Region = as.factor(Countries_Map$Region)
Countries_Map$IncomeGroup = as.factor(Countries_Map$IncomeGroup)
summary(Countries_Map$IncomeGroup)

# Set to ordered factor, and give order
Countries_Map$IncomeGroup = ordered(Countries_Map$IncomeGroup, levels= c("Low income",
                                                                         "Lower middle income",
                                                                         "Upper middle income",
                                                                         "High income"))
class( Countries_Map$IncomeGroup)
summary(Countries_Map)


# Import Third Dataset
Countries_Info= read_csv("Countries Indicators.csv")
summary(Countries_Info)
Countries_Info$Country.Code=as.factor(Countries_Info$Country.Code)
summary(Countries_Info)




#### MERGING DATASETS TOGETHER


# Left Join
temp= merge(Countries,Countries_Map, by="Country.Code", all.x = TRUE )

# Correct Inner Join 
Countries_All = merge(Countries,Countries_Map, by="Country.Code" )

#Full Outer Join 
temp2 = merge(Countries_All,Countries_Info, by="Country.Code",all=TRUE )

# Correct Left Join
Countries_All = merge(Countries_All,Countries_Info, by="Country.Code",all.x=TRUE )


## Remove unwanted object from global environment
rm(temp,temp2)



#### SUMMARY TABLES

## table()

Region_vs_Income_Cat=table(Countries_All$Region,Countries_All$IncomeGroup)
Region_vs_Income_Cat

prop.table(Region_vs_Income_Cat,1) # Row Total is 1

prop.table(Region_vs_Income_Cat,2) # Column Total is 1


## %>% group_by()

install.packages("dplyr")
library(dplyr)

# Extract different Regions
Region_sum= Countries_All %>% group_by(Region) %>% summarise()
View(Region_sum)

# Extract different combinations of Regions and Income Groups
Region_Income_sum= Countries_All %>% group_by(Region, IncomeGroup) %>% summarise()
View(Region_Income_sum)

# Same with amount of countries in each categories
Region_Income_sum= Countries_All %>% group_by(Region, IncomeGroup) %>% summarise(Number.of.Countries = n())
View(Region_Income_sum)

# Amount of different income groups per region
Region_sum= Countries_All %>% group_by(Region) %>% summarise(Different.Income.Groups= n_distinct(IncomeGroup))
View(Region_sum)

## Big Summary about each region
Region_sum= Countries_All %>% group_by(Region) %>% summarise(Number.of.Countries = n(),
                                                             Total.Population.In.Million = sum (Total.Population.2017)/1000000,
                                                             Countries.With.Low.Income = sum(IncomeGroup == "Low income"),
                                                             Average.GDP.per.Capita= mean(GDP.per.capita.2017, na.rm= TRUE),
                                                             Median.GDP.per.Capita= median(GDP.per.capita.2017, na.rm= TRUE),
                                                             Std.Deviation.GDP.per.Capita = sd(GDP.per.capita.2017, na.rm= TRUE),
                                                             Min.Under.5.Mortality.Rate = min(Under.5.Mortality.Rate.2017,na.rm=TRUE),
                                                             Max.Under.5.Mortality.Rate = max(Under.5.Mortality.Rate.2017,na.rm=TRUE))
View(Region_sum)




 

#### EXPORTING DATA

# As CSV file
write.csv(Region_sum, "As_csv_Region_Summary_2017.csv", row.names = FALSE)


# As RDS object
saveRDS(Countries_All, "As_RDS_Countries_All_Data_2017.RDS")


# Re-import RDS
Countries_All2 = readRDS("As_RDS_Countries_All_Data_2017.RDS")





