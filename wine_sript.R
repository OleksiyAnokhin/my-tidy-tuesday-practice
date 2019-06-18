# Oleksiy Anokhin

# June 17, 2019

# Wine rankings

# Install libraries
library(tidyverse)

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
