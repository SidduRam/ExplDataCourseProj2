
# Set the working directory where data source file(s) downloaded
setwd("C:/Data-Science/Working_Test1/ExploratoryDataAnalysis_CourseProj2")

# Load the RDS file/ data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# sum the 'Emissions' data by year
EmissionsByYear <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
EmissionsByYear$PM <- round(EmissionsByYear[, 2] /1000, 2)

# Create the PNG file
png(filename = "plot1.png")
barplot(EmissionsByYear$PM, EmissionsByYear$Group.1, names.arg = EmissionsByYear$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = 'PM2.5 in Kilotons')

# Shut down the graphic device 
dev.off()