# Reading the data files
NEI=readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC=readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# Coal combustion-related sources
coal_scc=SCC[grep("Coal",SCC$EI.Sector),"SCC"]
coal_data=NEI[NEI$SCC %in% coal_scc, ]

# Aggregating emissions by year for coal sources
coal_em=aggregate(Emissions~year,data=coal_data,sum)

# Plot 4: Emissions from Coal Combustion Sources in the U.S.
barplot(coal_em$Emissions,names.arg=coal_em$year,col=c("lightblue","beige"),xlab="Year",ylab="Coal Combustion PM2.5 Emissions(tons)",main="Coal Combustion Emissions in the U.S.(1999–2008)")
dev.copy(png,"plot4.png")
dev.off()