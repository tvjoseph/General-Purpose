## This file is for listing down various types of plots

### - Type 1 : Boxplot

boxplot(log(Emissions)~year,NEI,xlab = "Year",ylab = "log(PM2.5)")
dev.copy(png,file = "Assgn2-Plot1.png")
dev.off()

### - Type 2 : ggplot

subNEI <- subset(NEI,fips =="24510")

g <- ggplot(subNEI,aes(year,log(Emissions)),) ## Defining the ggplot
g + geom_point() + geom_smooth(method = "lm") + facet_grid(.~ type) ## adding other factors

