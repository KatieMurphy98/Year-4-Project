##### Load libraries #####
library(ggplot2)
library(dplyr)
library(DAAG) #datasets
library(viridis) #colourmaps

##### visualising colourmaps #####

ggplot(data.frame(x = rnorm(10000), y = rnorm(10000)), aes(x = x, y = y)) +
geom_hex() + coord_fixed() +
scale_fill_viridis(option='inferno') + theme_bw()

##### Read in and format data #####

NinjaWarrior <- read.csv("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Data/American Ninja Warrior Obstacle History.csv")
obst <- data.frame()

j=1

for (i in unique(NinjaWarrior$Obstacle.Name)){
  dat <- NinjaWarrior %>% filter(Obstacle.Name == i)
  obst[j, 1] <- i
  obst[j, 2] <- dim(dat)[1]
  j <- j+1
}

obst <- arrange(obst, desc(V2))
obst <- obst[2:6,]
names(obst) <- c('Obstacle.Name', 'Times.Used')

##### Barplot in default colour map #####

ggplot(data=obst)+
geom_col(aes(x=Obstacle.Name, y=Times.Used, fill=Obstacle.Name))+
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

##### Barplot in viridis #####

ggplot(data=obst)+
geom_col(aes(x=Obstacle.Name, y=Times.Used, fill=Obstacle.Name))+
scale_fill_viridis(discrete = T)+
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

##### jitter in default #####

ggplot(data=obst)+
geom_jitter(aes(x=Obstacle.Name, y=Times.Used, col=Obstacle.Name), size=5)+
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

##### jitter in viridis #####

ggplot(data=obst)+
geom_jitter(aes(x=Obstacle.Name, y=Times.Used, col=Obstacle.Name), size=5)+
scale_color_viridis(discrete = T)+
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

