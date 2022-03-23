#Note: for this to work you need to get a Google Maps API key and either provide it as an argument to gmap() or set it as an option in your R session options(GMAP_API_KEY=xxx) or set it as a system environment variable, GMAP_API_KEY.

library(rbokeh)
library(dplyr)
bike <- read.csv("Bike_Share_Stations.csv")
bike_small <- bike %>% select(LATITUDE, LONGITUDE, NUMBER_OF_DOCKS)
bike_small %>% head

gmap(lat = 39.768597, lng = -86.162682, zoom = 13,
     width = 600, height = 800, map_type = "road_map") %>%
  ly_points(LONGITUDE, LATITUDE, data = bike_small,
            fill_alpha = 0.5, size = 1.25*NUMBER_OF_DOCKS, color = "black",
            hover = c(NUMBER_OF_DOCKS))
