getwd()
setwd("C:/Users/Madan/OneDrive/Desktop/DataScience")
getwd()
comp_data=read.csv("Computer_Data.csv")
names(comp_data)
nrow(comp_data)
ncol(comp_data)
dim(comp_data)
head(comp_data)
tail(comp_data)
comp_data[10:20,]
comp_data[20,3]
comp_data[10]
comp_data[c(1,2,3),]
comp_data[c(10,15,20),c(1,5,8)]
comp_data[,-c(1,3,5)]
data2 = subset(comp_data,price>4000)

