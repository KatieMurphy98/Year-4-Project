##### Load libraries #####
library(ggplot2)
library(dplyr)
library(DAAG) #datasets
library(viridis) #colourmaps
library(pubr)
library(cowplot)
library(gridExtra)
library("httr")
library("readxl")

##### Ninja Warrior data #####

### Load and manipulate data ###
   #Data from: https://data.world/ninja/anw-obstacle-history
  
   GET("https://query.data.world/s/ttkvg64pqsrncsfpopxl3kbxnmioyq", write_disk(tf <- tempfile(fileext = ".xlsx")))
   NinjaWarrior <- as.data.frame(read_excel(tf))
   names(NinjaWarrior) <- c("season", "location", "stage", "name", "order")
  
  obstacles <- function(ObstacleNumbers){
     obst <- data.frame()
     j=1
   
     for (i in unique(NinjaWarrior$name)){
       dat <- filter(NinjaWarrior, name == i)
       obst[j, 1] <- i
       obst[j, 2] <- dim(dat)[1]
       j = j+1
     }
   
     obst <- arrange(obst, desc(V2))
     obst <- obst[ObstacleNumbers, ]
   }
#####



ninja_plots1 <- function(n.obst){

  obst <- obstacles(ObstacleNumbers = n.obst)
  names(obst) <- c('name', 'ntimes')
  obst$name <- c("A", "B", "C", "D")

  # default scale
  dflt <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip")) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # log scale
  lg <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip")) +
  scale_y_log10()+
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # truncated y
  obst <- obstacles(ObstacleNumbers = n.obst)
  names(obst) <- c('name', 'ntimes')
  obst$name <- c("A", "B", "C", "D")

  obstcount <- c()
  for(i in 1:dim(obst)[1]){
    obstcount <- append(
      obstcount, rep(obst[i, 1], ((obst[i, 2]-(min(obst[ ,2]))+1))))
  }
  
  bardat <- as.data.frame(obstcount) 
  

  trnc <- ggplot(data=bardat) +
  geom_bar(aes(x=obstcount), fill="#69b3a2") +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip")) +
  scale_y_continuous(breaks = c(0, 10, 20), labels = c(20, 30, 40))+
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  plot_grid(lg, dflt, trnc, 
            labels = c("A", "B", "C"),
            ncol = 2, nrow = 2)
}
ninja_plots1(2:5)


ninja_plots2 <- function(n.obst){

  obst <- obstacles(ObstacleNumbers = n.obst)
  names(obst) <- c('name', 'ntimes')
  obst$name <- c("A", "B", "C", "D", "E", "F", "G")

  # default
  dflt <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip","Jump Hang","Quad Steps","Jumping Spider")) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # narrow bars

  narrow <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip","Jump Hang","Quad Steps","Jumping Spider")) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme(aspect.ratio = 2/1)

  # wide bars
  wide <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip","Jump Hang","Quad Steps","Jumping Spider")) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(aspect.ratio = 0.3/1)


  # dots
  dot <- ggplot(data=obst) +
  geom_point(aes(x=name, y=ntimes), col="#69b3a2") +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip","Jump Hang","Quad Steps","Jumping Spider")) +
  scale_y_continuous(limits = c(0, 41), breaks=seq(0, 40, 10), labels=seq(0, 40, 10)) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  top <- plot_grid(narrow, dflt,
            labels = c("A", "B"),
            ncol = 2, nrow = 1)

  plot_grid(top, wide,
            labels = c(" ", "C"),
            ncol = 1, nrow = 2
            )

  ggsave("Plots/Ninja_Data/bars/all.jpeg")

  print(wide)
  ggsave("Plots/Ninja_Data/bars/wide.jpeg") 

  print(narrow)
  ggsave("Plots/Ninja_Data/bars/narrow.jpeg") 

  print(dflt)
  ggsave("Plots/Ninja_Data/bars/control.jpeg") 
}
ninja_plots2(2:8)


ninja_plots3 <- function(n.obst){

  obst <- obstacles(ObstacleNumbers = n.obst)
  names(obst) <- c('name', 'ntimes')

  obstcount <- c()
  for(i in 1:dim(obst)[1]){
    obstcount <- append(obstcount, rep(obst[i, 1], obst[i, 2]))
  }
  
  bardat <- as.data.frame(obstcount)
  
  stage.count <- data.frame()
  for(i in 1:(length(n.obst))){
    ninja <- filter(NinjaWarrior, name==obst[i,1])
    freqtab <- as.data.frame(table(ninja$stage))
    stages <- rep(freqtab$Var1, freqtab$Freq)
    ob <- filter(bardat, obstcount == obst[i,1])
    stages_ob <- cbind(ob, stages)
    stage.count <- rbind(stage.count, stages_ob)
  }

  # vir
  vir <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "D")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # vir2
  vir2 <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "A")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


  # grey
  grey <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_grey()+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # fil
  fil <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  print(vir)
  ggsave("Plots/Ninja_Data/colours/viridis.jpeg")

  print(vir2)
  ggsave("Plots/Ninja_Data/colours/viridis2.jpeg")

  print(grey)
  ggsave("Plots/Ninja_Data/colours/grey.jpeg")

  print(fil)
  ggsave("Plots/Ninja_Data/colours/default.jpeg")


  plot_grid(vir, fil, 
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/Ninja_Data/colours/col_set_a.jpeg")

  plot_grid(fil, vir, 
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/Ninja_Data/colours/col_set_b.jpeg")

  plot_grid(fil, grey,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/Ninja_Data/colours/col_set_c.jpeg")

  plot_grid(grey, fil,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/Ninja_Data/colours/col_set_d.jpeg")

  plot_grid(vir, grey,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/Ninja_Data/colours/col_set_e.jpeg")
  
  plot_grid(grey, vir,
            labels = c("A", "B"),
            ncol = 1, nrow = 2) 
  ggsave("Plots/Ninja_Data/colours/col_set_f.jpeg")   

}
ninja_plots3(2:5)


ninja_plots4 <- function(n.obst){

  obst <- obstacles(ObstacleNumbers = n.obst)
  names(obst) <- c('name', 'ntimes')

  obstcount <- c()
  for(i in 1:dim(obst)[1]){
    obstcount <- append(obstcount, rep(obst[i, 1], obst[i, 2]))
  }
  
  bardat <- as.data.frame(obstcount)
  
  stage.count <- data.frame()
  for(i in 1:(length(n.obst))){
    ninja <- filter(NinjaWarrior, name==obst[i,1])
    freqtab <- as.data.frame(table(ninja$stage))
    stages <- rep(freqtab$Var1, freqtab$Freq)
    ob <- filter(bardat, obstcount == obst[i,1])
    stages_ob <- cbind(ob, stages)
    stage.count <- rbind(stage.count, stages_ob)
  }

  # vir
  vir <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "D")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # vir2
  vir2 <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "A")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


  # grey
  grey <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_fill_grey()+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # fil
  fil <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  print(vir)
  ggsave("Plots/Ninja_Data/colours/viridis.jpeg")

  print(vir2)
  ggsave("Plots/Ninja_Data/colours/viridis2.jpeg")

  print(grey)
  ggsave("Plots/Ninja_Data/colours/grey.jpeg")

  print(fil)
  ggsave("Plots/Ninja_Data/colours/default.jpeg")  

  plot_grid(vir, vir_dodge,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)   

}
ninja_plots4(2:5)


##### Time-series #####

data <- sort(c(BJsales)) 

sim_data1 <- function(npoints){
  set.seed(40)
  vals <- sample(data, size=npoints, replace=F)
  time <- as.factor(seq(2006, 2006+npoints-1, 1))
  group <- rep(1, length(time))
  sales <- data.frame(time=time, vals=vals, grp=group)
  return(sales)
}

sim_data2 <- function(npoints){
  set.seed(500)
  vals <- sample(data, size=npoints, replace=F)
  time <- as.factor(seq(2006, 2006+npoints-1, 1))
  group <- rep(2, length(time))
  sales <- data.frame(time=time, vals=vals, grp=group)
  return(sales)
}

sales <- rbind(sim_data1(npoints=2), sim_data2(npoints=2))

ggplot(data=sales, aes(x=time, y=vals, group = grp, col=grp))+
   geom_point()+
   geom_line()+
   theme_classic()


