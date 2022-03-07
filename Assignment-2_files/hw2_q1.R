#capmetro_UT <- read.csv('https://raw.githubusercontent.com/ChildhoodMoments/ECO395M-1/master/data/capmetro_UT.csv')
# must add raw data, rather than frame data
library(tidyverse)
library(dplyr)
capmetro_UT <- read.csv('D:/01 UT Austin/2022 spring/DataMining/data-mining/HW2/capmetro_UT.csv')
summary(capmetro_UT$month)


capmetro_UT = mutate(capmetro_UT,
                     day_of_week = factor(day_of_week,
                                          levels=c("Mon", "Tue", "Wed","Thu", "Fri", "Sat", "Sun")),
                     month = factor(month,
                                    levels=c("Sep", "Oct","Nov")))




ave_board_hour = capmetro_UT %>%
  group_by(hour_of_day, day_of_week,month) %>%
  summarise(mean_boarding = mean(boarding)) %>%
  ggplot(aes(x = hour_of_day, y = mean_boarding,color = month, ))+
  geom_line()+
  facet_wrap(~day_of_week)+
  labs(title = "average boarding numbers ")


ave_board_temp = capmetro_UT %>%
  group_by(timestamp)%>%
  ggplot(aes(x = temperature, y = boarding, color = weekend)) + 
  geom_point()+
  facet_wrap(~hour_of_day)



