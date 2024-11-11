library(ggplot2)
# Reading the data files
NEI=readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC=readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# Baltimore and LA motor vehicle emissions
vehicle_scc=SCC[grep("Vehicle",SCC$EI.Sector),"SCC"]
vehicle_baltimore_la=NEI[NEI$SCC %in% vehicle_scc & NEI$fips %in% c("24510","06037"), ]
vehicle_baltimore_la$city=ifelse(vehicle_baltimore_la$fips=="24510","Baltimore","Los Angeles")

# Aggregating by year and city
em_by_city=aggregate(Emissions~year+city,data=vehicle_baltimore_la,sum)

# Plot 6: Motor Vehicle Emissions in Baltimore vs. Los Angeles
ggplot(em_by_city,aes(x=factor(year),y=Emissions,fill=city))+geom_bar(stat="identity",position="dodge")+labs(title="Motor Vehicle PM2.5 Emissions: Baltimore vs. Los Angeles",x="Year",y="PM2.5 Emissions(tons)")+theme_minimal()+scale_fill_manual(values=c("lightgreen", "magenta"))
dev.copy(png,"plot6.png")
dev.off()
