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

##### visualising colourmaps #####

ggplot(data.frame(x = rnorm(10000), y = rnorm(10000)), aes(x = x, y = y)) +
geom_hex() + coord_fixed() +
scale_fill_viridis(option='inferno') + theme_bw()

##### Ninja Warrior data #####
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
  
  #print(obst)
  obst <- arrange(obst, desc(V2))
  obst <- obst[ObstacleNumbers, ]
}


obstnames <- obstacles(5:10)[,1]
rounds <- unique(NinjaWarrior$'stage')

num <- matrix(0, 5, 8)
for(i in 1:5){
  for(j in 1:8){
    a <- dim(NinjaWarrior %>% filter(name == obstnames[i] & stage == rounds[j]))[1]
    num[i, j] <- a
  }
}
num


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
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # log scale
  lg <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
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
  labs(fill = 'Obstacle') +
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
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # narrow bars
  narrow <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity", width=0.6) +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip","Jump Hang","Quad Steps","Jumping Spider")) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(aspect.ratio = 2/1)

  # wide bars
  wide <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity", width=1) +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip","Jump Hang","Quad Steps","Jumping Spider")) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # dots
  dot <- ggplot(data=obst) +
  geom_point(aes(x=name, y=ntimes), col="#69b3a2") +
  scale_x_discrete(labels=c("Salmon Ladder",   "Quintuple Steps",    "Floating Steps ",   "Log Grip","Jump Hang","Quad Steps","Jumping Spider")) +
  scale_y_continuous(limits = c(0, 41), breaks=seq(0, 40, 10), labels=seq(0, 40, 10)) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  plot_grid(narrow, dflt, wide, dot,
            labels = c("A", "B", "C", "D"),
            ncol = 2, nrow = 2)

          
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
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # vir2
  vir2 <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "A")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


  # grey
  grey <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_grey()+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # fil
  fil <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  a <- plot_grid(vir, fil, grey, vir2,
            labels = c("A", "B", "C", "D"),
            ncol = 2, nrow = 2)

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
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # vir2
  vir2 <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "A")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


  # grey
  grey <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_fill_grey()+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  # fil
  fil <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Obstacle') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

  plot_grid(vir, fil, grey, vir2,
            labels = c("A", "B", "C", "D"),
            ncol = 2, nrow = 2)

 

}
ninja_plots4(2:5)

##### Dog Breed data #####
# From https://data.world/len/dog-canine-breed-size-akc

format_dogs <- function(){
  dogs <- read.csv("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/Data/AKC Dog Breeds/main.csv")

  # Filter out breeds with 'na' and 'not found' values, and with incorrect unit.
  dogs <- dogs %>%
  filter(Breed != "Coton de Tulear" & Breed != "Alaskan Malamute" & Breed != "Vizsla")


  
  # Change class of variables from character to numeric
  dogs$weight_low_lbs <- as.numeric(dogs$weight_low_lbs)
  dogs$weight_high_lbs <- as.numeric(dogs$weight_high_lbs)
  dogs$height_low_inches <- as.numeric(dogs$height_low_inches)
  dogs$height_high_inches <- as.numeric(dogs$height_high_inches)

  dogs$height_av <- (dogs$height_low_inches + dogs$height_high_inches)/2
  dogs$weight_av <- (dogs$weight_low_lbs + dogs$weight_high_lbs)/2

  dogs <- as.data.frame(dogs)
}
dogs <- format_dogs()

plots <- function(){
   d1 <- ggplot(data = dogs, aes(x=weight_av, y=height_av, label = Breed))+
   geom_point(col="#69b3a2")+
   xlab("Average Weight (lbs)")+
   ylab("Average Height (in)")+
   theme_classic()

   xlog <- ggplot(data = dogs, aes(x=weight_av, y=height_av, label = Breed))+
      geom_point(col="#69b3a2")+
      scale_x_log10()+
      xlab("Average Weight (lbs)")+
      ylab("Average Height (in)")+
      theme_classic()   
   
   ylog <- ggplot(data = dogs, aes(x=weight_av, y=height_av, label = Breed))+
      geom_point(col="#69b3a2")+
      scale_y_log10()+
      xlab("Average Weight (lbs)")+
      ylab("Average Height (in)")+
      theme_classic()   
   
   loglog <- ggplot(data = dogs, aes(x=weight_av, y=height_av, label = Breed))+
      geom_point(col="#69b3a2")+
      scale_y_log10()+
      scale_x_log10()+
      xlab("Average Weight (lbs)")+
      ylab("Average Height (in)")+
      theme_classic()   

  trunc <- ggplot(data = dogs, aes(x=weight_av, y=height_av, label = Breed))+
      geom_point(col="#69b3a2")+
      scale_y_log10()+
      scale_x_log10()+
      xlab("Average Weight (lbs)")+
      ylab("Average Height (in)")+
      theme_classic()   
   
   plot_grid(d1, xlog, ylog, loglog,  
               labels = c("A", "B", "C", "D"),
               ncol = 2, nrow = 2)
   
}
plots()


##### chickweight #####
 data(ChickWeight)
 chick <- ChickWeight
 chick <- chick[c(6:12, 226:232, 346:352, 466:472 ), ]

def <- ggplot(data = chick, aes(x=Time, y=weight, col=Diet)) +
   geom_point()+
   geom_line()+
   scale_y_continuous(limits=c(0, 340))+
   theme_classic()

trunc <- ggplot(data = chick, aes(x=Time, y=weight, col=Diet)) +
   geom_point()+
   geom_line()+
   scale_y_log10()+
   theme_classic()

  plot_grid(def, trunc,  
               labels = c("A", "B"),
               ncol = 2, nrow = 1)







############

