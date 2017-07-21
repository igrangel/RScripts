library(reshape)

MyData <- read.csv(file = "E://Deutch/MyPhD/papers/AlligatorPSL/results/test.csv", header=TRUE, sep=",")
mdata <- melt(MyData, id=c("id"))
rgraph <- ggplot(data = mdata, aes(x=variable, y=value)) + geom_boxplot(aes(fill=variable)) + 
          scale_y_continuous(name="FMeasure", limits=c(0.6, 1)) +
          scale_x_discrete(name="Combination of Heterogeneities", limits=c("M1", "M1.M2","M1.M3","M1.M4","M1.M5","M1.M6","M1.M7")) +
          scale_fill_manual("Heterogeneities",values=c("#C0F8D1","#C0F8D1","#BDCFB5","#BDCFB5","#BDCFB5","#F6EFEE","#F6EFEE"), guide=FALSE) +
  theme(text = element_text(size=16),
        #legend.key = element_rect(fill = "transparent", colour = "transparent"),
        axis.title.x=element_blank(),
        #panel.grid.major = element_line(colour = "black"),
        #panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = 'white', colour = 'white')
  )  

rgraph

