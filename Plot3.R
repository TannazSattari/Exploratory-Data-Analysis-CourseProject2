#Q3-Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

#Make sure that summarySCC_PM25.rds and Source_Classification_Code.rds is in your working directory
#Reading the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#loading library
library(ggplot2)

#subsetting the data of Baltimore
subData <- subset(NEI,NEI$fips=="24510")

# calculating the total emissions from PM2.5 for each year
data <- aggregate(subData$Emissions,by=list(subData[,5],subData[,6]),FUN =sum)

#drawing the barplot
par(mar=c(4,4,3,2))
png('plot3.png')
g <- ggplot(data, aes(x=data[,2], y=data[,3], fill = factor(data[,1])))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total emissions from PM2.5 \n in the Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()
