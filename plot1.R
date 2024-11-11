# Reading the data files
NEI=readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC=readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# Aggregating total emissions by year
tot_em=aggregate(Emissions~year,data=NEI,sum)

# Plot 1: Total PM2.5 Emissions in the U.S.(1999,2008)
barplot(tot_em$Emissions,names.arg=tot_em$year,col="blue",xlab="Year",ylab="Total PM2.5 Emissions(tons)",main="Total PM2.5 Emissions in the U.S.(1999–2008)",beside=TRUE)
dev.copy(png,"plot1.png")
dev.off()