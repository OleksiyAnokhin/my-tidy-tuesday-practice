library(tidyverse)
library(ggthemes)
library(leaflet)
library(leaflet.extras)


# Read data
albany_data <- read_rds("albany_data.rds")
albany_data_na <- albany_data %>% drop_na()

# Filter by race
albany_stops_by_race <- albany_data %>% group_by(subject_race) %>% summarise(number = n())

albany_stops_by_gender <- albany_data %>% group_by(subject_sex, subject_race) %>% summarise(number = n())

albany_black_stops <- albany_data %>% filter(subject_race == "black") # %>% arrange(desc(subject_age))


# albany_asian_stops <- albany_data %>% filter(subject_race == "asian/pacific islander")

# Visualize a number of stops by race
ggplot(albany_stops_by_race, aes(reorder(subject_race, number), number, fill = subject_race)) + geom_bar(stat = "identity") +
  theme_tufte() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none")

# # Filter by race and age
# albany_stops_by_race_age_gender <- albany_data_na %>% group_by(subject_race, subject_sex) %>% 
#   summarise(avg_age = mean(subject_age))
# albany_stops_by_race_age_gender

ggplot(albany_data, aes(subject_race, subject_age, fill = subject_race)) + geom_boxplot() +
  theme_tufte() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none")

# Convert time to hours
albany_data$time <- strptime(albany_data$time, "%H:%M:%S")
albany_data$time <- as.integer(format(crime.time, "%H"))

ggplot(albany_data, aes(time, fill = subject_race)) + geom_histogram(binwidth = 1, color = "black", alpha = 0.8) +
  scale_x_continuous(breaks = seq(0, 23, 1)) + 
  theme_tufte() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(legend.title = element_blank()) +
  theme(legend.position = "bottom") + 
  ylim(0, 8000)


albany_stops_by_violation_10 <- albany_data %>% group_by(violation) %>% summarise(number = n()) %>% arrange(desc(number)) %>% top_n(10)
albany_stops_by_violation_10 


albany_stops_by_violation_sex_10 <- albany_data %>% group_by(violation, subject_sex) %>% summarise(number = n()) %>% arrange(desc(number)) %>% select(number > 2331)

ggplot(albany_stops_by_violation_sex_10, aes(reorder(violation, number), number, color = subject_sex)) + geom_bar(stat = "identity") + coord_flip()

+
  theme_tufte() +
  coord_flip() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none") +
  xlim(0, 15000)


<center>
  ```{r, violation2, echo = FALSE, message = FALSE, warning = FALSE}
ggplot(albany_stops_by_violation_10, aes(reorder(violation, number), number)) + geom_bar(stat = "identity", color  = "black") +
  theme_tufte() +
  # coord_flip() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none") +
  xlim(0, 15000)
```


