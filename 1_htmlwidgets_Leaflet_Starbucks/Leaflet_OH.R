library(tidyverse)
library(leaflet) 
library(magrittr)
library(stringr)

# download.file("https://opendata.socrata.com/api/views/ddym-zvjk/rows.csv?accessType=DOWNLOAD",destfile="data.csv",method="libcurl")

# Base R
# starbucks1 <- read.csv("data.csv")

# readr
starbucks <- read_csv("starbucks.csv")

# is this needed? as_tibble(starbucks)

# rename(starbucks, `StoreNumber` =  `Store Number` )

#Make State a factor for later on
#starbucks$State.f <- factor(starbucks$State)
#is.factor(starbucks$State.f)

class(starbucks)

#View(starbucks2)

starbucks

# Base R
# starbucks <- starbucks1[ which(starbucks1$State=='VA' & starbucks1$Country== 'US'), ]

# Dplyr
# Without pipes
# starbucks_MO <- filter(starbucks, Country== 'US', State=='VA')

starbucks_MA <- starbucks %>%
  filter(Country== 'US', State=='MA')%>% 
  select(Brand, `Store Number`, `Ownership Type`, City,	State,	Zip, Country, Coordinates,	Latitude,	Longitude, Name)


leaflet() %>% addTiles() %>% setView(-71.085159, 42.366440, zoom = 12) %>% 
  addTiles() %>% 
  addCircleMarkers(data = starbucks_MA, lat = ~ Latitude, lng = ~ Longitude, popup = starbucks_MA$Name) %>%
  addPopups(-71.085159, 42.366440, 'the <b> spot</b>')

