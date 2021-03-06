
R version 3.6.3 (2020-02-29) -- "Holding the Windsock"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> NEI <- readRDS("summarySCC_PM25.rds")
> 
> SCC <- readRDS("Source_Classification_Code.rds")
> library(ggplot2)

Attaching package: �ggplot2�

The following object is masked _by_ �.GlobalEnv�:

    diamonds

> NEISCC <- merge(NEI, SCC, by="SCC")
> coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
> subsetNEISCC <- NEISCC[coalMatches, ]
> aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)
> png("plot4.png", width=640, height=480)
> g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
> g <- g + geom_bar(stat="identity") + xlab("year") +ylab(expression('Total PM'[2.5]*" Emissions")) +ggtitle('Total Emissions from coal sources from 1999 to 2008')
> print(g)
> dev.off()
null device 
          1 
> 
