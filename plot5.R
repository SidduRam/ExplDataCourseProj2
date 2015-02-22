
# Set the working directory where data source file(s) downloaded
setwd("C:/Data-Science/Working_Test1/ExploratoryDataAnalysis_CourseProj2")

# Load the RDS file/ data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Set the library
library(ggplot2)
library(lubridate)

# Subset the Baltimore City, Maryland data
MD <- subset(NEI, fips == '24510' & type == 'ON-ROAD')

# Sum the data by year
MD.sum <- aggregate(MD[, 'Emissions'], by = list(MD$year), sum)
colnames(MD.sum) <- c('Year', 'Emissions')

# create png file
png(filename = 'plot5.png')
ggplot(data = MD.sum, aes(x = Year, y = Emissions)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + ggtitle('Total Emissions of Motor Vehicle in Baltimore City, Maryland') + ylab('PM2.5') + geom_text(aes(label = round(Emissions, 0), size = 2, hjust = 1.5, vjust = 1.5)) + theme(legend.position = 'none') + scale_colour_gradient(low = 'green', high = 'red')


# Shut down the graphic device 
dev.off()
