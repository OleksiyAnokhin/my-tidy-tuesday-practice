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
ggplot(wine_data, aes(points, price)) + geom_point()

ggplotly(ggplot(wine_data, aes(points, price)) + geom_point()) + theme_tufte()

wine_data_value <- wine_data %>% select(title, country, points, price, variety) %>% drop_na() %>% 
        mutate(wine_value = price/points) %>%
        arrange(wine_value) 

# wine_value_top_100 <- wine_data_value %>% arrange(wine_value) %>% top_n(100)
        
knitr::kable(wine_value_top_100)


