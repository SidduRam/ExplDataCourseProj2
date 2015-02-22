
# Set the working directory where data source file(s) downloaded
setwd("C:/Data-Science/Working_Test1/ExploratoryDataAnalysis_CourseProj2")

# Load the RDS file/ data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the Baltimore City, Maryland data
MD <- subset(NEI, fips == '24510')

# Set the factor variable for year value
MD$year <- factor(MD$year, levels = c('1999', '2002', '2005', '2008'))


# Create the PNG file
png(filename = "plot31.png", width = 800, height = 600, units = 'px')

# Set the library
library(ggplot2)

# Use the ggplot
qplot(MD$year, MD$Emissions, data = MD, facets = . ~ type, color = type, alpha = I(0.9), main = 'Emissions per Type in Baltimore City, Maryland', xlab = 'Year', ylab = 'Log of PM2.5 Emissions')

# Shut down the graphic device 
dev.off()


