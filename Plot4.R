#Q4-Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Make sure that summarySCC_PM25.rds and Source_Classification_Code.rds is in your working directory
#Reading the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#merging two data
data1<-merge(NEI, SCC, by="SCC")

#subsetting the coal combustion-related sources data
hasCoal<-grepl("coal",data1$Short.Name,ignore.case = TRUE)
coalSubData<-data1[hasCoal,]

# calculating the total emissions from PM2.5 for each year
data <- tapply(coalSubData$Emissions,coalSubData$year,FUN=sum)

as.data.frame(data)

png("plot4.png")
barplot(data,xlab = "year",ylab="Total emissions from PM2.5",col=2,main = "Total emissions from coal combustion-related sources \n in the United states from 1999 to 2008" )
dev.off()

