library(ggplot2)
# Reading the data files
NEI=readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC=readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# Aggregate by year and type for Baltimore
baltimore_type=aggregate(Emissions~year+type,data=baltimore_em,sum)

# Plot 3: Emission Trends by Source Type in Baltimore City
ggplot(baltimore_type,aes(x=factor(year),y=Emissions,fill=type))+geom_bar(stat="identity")+labs(title="PM2.5 Emission Trends by Source Type in Baltimore City",x="Year",y="Total PM2.5 Emissions(tons)")+theme_minimal()+scale_fill_brewer(palette="Set3")
dev.copy(png,"plot3.png")
dev.off()
