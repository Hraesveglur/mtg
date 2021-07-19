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

data <- read.csv("~/Documents/GitHub/mtg/data.csv")

collection <- data %>% select('Count','Name', 'Edition','Card.Number')

collection <- setNames(collection, c('count','name','edition','cardNumber')) 

library(jsonlite)
MH2.1 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:mh2%20lang=en&page=1')

MH2.2 <- jsonlite::read_json("https://api.scryfall.com/cards/search?format=json&q=set:mh2%20lang=en&page=2")

library(tidyjson)
MH2 <- data.frame(MH2.1$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))

MH2.2 <- data.frame(MH2.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))

MH2 <- rbind(MH2, MH2.2)
MH2 <- MH2[head(seq_len(ncol(MH2)), -1)]
MH2 <- setNames(MH2, c('Name','tcgplayer_id','Edition'))


##
ZEN <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:zen%20lang=en&page=1')
ZEN.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:zen%20lang=en&page=2')
ZEN <- data.frame(ZEN$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))
ZEN.2 <- data.frame(ZEN.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))

ZEN <- rbind(ZEN, ZEN.2)
ZEN <- ZEN[head(seq_len(ncol(ZEN)), -1)]
ZEN <- setNames(ZEN, c('Name','tcgplayer_id','Edition'))

###
AKH <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:akh%20lang=en&page=1')
AKH.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:akh%20lang=en&page=2')
AKH <- data.frame(AKH$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))
AKH.2 <- data.frame(AKH.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))

AKH <- rbind(AKH, AKH.2)
AKH <- AKH[head(seq_len(ncol(AKH)), -1)]
AKH <- setNames(AKH, c('Name','tcgplayer_id','Edition'))

###

STX <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:stx%20lang=en&page=1')
STX.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:stx%20lang=en&page=2')
STX <- data.frame(STX$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))
STX.2 <- data.frame(STX.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))

STX <- rbind(STX, STX.2)
STX <- STX[head(seq_len(ncol(STX)), -1)]
STX <- setNames(STX, c('Name','tcgplayer_id','Edition'))

###

HOU <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:hou%20lang=en&page=1')
HOU.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:hou%20lang=en&page=2')
HOU <- data.frame(HOU$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))
HOU.2 <- data.frame(HOU.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name'))

HOU <- rbind(HOU, HOU.2)
HOU <- HOU[head(seq_len(ncol(HOU)), -1)]
HOU <- setNames(HOU, c('Name','tcgplayer_id','Edition'))

Scryfall <- rbind(ZEN, MH2, AKH, STX, HOU)

write.csv(Scryfall,"~/Documents/GitHub/mtg/Scryfall.csv", row.names = TRUE)
