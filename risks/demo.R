require(dplyr)
require(magrittr)

setwd("C:/Users/creil/Desktop/Winter 2017/Info498/demos/risks/data/prepped")
data <- data.frame(read.csv("risk-factors.csv"))

#Fill the all ages column with averages across all ages
data$all.ages <- rowMeans(select(data, starts_with("X")), na.rm=TRUE)

#Find the highest relative risk
highest_risk <- filter(data, all.ages == max(all.ages)) %>% select(category, outcome)

#Find the which disease has the greatest risk for each risk factor
highest_disease_risk <- group_by(data, category) %>% summarise(max(all.ages))

#Find which risk factor is the greatest for each disease
highest_risk_by_disease <- group_by(data, category) %>% summarise(max(all.ages))