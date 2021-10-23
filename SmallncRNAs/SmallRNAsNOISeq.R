#Clear environment
rm(list=ls())

#Open Bioconductor and download the package
source("http://bioconductor.org/biocLite.R")
biocLite("NOISeq")
#Call for the package
library(NOISeq)

#RC1
#Import the data properly
columns<-c("RC10BR1","RC10BR2","RC10BR3","RC1100BR1","RC1100BR2","RC1100BR3")
columns
data<-read.table(file.choose(),header=TRUE,row.names=1,col.names=columns)
data

#Prepare factors and length information
myfactors=data.frame(Isolate=c("RC1_0-0","RC1_0-0","RC1_0-0","RC1_100-100","RC1_100-100","RC1_100-100"),IsolateRun=c("RC1_0-0_1","RC1_0-0_2","RC1_0-0_3","RC1_100-100_1","RC1_100-100_2","RC1_100-100_3"),Run=c("R1","R2","R3","R1","R2","R3"))
myfactors
mylength<-read.table(file.choose(),header=TRUE)
head(mylength)

#Prepare data object for NOIseq
mydata<-readData(data,length=mylength,factors=myfactors)
mydata

#Run NOISeq DE analysis
mynoiseqbio=noiseqbio(mydata,k=0.5,norm="rpkm",factor="Isolate",conditions=c("RC1_0-0","RC1_100-100"),r=20,adj=1.5,plot=FALSE,a0per=0.9,random.seed=12345,filter=1)
mynoiseqbio

#See results
head(mynoiseqbio@results[[1]])

#Select genes with statistically significant DE
mynoiseq.deg=degenes(mynoiseqbio,q=0.95,M=NULL)
mynoiseq.deg
write.csv(mynoiseq.deg,file="mynoiseq.deg.csv")


#Genes upregulated in no fungicide condition (down in AR)
mynoiseq.deg1=degenes(mynoiseqbio,q=0.95,M="up")
mynoiseq.deg1
write.csv(mynoiseq.deg1,file="mynoiseq.deg1.csv")


##Genes downregulated in no fungicide condition (up in AR)
mynoiseq.deg2=degenes(mynoiseqbio,q=0.95,M="down")
mynoiseq.deg2
write.csv(mynoiseq.deg2,file="mynoiseq.deg2.csv")

DE.plot(mynoiseqbio,q=0.95,graphic="expr",log.scale=TRUE)
DE.plot(mynoiseqbio,q=0.95,graphic="MD")

#US23
#Import the data properly
columns<-c("Gene","US230BR1","US230BR2","US230BR3","US23100BR1","US23100BR2","US23100BR3")
columns
data<-read.table(file.choose(),header=TRUE,row.names=1,col.names=columns)
data

#Prepare factors and length information
myfactors=data.frame(Isolate=c("US23_0-0","US23_0-0","US23_0-0","US23_100-100","US23_100-100","US23_100-100"),IsolateRun=c("US23_0-0_1","US23_0-0_2","US23_0-0_3","US23_100-100_1","US23_100-100_2","US23_100-100_3"),Run=c("R1","R2","R3","R1","R2","R3"))
myfactors
mylength<-read.table(file.choose(),header=TRUE)
head(mylength)

#Prepare data object for NOIseq
mydata<-readData(data,length=mylength,factors=myfactors)
mydata

#Run NOISeq DE analysis
mynoiseqbio=noiseqbio(mydata,k=0.5,norm="rpkm",factor="Isolate",conditions=c("US23_0-0","US23_100-100"),r=20,adj=1.5,plot=FALSE,a0per=0.9,random.seed=12345,filter=1)

#See results
head(mynoiseqbio@results[[1]])

#Select genes with statistically significant DE
mynoiseq.deg=degenes(mynoiseqbio,q=0.95,M=NULL)
mynoiseq.deg
write.csv(mynoiseq.deg,file="mynoiseq.deg.csv")


#Genes upregulated in no fungicide condition (down in AR)
mynoiseq.deg1=degenes(mynoiseqbio,q=0.95,M="up")
mynoiseq.deg1
write.csv(mynoiseq.deg1,file="mynoiseq.deg1.csv")


##Genes downregulated in no fungicide condition (up in AR)
mynoiseq.deg2=degenes(mynoiseqbio,q=0.95,M="down")
mynoiseq.deg2
write.csv(mynoiseq.deg2,file="mynoiseq.deg2.csv")

DE.plot(mynoiseqbio,q=0.95,graphic="expr",log.scale=TRUE)
DE.plot(mynoiseqbio,q=0.95,graphic="MD")


#US22
#Import the data properly
columns<-c("US220BR1","US220BR2","US220BR3","US22100BR1","US22100BR2","US22100BR3")
columns
data<-read.table(file.choose(),header=TRUE,row.names=1,col.names=columns)
data

#Prepare factors and length information
myfactors=data.frame(Isolate=c("US22_0-0","US22_0-0","US22_0-0","US22_100-100","US22_100-100","US22_100-100"),IsolateRun=c("US22_0-0_1","US22_0-0_2","US22_0-0_3","US22_100-100_1","US22_100-100_2","US22_100-100_3"),Run=c("R1","R2","R3","R1","R2","R3"))
myfactors
mylength<-read.table(file.choose(),header=TRUE)
head(mylength)

#Prepare data object for NOIseq
mydata<-readData(data,length=mylength,factors=myfactors)
mydata

#Run NOISeq DE analysis
mynoiseqbio=noiseqbio(mydata,k=0.5,norm="rpkm",factor="Isolate",conditions=c("US22_0-0","US22_100-100"),r=20,adj=1.5,plot=FALSE,a0per=0.9,random.seed=12345,filter=1)

#See results
head(mynoiseqbio@results[[1]])

#Select genes with statistically significant DE
mynoiseq.deg=degenes(mynoiseqbio,q=0.95,M=NULL)
mynoiseq.deg
write.csv(mynoiseq.deg,file="mynoiseq.deg.csv")


#Genes upregulated in no fungicide condition (down in AR)
mynoiseq.deg1=degenes(mynoiseqbio,q=0.95,M="up")
mynoiseq.deg1
write.csv(mynoiseq.deg1,file="mynoiseq.deg1.csv")


##Genes downregulated in no fungicide condition (up in AR)
mynoiseq.deg2=degenes(mynoiseqbio,q=0.95,M="down")
mynoiseq.deg2
write.csv(mynoiseq.deg2,file="mynoiseq.deg2.csv")

DE.plot(mynoiseqbio,q=0.95,graphic="expr",log.scale=TRUE)
DE.plot(mynoiseqbio,q=0.95,graphic="MD")
