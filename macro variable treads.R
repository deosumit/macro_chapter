#Set working Directory 
setwd("C:/Users/sumit/Documents/UCLA/3rd Year/macro chapter")


#Install required packages
rm(list = ls())

pklist <- c("tidyverse","openxlsx","xlsx","scales")
source("https://fgeerolf.github.io/code/load-packages.R")


#Importing Data 
library(readxl)
annual <- read_excel("FRED data/macro_variables.xls",sheet = "Annual")
annual.fy <- read_excel("FRED data/macro_variables.xls",sheet = "Annual,_Fiscal_Year")
monthly <- read_excel("FRED data/macro_variables.xls",sheet = "Monthly")
qtrly <- read_excel("FRED data/macro_variables.xls",sheet = "Quarterly")
readme <- read_excel("FRED data/macro_variables.xls",sheet = "README")


monthly <- monthly %>% mutate(DATE=as.Date(DATE))
qtrly <- qtrly %>% mutate(DATE=as.Date(DATE))

#============
#Unemployment
#============

#Unemployment Rate
ggplot(data=filter(monthly,DATE>"1945-01-01"),aes(x=DATE,y=UNRATE) )+ 
  geom_bar(stat="identity",aes(fill=USREC)) + 
  scale_fill_gradient(low = "royalblue",    high = "red4")

#Employment to Pop ratio
ggplot(data=filter(monthly,DATE>"1945-01-01"),aes(x=DATE,y=EMRATIO) )+ 
  geom_bar(stat="identity",aes(fill=USREC)) + 
  scale_fill_gradient(low = "royalblue",    high = "red4") + 
  coord_cartesian( ylim = c(54, 66))

#Labour Force participation
ggplot(data=filter(monthly,DATE>"1945-01-01"),aes(x=DATE,y=CIVPART) )+ 
  geom_bar(stat="identity",aes(fill=USREC)) + 
  scale_fill_gradient(low = "royalblue",    high = "red4") + 
  coord_cartesian( ylim = c(58, 68))

#Labour Force participation split by gender
ggplot(data=filter(monthly,DATE>"1945-01-01") )+ 
  geom_line(aes(x=DATE,y=LNS11300001,color=USREC)) + 
  geom_line(aes(x=DATE,y=LNS11300002,color=USREC)) +
  scale_fill_gradient(low = "royalblue",    high = "red4") 


#===========
#Output
#===========