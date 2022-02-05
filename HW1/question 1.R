library(tidyverse)
ABIA <- read.csv('D:/01 UT Austin/2022 spring/DataMining/HW1/ABIA.csv')

library(lubridate)
###  first calculate the average departure delay time over 2008
AverageDayDelay <- ABIA %>% 
  select(Year, Month, DayofMonth, ArrDelay, DepDelay, ) %>%
  mutate(departureday = make_datetime(Year, Month, DayofMonth)) 

delay = AverageDayDelay %>%
  group_by(departureday) %>%
  summarise(mean_dep_delay = mean(DepDelay, na.rm = TRUE))

delay %>%
ggplot(aes(x = departureday, y = mean_dep_delay)) +
  geom_line()+
  labs(title = "average departure delay time over 2008 ")+
  labs(x = 'date', y = '(minutes)')



##calculate the average departure delay time over a day

AverageSpecificTimeDelay <- ABIA %>%
  select(Year, Month, DayofMonth, CRSDepTime, ArrDelay, DepDelay) %>%
  mutate(departureday = make_datetime(Year, Month, DayofMonth, CRSDepTime %/% 100, CRSDepTime %% 100)) %>%
  mutate(CRSdeparttime = format(departureday, format = "%H"))
  

delayoneday = AverageSpecificTimeDelay %>%
  group_by(CRSdeparttime) %>%
  summarise(mean_dep_oneday = mean(DepDelay, na.rm = TRUE))



ggplot(delayoneday) +
  geom_line(aes(x = CRSdeparttime, y = mean_dep_oneday, group =1)) +
  labs(title = "average departure delay time over one day ")+
  labs(x = 'time', y = '(minutes)')

## question What is the best time of day to fly to minimize delays, and does this change by airline?

answer1 <- ABIA %>% 
  select(Year, Month, DayofMonth, CRSDepTime, DepDelay, UniqueCarrier) %>%
  mutate(departureday = make_datetime(Year, Month, DayofMonth, CRSDepTime %/% 100, CRSDepTime %% 100)) %>%
  mutate(CRSdeparttime = format(departureday, format = "%H"))

delay_airline = answer1 %>%
  group_by(CRSdeparttime, UniqueCarrier) %>%
  summarise(count = n(),
            mean_dep_delay = mean(DepDelay, na.rm = TRUE))

delay_airline %>%
  filter(count > 50)%>%
  ggplot(aes(x = CRSdeparttime, y = mean_dep_delay)) +
  geom_line(group = 1)+
  facet_wrap(~UniqueCarrier)

  

  
# question What is the best time of year to fly to minimize delays,
  #and does this change by destination? 
  #(You'd probably want to focus on a handful of popular destinations.)
  
answer2 <- ABIA %>%
  select(Year, Month, DayofMonth, DepDelay, Dest) %>%
  mutate(departureday = make_datetime(Year, Month, DayofMonth))

delaytime_dest = answer2 %>%
  group_by(departureday, Dest) %>%
  summarise(count = n(),
            mean_dep_delay = mean(DepDelay, na.rm = TRUE))

delaytime_dest %>%
  filter(count > 5) %>%
  ggplot(aes(x = departureday, y = mean_dep_delay, group=1)) +
  geom_line()+
  facet_wrap(~Dest)
  

# question What are the bad airports to fly to and does this change by time of year or day?
# filter long delay time airport, and cancel airport 
# group by time over a year or over a month


# choose dep delay larger than 30 mintues
answer3 <- ABIA %>%
  select(Year, Month, DayofMonth, DepDelay, Origin, Dest)%>%
  mutate(departureday = make_datetime(Year, Month, DayofMonth)) %>%
  filter(DepDelay > 60)

view(answer3)

bad_airport = answer3 %>%
  group_by(Origin, Dest) %>%
  summarise(count = n(),
            mean_dep_delay = mean(DepDelay, na.rm =  TRUE)) %>%
  filter(count > 50) %>%
  arrange(desc(mean_dep_delay))
# average long dep delay origin airport and dest airport over a year


# average long dep delay origin airport AUS over a year
bad_airport_over_a_year = answer3 %>%
  group_by(Origin, departureday) %>%
  summarise(count = n(),
            mean_dep_delay = mean(DepDelay, na.rm =  TRUE)) %>%
  filter(count > 10, mean_dep_delay > 30) 

bad_airport_over_a_year %>%
  ggplot(aes(x = departureday, y = mean_dep_delay)) +
  geom_line()



# average long dep delay over a day

answer3_2 <- ABIA %>% 
  select(Year, Month, DayofMonth, CRSDepTime, DepDelay, Origin, Dest) %>%
  mutate(departureday = make_datetime(Year, Month, DayofMonth, CRSDepTime %/% 100, CRSDepTime %% 100)) %>%
  mutate(CRSdeparttime = format(departureday, format = "%H"))

bad_airport_over_a_day = answer3_2 %>%
  filter(DepDelay >30) %>%
  group_by(Origin, CRSdeparttime) %>%
  summarise(count = n(),
            mean_dep_delay = mean(DepDelay, na.rm =  TRUE)) %>%
  filter(count>30, mean_dep_delay>30)



bad_airport_over_a_day %>%
  filter(count>30, mean_dep_delay>30) %>%
  ggplot(aes(x = CRSdeparttime, y = mean_dep_delay, group =1)) +
  geom_line()


