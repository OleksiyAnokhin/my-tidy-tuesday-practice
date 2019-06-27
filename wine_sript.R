# Oleksiy Anokhin

# June 17, 2019

# Wine rankings

# Install libraries
library(tidyverse)
library(ggthemes)
library(moderndive)
library(plotly)

# Read data
# wine_data <- read_csv("winemag-data-130k-v2.csv")

# Drop X1 column with numbers of rows
# wine_data <- wine_data %>% select(-c(X1))

# Save data as RDS file! 
# saveRDS(wine_data, "wine_data.rds")

# Read RDS file
wine_data <- readRDS("wine_data.rds")

# Show correlation
ggplot(wine_data, aes(points, price)) + geom_point() + theme_tufte()

wine_by_country <- wine_data %>% group_by(country) %>% summarize(n()) %>% arrange(desc(`n()`)) # %>%
  # ggplot(., aes(country, `n()`)) + geom_bar(stat = "identity")

knitr::kable(wine_by_country)

# wine_by_country_top10 <- wine_data %>% group_by(country) %>% summarize(n()) %>% 
#   arrange(desc(`n()`)) %>% top_n(10) %>%
#   ggplot(., aes(country, price)) + 
#   geom_boxplot(color = "red", fill = "orange", alpha = 0.2)


wine_data %>%
  ggplot(., aes(country, price)) + 
  geom_boxplot(color = "black", alpha = 0.2) + 
  theme_tufte() + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())


