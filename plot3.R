NEI <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds")

library(ggplot2)

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Sum of the Baltimore emissions data by year
aggTotal <- aggregate(Emissions ~ year, baltimoreNEI, sum)

png("plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

ggp <- ggplot(baltimoreNEI, aes(factor(year), Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  theme_bw() + guides(fill = FALSE) +
  facet_grid(.~type,scales = "free", space = "free") + 
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title = expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()
