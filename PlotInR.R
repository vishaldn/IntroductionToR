

#### CHAPTER 7. PLOTS ####


# Set Working Directory
setwd("C:/Users/Théo/Desktop/Work/Greatlearning.in/Statistics Podcasts/Introduction to R/Datasets/")


## Import RDS file created in previous chapter
Countries_All = readRDS("As_RDS_Countries_All_Data_2017.RDS")
summary(Countries_All)  ### Data ares are kept identical


## Take out observations with 
Countries_Sub = Countries_All [!is.na(Countries_All$Region),]



# Import ggplot2 package for graphs
install.packages("ggplot2")
library(ggplot2)


## Numeric Distribution

# Default: Histogram
qplot(GDP.per.capita.2017,data= Countries_Sub)

# Add Title and labels:
qplot(GDP.per.capita.2017,data= Countries_Sub,
      main = " GDP Per Capita Distribution in 2017",
      xlab = "GDP per Capita",
      ylab = "Frequency")

# Save plot in global environment
p = qplot(GDP.per.capita.2017,data= Countries_Sub,
      main = "SAVED - GDP Per Capita Distribution in 2017",
      xlab = "GDP per Capita",
      ylab = "Frequency")
#Call object
p

# Density
qplot(GDP.per.capita.2017,data= Countries_Sub, geom ="density",
      main = " GDP Per Capita Distribution in 2017",
      xlab = "GDP per Capita",
      ylab = "Density")


## Categorical distribution

## Default: Bar plot
qplot(Region,data= Countries_Sub,
      main = "Region Distribution",
      xlab = "Region",
      ylab = "Frequency")


## Numerical against Categorical

# Default: Dot plot
qplot(Region,Under.5.Mortality.Rate.2017,data=Countries_Sub,
      main = "Mortality Rate Distribution per Region",
      xlab = "Region",
      ylab = "Under 5 Mortality Rate")


# Box plot
qplot(Region, Under.5.Mortality.Rate.2017,data=Countries_Sub, geom= "boxplot",
      main = "Mortality Rate Distribution per Region",
      xlab = "Region",
      ylab = "Under 5 Mortality Rate")

# Colored Density plot
qplot( Under.5.Mortality.Rate.2017,fill = Region, data=Countries_Sub, geom= "density", alpha=I(.8),
      main = "Mortality Rate Distribution per Region",
      xlab = "Under 5 Mortality Rate",
      ylab = "Frequency")


## Categorical against categorical

# Colored bar plot
qplot(Region,fill=IncomeGroup,data=Countries_Sub, geom= "bar",
      main = "Income Group Distribution per Region",
      xlab = "Region",
      ylab = "Frequency")


## Numerical against numerical

# Default: Dot plot
qplot(GDP.per.capita.2017, Under.5.Mortality.Rate.2017,data=Countries_Sub,
      main = "Mortality Rate Distribution against Countries' GDP per Capita in 2017",
      xlab = "GDP per Capita",
      ylab = "Under 5 Mortality Rate")



## Three variables

#Colored Dot plot
qplot(GDP.per.capita.2017, Under.5.Mortality.Rate.2017, color = Region, data=Countries_Sub,
      main = "Mortality Rate Distribution against Countries' GDP per Capita in 2017",
      xlab = "GDP per Capita",
      ylab = "Under 5 Mortality Rate")

## Save last plot as an image
ggsave('Mortality_Rate_GDP_Region.jpeg', width = 9, height = 6)

## Save any plot from global environment as an image
ggsave('GDP_per_Capita_Distrib.jpeg',p, width = 9, height = 6)
