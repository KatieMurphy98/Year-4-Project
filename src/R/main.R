##### Load libraries #####
library(ggplot2)
library(dplyr)
library(DAAG) #datasets
library(viridis) #colourmaps

##### visualising colourmaps #####

ggplot(data.frame(x = rnorm(10000), y = rnorm(10000)), aes(x = x, y = y)) +
geom_hex() + coord_fixed() +
scale_fill_viridis(option='inferno') + theme_bw()

##### Ninja Warrior data #####
#Data from: https://data.world/ninja/anw-obstacle-history

NinjaWarrior <- read.csv("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Data/American Ninja Warrior Obstacle History.csv")

obstacles <- function(ObstacleNumbers){
  obst <- data.frame()
  j=1

  for (i in unique(NinjaWarrior$Obstacle.Name)){
    dat <- NinjaWarrior %>% filter(Obstacle.Name == i)
    obst[j, 1] <- i
    obst[j, 2] <- dim(dat)[1]
    j <- j+1
  }
  
  obst <- arrange(obst, desc(V2))
  obst <- obst[ObstacleNumbers, ]
}

obst <- obstacles(8:15)
names(obst) <- c('Obstacle.Name', 'Times.Used')

# Barplot in default colour map 

ggplot(data=obst) +
geom_col(aes(x=Obstacle.Name, y=Times.Used, fill=Obstacle.Name)) +
scale_x_discrete(labels=NULL) +
xlab('Obstacle') + 
ylab('Times Used') +
labs(fill = 'Obstacle') +
theme_classic()

# Barplot in viridis

ggplot(data=obst)+
geom_col(aes(x=Obstacle.Name, y=Times.Used, fill=Obstacle.Name))+
scale_x_discrete(labels=NULL) +
scale_fill_viridis(discrete = T)+
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

#jitter in default

ggplot(data=obst)+
geom_jitter(aes(x=Obstacle.Name, y=Times.Used, col=Obstacle.Name), size=5)+
scale_x_discrete(labels=NULL) +
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

# jitter in viridis

ggplot(data=obst)+
geom_jitter(aes(x=Obstacle.Name, y=Times.Used, col=Obstacle.Name), size=5)+
scale_x_discrete(labels=NULL) +
scale_color_viridis(discrete = T)+
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()



##### Dog Breed data #####
# From https://data.world/len/dog-canine-breed-size-akc

format_data <- function(entries){
  Dogs <- read.csv("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/Data/AKC Dog Breeds/main.csv")

# Filter out breeds with 'na' and 'not found' values
Dogs <- Dogs %>%
filter(Breed != "Coton de Tulear" & Breed != "Alaskan Malamute")

# Change class of variables from character to numeric
Dogs$weight_low_lbs <- as.numeric(Dogs$weight_low_lbs)

# Take only certain breeds
Dogs <- Dogs[entries, ]
}

Dogs <- format_data(1:5)


# Create standard barplot in default colours
ggplot(data=Dogs) +
geom_col(aes(x=Breed, y=weight_low_lbs), fill="#69b3a2") +
xlab('Breed') + 
ylab('Weight') +
labs(fill = 'Breed') +
theme_classic()

# Create barplot with stretched y-axis
ggplot(data=Dogs) +
geom_col(aes(x=Breed, y=weight_low_lbs), fill="#69b3a2") +
scale_y_continuous(limits = c(0, 175)) +
xlab('Breed') + 
ylab('Weight') +
labs(fill = 'Breed') +
theme_classic()

# Create barplot with logarithmic y-axis
ggplot(data=Dogs)+
geom_col(aes(x=Breed, y=weight_low_lbs), fill="#69b3a2")+
scale_y_log10()+
xlab('Breed') + 
ylab('Weight') +
labs(fill = 'Breed') +
theme_classic()

# Barplot with log scale but bars in descending order
Dogs <- arrange(Dogs, desc(weight_low_lbs))
Dogs_reorder <- Dogs
Dogs_reorder$Breed <- c("A", "B", "C", "D", "E")

ggplot(data=Dogs_reorder)+
geom_col(aes(x=Breed, y=weight_low_lbs), fill="#69b3a2")+
scale_y_log10()+
scale_x_discrete(name="Breed", labels=Dogs$Breed)+
ylab('Weight') +
theme_classic()

##### 