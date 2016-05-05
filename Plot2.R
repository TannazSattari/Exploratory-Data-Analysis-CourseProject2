#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

#Make sure that summarySCC_PM25.rds and Source_Classification_Code.rds is in your working directory
#Reading the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data of Baltimore
subData <- subset(NEI,NEI$fips=="24510")

# calculating the total emissions from PM2.5 for each year
data <- tapply(subData$Emissions,subData$year,FUN=sum)

#drawing the barplot
par(mar=c(4,4,3,2))
png('plot2.png')
barplot(data,xlab = "year",ylab="Total emissions from PM2.5",main = "Total emissions from PM2.5 \n in the Baltimore City, Maryland from 1999 to 2008" )
dev.off()