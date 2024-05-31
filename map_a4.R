library(tidyverse)
library("dplyr")
library("ggplot2")
library("readr")
library(plotly)
library(stringr)

data_wa <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")

map_data <- data_wa %>% 
  select(5, 16) %>% 
  group_by(county_name) %>% 
  summarise(Avg_Prison_Pop_Rate = mean(total_prison_pop_rate, na.rm = T))
  #pivot_longer(cols = 2, names_to = "variable", values_to = "Value")

map_data$county_name <- gsub("County","", as.character(map_data$county_name))
map_data$county_name <- tolower(map_data$county_name)

#states <- map_data("state", region = "Washington")
counties <- map_data("county", region = "washington")
colnames(counties)[6] <- "county_name"
counties$county_name <- paste(counties$county_name, "")
comb_data <- merge(counties, map_data, by = "county_name", all=F)

ggplot()+ geom_polygon(data = comb_data, aes(x=long, y=lat, group = Avg_Prison_Pop_Rate, fill = Avg_Prison_Pop_Rate), colour = "black") +
  labs(face="", x = "", y="") + ggtitle("Average Prison Population by County (1990-2018)") +
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(), axis.line = element_blank(), axis.text.x = element_blank() , axis.ticks.x = element_blank() ,
  axis.text.y = element_blank() , axis.ticks.y = element_blank())
  

