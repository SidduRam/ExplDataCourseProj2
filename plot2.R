
# Set the working directory where data source file(s) downloaded
setwd("C:/Data-Science/Working_Test1/ExploratoryDataAnalysis_CourseProj2")

# Load the RDS file/ data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subses the Baltimore City, Maryland data
MD <- subset(NEI, fips == '24510')

# sum the 'Emissions' data by year
EmissionsByYear <- aggregate(MD[, 'Emissions'], by = list(MD$year), FUN = sum)

# Create the PNG file
png(filename = "plot2.png")
barplot(EmissionsByYear$x, EmissionsByYear$Group.1, names.arg = EmissionsByYear$Group.1, main = expression('Total Emission in Baltimore City, MD'), xlab = 'Year', ylab = 'PM')

# Shut down the graphic device 
dev.off()