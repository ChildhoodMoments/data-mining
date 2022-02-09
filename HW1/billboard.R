billboard <- read.csv('D:/01 UT Austin/2022 spring/DataMining/billboard.csv')
library(tidyverse)



# part_A  Make a table of the top 10 most popular songs since 1958, 
#as measured by the total number of weeks that a song spent on the Billboard Top 100. 
part_A = billboard %>%
  group_by(performer, song)%>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  head(10, part_A)

# part B Is the "musical diversity" of the Billboard Top 100 changing over time?
#excludes the years 1958 and 2021   useful: https://www.datasciencemadesimple.com/remove-duplicate-rows-r-using-dplyr-distinct-function/#:~:text=Cool%20Text%20Symbol-,Remove%20Duplicate%20rows%20in%20R%20using%20Dplyr%20%E2%80%93%20distinct%20()%20function,variable%20or%20with%20multiple%20variable.

part_b =billboard %>%
  filter(year != 1958 & year != 2021) 

  
# counts the number of times that a given song appears on the Top 100 in a given year
part_b_1 <- part_b %>%
  group_by(year,song)%>%
  summarise(count = n())
part_b_2 <- part_b_1 %>% distinct(song, .keep_all = TRUE)  # why? what if a popular song was posted in the end of a year?
# count the number of unique songs that appeared on the Top 100 in each year, 
# irrespective of how many times it had appeared.
part_b_3 <- part_b_2 %>%
  group_by(year) %>%
  summarise(count = length(unique(song)))

# make a line graph to show muscial diversity over the years
ggplot(data = part_b_3)+
  geom_line(aes(x = year, y = count, group = 1))

  


## part C "ten-week hit" as a single song that appeared on the Billboard Top 100 for at least ten weeks. 
# find performer and music satisfy ten-week hit
part_c_1 <- billboard %>% 
  group_by(song, performer)%>%
  summarise(count = n())%>%
  arrange(desc(count)) %>%
  filter(count >= 10)

# group_by performance check their names and frequency, filter people who have less than 30 songs
part_c_2 <- part_c_1 %>%
  group_by(performer) %>%
  summarise(count = n())%>%
  filter(count >= 30) %>%
  arrange(desc(count))
  
ggplot(data = part_c_2, )+
  geom_col(aes(reorder(performer, count), count))+
  coord_flip()
  


