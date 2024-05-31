library("dplyr")
library("ggplot2")
library("readr")
library(plotly)
setwd("C:\\Users\\Binyam\\Documents\\Info201code\\exploratory-analysis-bkebede1")
data_wa <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")
summarise(data_wa)
plot_data <- data_wa %>% 
  select(2, 3, 5, 6, 7, 19:23)
plot_data <- plot_data %>% 
  pivot_longer(cols = 6:10, names_to = "Races", values_to = "Value")
  
data1 <- subset(plot_data, county_name == "King County")
ggplot(data1, aes(x=year, y=Value, colour = Races)) +
  geom_line(aes(x = year, y=Value, col = Races)) +
  theme(axis.text.x = element_text(face="bold", size = 10),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(face = "bold", color = "white", size=13)) +
  labs(title = "Trends over time", x="Time", y="Population") 

  



  