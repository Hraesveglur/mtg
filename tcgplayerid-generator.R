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

### Khans of Tarkir - KTK

KTK <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:KTK%20lang=en&page=1')
KTK.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:KTK%20lang=en&page=2')
KTK <- data.frame(KTK$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
KTK.2 <- data.frame(KTK.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

KTK <- rbind(KTK, KTK.2)
KTK <- KTK[head(seq_len(ncol(KTK)), -1)]
KTK <- setNames(KTK, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Revised - 3ED

REV <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:3ED%20lang=en&page=1')
REV.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:3ED%20lang=en&page=2')
REV <- data.frame(REV$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
REV.2 <- data.frame(REV.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

REV <- rbind(REV, REV.2)
REV <- REV[head(seq_len(ncol(REV)), -1)]
REV <- setNames(REV, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Fourth - 4ED

FED <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:4ED%20lang=en&page=1')
FED.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:4ED%20lang=en&page=2')
FED <- data.frame(FED$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
FED.2 <- data.frame(FED.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

FED <- rbind(FED, FED.2)
FED <- FED[head(seq_len(ncol(FED)), -1)]
FED <- setNames(FED, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Ice Age - ICE

ICE <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:ICE%20lang=en&page=1')
ICE.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:ICE%20lang=en&page=2')
ICE <- data.frame(ICE$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
ICE.2 <- data.frame(ICE.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

ICE <- rbind(ICE, ICE.2)
ICE <- ICE[head(seq_len(ncol(ICE)), -1)]
ICE <- setNames(ICE, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Fifth Edition - 5ED

FIFTH <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:5ED%20lang=en&page=1')
FIFTH.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:5ED%20lang=en&page=2')
FIFTH <- data.frame(FIFTH$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
FIFTH.2 <- data.frame(FIFTH.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

FIFTH <- rbind(FIFTH, FIFTH.2)
FIFTH <- FIFTH[head(seq_len(ncol(FIFTH)), -1)]
FIFTH <- setNames(FIFTH, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Tempest - TMP

TMP <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:TMP%20lang=en&page=1')
TMP.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:TMP%20lang=en&page=2')
TMP <- data.frame(TMP$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
TMP.2 <- data.frame(TMP.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

TMP <- rbind(TMP, TMP.2)
TMP <- TMP[head(seq_len(ncol(TMP)), -1)]
TMP <- setNames(TMP, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Urza's Saga - USG

USG <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:USG%20lang=en&page=1')
USG.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:USG%20lang=en&page=2')
USG <- data.frame(USG$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
USG.2 <- data.frame(USG.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

USG <- rbind(USG, USG.2)
USG <- USG[head(seq_len(ncol(USG)), -1)]
USG <- setNames(USG, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Urza's Legacy - ULG

ULG <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:ULG%20lang=en&page=1')
ULG <- data.frame(ULG$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

ULG <- ULG[head(seq_len(ncol(ULG)), -1)]
ULG <- setNames(ULG, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Sixth Edition - 6ED

SIXTH <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:6ED%20lang=en&page=1')
SIXTH.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:6ED%20lang=en&page=2')
SIXTH <- data.frame(SIXTH$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
SIXTH.2 <- data.frame(SIXTH.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

SIXTH <- rbind(SIXTH, SIXTH.2)
SIXTH <- SIXTH[head(seq_len(ncol(SIXTH)), -1)]
SIXTH <- setNames(SIXTH, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Urza's Destiny - UDS

UDS <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:UDS%20lang=en&page=1')
UDS <- data.frame(UDS$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

UDS <- UDS[head(seq_len(ncol(UDS)), -1)]
UDS <- setNames(UDS, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Mercadian Masques- MMQ

MMQ <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:MMQ%20lang=en&page=1')
MMQ.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:MMQ%20lang=en&page=2')
MMQ <- data.frame(MMQ$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
MMQ.2 <- data.frame(MMQ.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

MMQ <- rbind(MMQ, MMQ.2)
MMQ <- MMQ[head(seq_len(ncol(MMQ)), -1)]
MMQ <- setNames(MMQ, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Nemesis - NEM

NEM <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:NEM%20lang=en&page=1')
NEM <- data.frame(NEM$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

NEM <- NEM[head(seq_len(ncol(NEM)), -1)]
NEM <- setNames(NEM, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Seventh Edition - 7ED

SEVENTH <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:7ED%20lang=en&page=1')
SEVENTH.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:7ED%20lang=en&page=2')
SEVENTH <- data.frame(SEVENTH$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
SEVENTH.2 <- data.frame(SEVENTH.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

SEVENTH <- rbind(SEVENTH, SEVENTH.2)
SEVENTH <- SEVENTH[head(seq_len(ncol(SEVENTH)), -1)]
SEVENTH <- setNames(SEVENTH, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))


### 5th Dawn - 5DN

FDN <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:5DN%20lang=en&page=1')
FDN <- data.frame(FDN$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

FDN <- FDN[head(seq_len(ncol(FDN)), -1)]
FDN <- setNames(FDN, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))


### Lorwyn - LRW

LRW <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:LRW%20lang=en&page=1')
LRW.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:LRW%20lang=en&page=2')
LRW <- data.frame(LRW$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
LRW.2 <- data.frame(LRW.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

LRW <- rbind(LRW, LRW.2)
LRW <- LRW[head(seq_len(ncol(LRW)), -1)]
LRW <- setNames(LRW, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Mirrodin - MRD

MRD <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:MRD%20lang=en&page=1')
MRD.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:MRD%20lang=en&page=2')
MRD <- data.frame(MRD$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
MRD.2 <- data.frame(MRD.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

MRD <- rbind(MRD, MRD.2)
MRD <- MRD[head(seq_len(ncol(MRD)), -1)]
MRD <- setNames(MRD, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

### Shadowmoor - SHM

SHM <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:SHM%20lang=en&page=1')
SHM.2 <- jsonlite::read_json('https://api.scryfall.com/cards/search?format=json&q=set:SHM%20lang=en&page=2')
SHM <- data.frame(SHM$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))
SHM.2 <- data.frame(SHM.2$data %>% spread_all %>% select('name','tcgplayer_id','set_name','set','collector_number'))

SHM <- rbind(SHM, SHM.2)
SHM <- SHM[head(seq_len(ncol(SHM)), -1)]
SHM <- setNames(SHM, c('Name','tcgplayer_id','Edition','Set','CollectorNumber'))

###

Scryfall <- rbind(ZEN, MH2, AKH, STX, HOU, LEA, LEB, LRW, MP2, ISD, 
                  SLD, DXM, IKO, ONS, UNL, KTK, REV, FED, ICE, FIFTH, 
                  TMP, USG, ULG, SIXTH, UDS, MMQ, NEM, SEVENTH, FDN,
                  LRW, MRD, SHM)
Scryfall <- setNames(Scryfall, c('Name','tcgplayer_id','Edition','Set','Card.Number'))

# Update CSV
write.csv(Scryfall,"~/Documents/GitHub/mtg/Scryfall.csv", row.names = TRUE)







