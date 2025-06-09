NEI <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds")

library(ggplot2)

# Subset coal combustion related NEI data
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE) 
coalCombustion <- (combustion & coal)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

ggp <- ggplot(combustionNEI, aes(factor(year), Emissions/10^5)) +
  geom_bar(stat = "identity", fill = "orange", width = 0.75) +
  theme_bw() +  guides(fill = FALSE) +
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title = expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)

dev.off()