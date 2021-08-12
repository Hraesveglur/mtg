library(flexdashboard)
library(knitr)
library(DT)
library(rpivotTable)
library(ggplot2)
library(openintro)
library(highcharter)
library(dplyr)
library(tidyverse)
library(plotly)
library(maps)
library(httr)
library(jsonlite)


# $url = 'https://api.scryfall.com/cards/search?format=json&include_extras=false&include_multilingual=false&order=set&page=0&q=' . urlencode($query) . '%20lang=en&unique=prints';


end = 318
library(jsonlite)

baseurl <- "https://api.scryfall.com/cards/search?format=json&include_extras=false&include_multilingual=false&order=set&page="
pages <- list()
for(i in 0:end){
  fullScryfall <- fromJSON(paste0(baseurl, i, "&q=%20lang=en&unique=prints"), flatten=TRUE)
  message("Pulling from Scryfall, page ", i)
  pages[[i+1]] <- fullScryfall$data
}

# https://api.scryfall.com/cards/search?format=json&include_extras=false&include_multilingual=false&set=sta&order=set&page=1&q=%20lang=jp&unique=prints


library(plyr)
scryfallData <- rbind.fill(pages)

scryfallData<-data.frame(lapply(scryfallData, as.character), stringsAsFactors=FALSE)

write.csv(scryfallData,"~/Documents/GitHub/mtg/fullScryfall.csv", row.names = TRUE)
