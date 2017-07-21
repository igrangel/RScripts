require(reshape2)
require(ggplot2)

data <- read.csv(file = "E://Deutch/MyPhD/papers/AlligatorPSL/results/results1.csv", header=TRUE, sep=",")
dfm <- melt(data[,c('Experiments','Precision','Recall','Fmeasure')],id.vars = 1)

rgraph <- ggplot(dfm,aes(x = Experiments,y = value)) + 
          geom_bar(aes(fill = variable),stat = "identity",position = "dodge") +
          #scale_fill_discrete("") +
          theme(
            axis.title.x=element_blank(),
            axis.title.y=element_blank(),
            legend.position="top",
            legend.title = element_blank(),
            legend.background = element_rect(fill="white",size=0.5, linetype="solid",colour ="black"),
            panel.background = element_blank(), 
            panel.grid.minor = element_blank(),
            #axis.line.x = element_line(color="black", size = .75),
            #axis.line.y = element_line(color="black", size = .75),
            axis.line = element_line(colour = "black"),
            panel.border = element_rect(colour = "black", fill=NA, size=1)
          ) +
  scale_fill_manual(values=c("#5F5F5F", "#DFE0E2", "gray"), breaks=c("Precision", "Recall", "Fmeasure")) +
  scale_x_discrete(expand = c(0,0)) + scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0.5,1))
rgraph