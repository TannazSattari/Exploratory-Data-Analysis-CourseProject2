#Q6-Compare emissions from motor vehicle sources in Baltimore City with emissions
#from motor vehicle sources in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?

#Make sure that summarySCC_PM25.rds and Source_Classification_Code.rds is in your working directory
#Reading the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the coal combustion-related sources data
subData <- subset(NEI,(NEI$fips=="24510" | NEI$fips=="06037")& NEI$type=="ON-ROAD")

#calculating the sum
data <- aggregate(subData$Emissions,by=list(subData$fips,subData$year),FUN =sum)
data[data$Group.1=="06037",]$Group.1<-"Los Angeles County, LA"
data[data$Group.1=="24510",]$Group.1<-"Baltimore City,MD"

#draw the plot

png("plot6.png", width=680, height=480)
library("ggplot2")
g <- ggplot(data, aes(x=data[,2], y=data[,3], color= data[,1]))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total emissions from motor vehicle sources \n in the Baltimore City & Los Angeles County \n  from 1999 to 2008')
print(g)
dev.off()