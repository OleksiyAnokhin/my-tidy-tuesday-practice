library(tidyverse)
library(ggthemes)
library(knitr)
library(leaflet)
library(leaflet.extras)
library(maps)
library(mapdata)
library(ggmap)
library(stringr)
library(viridis)
library(zipcode)



pets <- read_csv("seattle_pets.csv")

zips <- pets %>% group_by(zip_code) %>% summarize(number = n()) %>% arrange(desc(number))
zips

data(zipcode)
zipcode

seatlle_zips <- left_join(zips, zipcode, by = c("zip_code"="zip"))

leaflet(seatlle_zips) %>% 
  setView(lng = -122.3, lat = 47.6, zoom = 11) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircles(lng =~longitude, lat =~latitude, weight = 1,
             radius =~number*0.2, color = "red", opacity = 1)

print(pets$species)

cap_zips <- pets %>% filter(species == "Cat") %>% group_by(zip_code) %>% summarize(number = n()) %>% arrange(desc(number))
dog_zips <- pets %>% filter(species == "Dog") %>% group_by(zip_code) %>% summarize(number = n()) %>% arrange(desc(number))


cats <- pets %>% filter(species == "Cat")

cat_zips <- cats %>% group_by(zip_code) %>% summarize(number = n()) %>% arrange(desc(number))

cat_zips <- left_join(cat_zips, zipcode, by = c("zip_code"="zip"))


pets$license_issue_date



pets <- read_csv("seattle_pets.csv")
pets
pets$license_issue_date <- mdy(pets$license_issue_date)
class(pets$license_issue_date)
pets$license_issue_date <- as.yearmon(pets$license_issue_date, "%m/%Y")

pets_by_month <- pets %>% group_by(license_issue_date, species) %>% summarize(number = n())

ggplot(pets_by_month, aes(license_issue_date, number, color = species)) + geom_line() +
theme_tufte() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none")

pets_by_month_2015 <- pets_by_month %>%
  filter(license_issue_date >= as.yearmon("Jan 2015") & license_issue_date <= as.yearmon("Dec 2018")) %>%
  filter(species == "Cat" | species == "Dog")

goats_pigs <- pets %>%
  filter(species == "Pig" | species == "Goat") %>% group_by(animals_name, species) %>% summarize(number = n())

pets_names <- pets %>% group_by(species, animals_name) %>% summarize(number = n()) %>% arrange(desc(number)) %>% filter(number >= 100)
pets_names


