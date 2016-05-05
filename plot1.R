#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Make sure that summarySCC_PM25.rds and Source_Classification_Code.rds is in your working directory
#Reading the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# calculating the total emissions from PM2.5 for each year
data <- tapply(NEI$Emissions,NEI$year,FUN=sum)

#drawing the barplot
par(mar=c(4,4,2,2))
png('plot1.png')
barplot(data,xlab = "year",ylab="Total emissions from PM2.5",main = "Total emissions from PM2.5 in the USA from 1999 to 2008" )
dev.off()