NEI <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds")

# Subset Baltimore in the NEI data
baltimoreNEI <- NEI[NEI$fips=="24510",]

# Sum the Baltimore emissions data by year
TotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI, sum)

# Creating png file for the plot
png("plot2.png",width=480,height=480,units="px",bg="transparent")

# Making the plot
barplot(
  TotalsBaltimore$Emissions,
  names.arg = TotalsBaltimore$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (Tons)",
  main = "Total PM2.5 Emissions From all Baltimore City Sources",
  col = "purple"
)

dev.off()