##### Load libraries #####
library(ggplot2)
library(dplyr)
library(DAAG) #datasets
library(viridis) #colourmaps

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

obst <- obstacles(ObstacleNumbers = 8:15)
names(obst) <- c('name', 'ntimes')

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



# Barplot in default colour map 

ggplot(data=obst) +
geom_col(aes(x=name, y=ntimes, fill=name)) +
scale_x_discrete(labels=NULL) +
xlab('Obstacle') + 
ylab('Times Used') +
labs(fill = 'Obstacle') +
theme_classic()

# Barplot in viridis

ggplot(data=obst)+
geom_col(aes(x=name, y=ntimes, fill=name))+
scale_x_discrete(labels=NULL) +
scale_fill_viridis(discrete = T)+
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

#jitter in default

ggplot(data=obst)+
geom_jitter(aes(x=name, y=ntimes, fill=name), size=5)+
scale_x_discrete(labels=NULL) +
xlab('Obstacle') + 
ylab('Times Used')+
labs(fill = 'Obstacle') +
theme_classic()

# jitter in viridis

ggplot(data=obst)+
geom_jitter(aes(x=name, y=ntimes, fill=name), size=5)+
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

##### Movie ratings #####

movie <- read.csv("https://query.data.world/s/mj72g7pmvyyt6dlm7eck7yp4drqf6e", header=TRUE, stringsAsFactors=FALSE)

mario <- read.csv("https://query.data.world/s/kzmm4brdm34vwjspewouvdmzdgry4e", header=TRUE, stringsAsFactors=FALSE)
