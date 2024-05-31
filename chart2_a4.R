library(tidyverse)
library("dplyr")
library("ggplot2")
library("readr")
library(plotly)

data_wa <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")

plot_data <- data_wa %>% 
  select(3, 5, 6, 7, 19:23)
#plot_data2 <- plot_data %>% 
  #pivot_longer(cols = 6:10, names_to = "variable", values_to = "Value")

data1 <- subset(plot_data, county_name == "King County")
data2 <- subset(plot_data, county_name == "Pierce County")

data3 <- rbind(data1, data2)
  
data4 <- data3 %>% 
  pivot_longer(cols = 5:9, names_to = "variable", values_to = "Value")

ggplot(data4, aes(x=variable, y=Value ,fill=urbanicity)) + geom_bar(stat="identity", position = position_dodge()) + 
  labs(face="bold", x = "Race", y="Population") + ggtitle("Urban Vs Suburban") +
  theme(axis.text.x = element_text(face="bold", angle=25, hjust=1)) +
  scale_x_discrete(labels=c("AA/PI", "Black", "LatinX", "Native", "White"))
