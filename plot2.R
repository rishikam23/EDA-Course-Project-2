# Reading the data files
NEI=readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC=readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# Filter for Baltimore City (FIPS: 24510) and aggregate
baltimore_em=subset(NEI,fips=="24510")
baltimore_tot=aggregate(Emissions~year,data=baltimore_em,sum)

# Plot 2: Total Emissions in Baltimore City, Maryland (fips=="24510")
barplot(baltimore_tot$Emissions,names.arg=baltimore_tot$year,col="pink",xlab="Year",ylab="Total PM2.5 Emissions(tons)",main="Total PM2.5 Emissions in Baltimore City, Maryland",beside=TRUE)
dev.copy(png,"plot2.png")
dev.off()