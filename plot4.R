
# Set the working directory where data source file(s) downloaded
setwd("C:/Data-Science/Working_Test1/ExploratoryDataAnalysis_CourseProj2")

# Load the RDS file/ data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Set the library
library(ggplot2)
library(lubridate)

# Coal-related SCC
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

# Merges two data sets
merge <- merge(x = NEI, y = SCC.coal, by = 'SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# create png file
png(filename = 'plot4.png')
ggplot(data = merge.sum, aes(x = Year, y = Emissions / 1000)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + ggtitle('Total Emissions of PM2.5') + ylab('PM2.5 in kilotons') + geom_text(aes(label = round(Emissions / 1000, digits = 2), size = 2, hjust = 1.5, vjust = 1.5)) + theme(legend.position = 'none') + scale_colour_gradient(low = 'black', high = 'red')


# Shut down the graphic device 
dev.off()
