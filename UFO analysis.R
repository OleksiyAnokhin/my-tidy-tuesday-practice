# Oleksiy Anokhin

# June 25, 2019

# UFO Analysis

# Packages
# library(tidyverse)
# library(leaflet)

# Read data
# ufo_data <- read_csv("ufo_sightings.csv")
# 
# # Save data as RDS file! 
# saveRDS(ufo_data, "ufo_data.rds")

# Read RDS file
# ufo_data <- readRDS("ufo_data.rds")
# 
# ufo_popup <- paste0("<br><strong>Date & time: </strong>", 
#                     ufo_data$date_time,
#                      "<br><strong>City area: </strong>", 
#                     ufo_data$city_area,
#                     "<br><strong>State: </strong>", 
#                     ufo_data$state,
#                     "<br><strong>Country: </strong>", 
#                     ufo_data$country,
#                     "<br><strong>UFO shape: </strong>", 
#                     ufo_data$ufo_shape,
#                     "<br><strong>Encounter length: </strong>", 
#                     ufo_data$encounter_length,
#                     "<br><strong>Described encounter length: </strong>", 
#                     ufo_data$described_encounter_length,
#                      "<br><strong>Description: </strong>",
#                     ufo_data$description,
#                      "<br><strong>Date documented: </strong>",
#                     ufo_data$date_documented,
#                      "<br><strong>Longitude: </strong>",
#                     ufo_data$longitude,
#                      "<br><strong>Latitude: </strong>",
#                     ufo_data$latitude)


leaflet(ufo_data) %>% 
  # setView(-93.65, 42.0285, zoom = 10) %>%
  addProviderTiles(providers$Stamen.TonerLite) %>%
  addMarkers(~longitude, ~latitude, 
             clusterOptions = markerClusterOptions(), popup = ufo_popup)

                    