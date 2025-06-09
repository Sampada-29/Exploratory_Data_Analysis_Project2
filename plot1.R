NEI <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/R_First Project/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds")

#Total emissions by year

aggregate_total <- aggregate(Emissions ~ year, data = NEI, FUN = sum)

# Creating png file for the plot
png("plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

# Making the plot
barplot(
  (aggregate_total$Emissions) /10000,
  names.arg = aggregate_total$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (in kilotons)",
  main = "Total PM2.5 Emissions From All US Sources",
  col = "cyan"
)

dev.off()
