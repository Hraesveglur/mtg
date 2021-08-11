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
MH2 <- data.frame(MH2.1$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

MH2.2 <- data.frame(MH2.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

MH2 <- rbind(MH2, MH2.2)
MH2 <- MH2[head(seq_len(ncol(MH2)), -1)]
MH2 <- setNames(MH2, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))


##
ZEN <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:zen%20lang=en&page=1')
ZEN.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:zen%20lang=en&page=2')
ZEN <- data.frame(ZEN$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
ZEN.2 <- data.frame(ZEN.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

ZEN <- rbind(ZEN, ZEN.2)
ZEN <- ZEN[head(seq_len(ncol(ZEN)), -1)]
ZEN <- setNames(ZEN, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

###
AKH <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:akh%20lang=en&page=1')
AKH.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:akh%20lang=en&page=2')
AKH <- data.frame(AKH$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
AKH.2 <- data.frame(AKH.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

AKH <- rbind(AKH, AKH.2)
AKH <- AKH[head(seq_len(ncol(AKH)), -1)]
AKH <- setNames(AKH, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

###

STX <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:stx%20lang=en&page=1')
STX.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:stx%20lang=en&page=2')
STX <- data.frame(STX$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
STX.2 <- data.frame(STX.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

STX <- rbind(STX, STX.2)
STX <- STX[head(seq_len(ncol(STX)), -1)]
STX <- setNames(STX, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

###

HOU <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:hou%20lang=en&page=1')
HOU.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:hou%20lang=en&page=2')
HOU <- data.frame(HOU$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
HOU.2 <- data.frame(HOU.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

HOU <- rbind(HOU, HOU.2)
HOU <- HOU[head(seq_len(ncol(HOU)), -1)]
HOU <- setNames(HOU, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))


### Limited Edition Alpha

LEA <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:lea%20lang=en&page=1')
LEA.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:lea%20lang=en&page=2')
LEA <- data.frame(LEA$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
LEA.2 <- data.frame(LEA.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

LEA <- rbind(LEA, LEA.2)
LEA <- LEA[head(seq_len(ncol(LEA)), -1)]
LEA <- setNames(LEA, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Limited Edition Beta

LEB <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:LEB%20lang=en&page=1')
LEB.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:LEB%20lang=en&page=2')
LEB <- data.frame(LEB$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
LEB.2 <- data.frame(LEB.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

LEB <- rbind(LEB, LEB.2)
LEB <- LEB[head(seq_len(ncol(LEB)), -1)]
LEB <- setNames(LEB, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Lorwyn

LRW <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:LRW%20lang=en&page=1')
LRW.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:LRW%20lang=en&page=2')
LRW <- data.frame(LRW$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
LRW.2 <- data.frame(LRW.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

LRW <- rbind(LRW, LRW.2)
LRW <- LRW[head(seq_len(ncol(LRW)), -1)]
LRW <- setNames(LRW, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Amonkhet Invocations - MP2

MP2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:MP2%20lang=en&page=1')

MP2 <- data.frame(MP2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))


MP2 <- MP2[head(seq_len(ncol(MP2)), -1)]
MP2 <- setNames(MP2, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Innistrad - ISD

ISD <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:ISD%20lang=en&page=1')
ISD.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:ISD%20lang=en&page=2')
ISD <- data.frame(ISD$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
ISD.2 <- data.frame(ISD.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

ISD <- rbind(ISD, ISD.2)
ISD <- ISD[head(seq_len(ncol(ISD)), -1)]
ISD <- setNames(ISD, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Secret Lair - SLD

SLD <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:SLD%20lang=en&page=1')
SLD.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:SLD%20lang=en&page=2')
SLD <- data.frame(SLD$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
SLD.2 <- data.frame(SLD.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

SLD <- rbind(SLD, SLD.2)
SLD <- SLD[head(seq_len(ncol(SLD)), -1)]
SLD <- setNames(SLD, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))


### Onslaught - ONS

ONS <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:ONS%20lang=en&page=1')
ONS.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:ONS%20lang=en&page=2')
ONS <- data.frame(ONS$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
ONS.2 <- data.frame(ONS.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

ONS <- rbind(ONS, ONS.2)
ONS <- ONS[head(seq_len(ncol(ONS)), -1)]
ONS <- setNames(ONS, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))


### Ikoria - IKO

IKO <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:IKO%20lang=en&page=1')
IKO.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:IKO%20lang=en&page=2')
IKO <- data.frame(IKO$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
IKO.2 <- data.frame(IKO.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

IKO <- rbind(IKO, IKO.2)
IKO <- IKO[head(seq_len(ncol(IKO)), -1)]
IKO <- setNames(IKO, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Double Masters - 2XM

DXM <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:2XM%20lang=en&page=1')
DXM.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:2XM%20lang=en&page=2')
DXM <- data.frame(DXM$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
DXM.2 <- data.frame(DXM.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

DXM <- rbind(DXM, DXM.2)
DXM <- DXM[head(seq_len(ncol(DXM)), -1)]
DXM <- setNames(DXM, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))


### Unlimited Edition - 2ED

UNL <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:2ED%20lang=en&page=1')
UNL.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:2ED%20lang=en&page=2')
UNL <- data.frame(UNL$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
UNL.2 <- data.frame(UNL.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

UNL <- rbind(UNL, UNL.2)
UNL <- UNL[head(seq_len(ncol(UNL)), -1)]
UNL <- setNames(UNL, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

####

Scryfall <- rbind(ZEN, MH2, AKH, STX, HOU, LEA, LEB, LRW, MP2, ISD, SLD, DXM, IKO, ONS, UNL)
Scryfall <- setNames(Scryfall, c('Name','tcgplayer_id','Edition','Set','Card.Number'))

# Update CSV
write.csv(Scryfall,"~/Documents/GitHub/mtg/Scryfall.csv", row.names = TRUE)







