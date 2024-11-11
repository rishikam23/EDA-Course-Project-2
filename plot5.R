# Reading the data files
NEI=readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC=readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# Motor vehicle sources in Baltimore
vehicle_scc=SCC[grep("Vehicle",SCC$EI.Sector),"SCC"]
vehicle_baltimore=NEI[NEI$SCC %in% vehicle_scc & NEI$fips=="24510", ]

# Aggregating by year
vehicle_em=aggregate(Emissions~year,data=vehicle_baltimore,sum)

# Plot 5: Motor Vehicle Emissions in Baltimore City
barplot(vehicle_em$Emissions,names.arg=vehicle_em$year,col="purple",xlab="Year",ylab="Motor Vehicle PM2.5 Emissions(tons)",main="Motor Vehicle Emissions in Baltimore City (1999–2008)")
dev.copy(png,"plot5.png")
dev.off()
