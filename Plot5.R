#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Make sure that summarySCC_PM25.rds and Source_Classification_Code.rds is in your working directory
#Reading the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the coal combustion-related sources data
subData <- subset(NEI,NEI$fips=="24510"& NEI$type=="ON-ROAD")

# calculating the total emissions from PM2.5 for each year
data <- tapply(subData$Emissions,subData$year,FUN=sum)
png("plot5.png")
barplot(data,xlab = "year",ylab="Total emissions from PM2.5",col=4, main = "Total emissions from motor vehicle sources \n in the Baltimore City, Maryland from 1999 to 2008" )
dev.off()

