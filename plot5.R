NEI <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds")

library(ggplot2)

# Subset NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fips
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips == "24510",]

png("plot5.png", width = 480, height = 480, units = "px", bg = "transparent")

ggp <- ggplot(baltimoreVehiclesNEI, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", fill = "maroon", width = 0.75) +
  theme_bw() +  guides(fill = FALSE) +
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()
