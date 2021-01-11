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
 library('Cairo')
 library(knitr)
###

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
     names(obst) <- c('name', 'ntimes')
     return(obst)
  }


  stack_data <- function(ObstacleNumbers){
   obst <- obstacles(ObstacleNumbers)

    ##List obstacles the number of times they are used##
    obstcount <- c()
    for(i in 1:dim(obst)[1]){
      obstcount <- append(obstcount, rep(obst[i, 1], obst[i, 2]))
    }
     
    bardat <- as.data.frame(obstcount) #Change to dataframe

    stage.count <- data.frame()
    for(i in 1:(length(ObstacleNumbers))){
      filter_ninja <- filter(NinjaWarrior, name==obst[i,1]) #Filters data for relevant obstacles
      
      freq_stages <- as.data.frame(table(filter_ninja$stage)) #Count how many times obstacle i is used in each stage
      print(freq_stages)

      stages <- rep(freq_stages$Var1, freq_stages$Freq) #Lists each stage the number of times it occurs
      
      obs <- filter(bardat, obstcount == obst[i,1]) #Filter for obstacle i

      stages_obs <- cbind(obs, stages)

      stage.count <- rbind(stage.count, stages_obs) #Iterate to get whole set of data
    }
    return(stage.count)
}

  
  
#####
letters <- c("A", "B", "C", "D", "E", "F", "G")
obst_list <- c("Salmon Ladder","Quintuple Steps","Floating Steps","Log Grip","Jump Hang","Quad Steps","Jumping Spider")


barplots_yscaling <- function(n.obst){

  obst <- obstacles(n.obst)
  obst$name <- letters[1:length(n.obst)]
  
  # default scale
  dflt <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  # log scale
  lg <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_y_log10()+
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

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
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_y_continuous(limits = c(0, 21), breaks = c(0, 10, 20), labels = c(20, 30, 40))+
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  all <- plot_grid(lg, dflt, trnc, 
         labels = c("A", "B", "C"),
         ncol = 2, nrow = 2)

  ggsave("Plots/R/Ninja_Data/y-scaling/all.jpeg")

  print(dflt)
  ggsave("Plots/R/Ninja_Data/y-scaling/control.jpeg") 

  print(lg)
  ggsave("Plots/R/Ninja_Data/y-scaling/log10.jpeg") 

  print(trnc)
  ggsave("Plots/R/Ninja_Data/y-scaling/truncated.jpeg") 

  

}
barplots_yscaling(2:5)


barplots_barwidth <- function(n.obst){

  obst <- obstacles(n.obst)
  obst$name <- letters[1:length(n.obst)]

  # default
  dflt <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  # narrow bars
  narrow <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14)) +
  theme(aspect.ratio = 2/1)

  # wide bars
  wide <- ggplot(data=obst) +
  geom_bar(aes(x=name, y=ntimes), fill="#69b3a2", stat="identity") +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_y_continuous() +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))+
  theme(aspect.ratio = 0.5/1)


  # dots
  dot <- ggplot(data=obst) +
  geom_point(aes(x=name, y=ntimes), col="#69b3a2") +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_y_continuous(limits = c(0, 41), breaks=seq(0, 40, 10), labels=seq(0, 40, 10)) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  top <- plot_grid(narrow, dflt,
            labels = c("A", "B"),
            ncol = 2, nrow = 1)

  all <- plot_grid(top, wide,
            labels = c(" ", "C"),
            ncol = 1, nrow = 2
            )

  ggsave("Plots/R/Ninja_Data/bars/all.jpeg")

  print(wide)
  ggsave("Plots/R/Ninja_Data/bars/wide.jpeg") 

  print(narrow)
  ggsave("Plots/R/Ninja_Data/bars/narrow.jpeg") 

  print(dflt)
  ggsave("Plots/R/Ninja_Data/bars/control.jpeg") 
}
barplots_barwidth(2:5)

barplots_stackedcols <- function(n.obst){

  stage.count <- stack_data(n.obst)

  # vir
  vir <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "D")+
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  # vir2
  vir2 <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_viridis(discrete = TRUE, option = "A")+
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))


  # grey
  grey <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_fill_grey()+
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  # fil
  fil <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages)) +
  scale_y_continuous() +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  print(vir)
  ggsave("Plots/R/Ninja_Data/colours/viridis.jpeg")

  print(grey)
  ggsave("Plots/R/Ninja_Data/colours/grey.jpeg")

  print(fil)
  ggsave("Plots/R/Ninja_Data/colours/default.jpeg")


  plot_grid(vir, fil, 
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/R/Ninja_Data/colours/col_set_a.jpeg")

  plot_grid(fil, vir, 
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/R/Ninja_Data/colours/col_set_b.jpeg")

  plot_grid(fil, grey,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/R/Ninja_Data/colours/col_set_c.jpeg")

  plot_grid(grey, fil,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/R/Ninja_Data/colours/col_set_d.jpeg")

  plot_grid(vir, grey,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)
  ggsave("Plots/R/Ninja_Data/colours/col_set_e.jpeg")
  
  plot_grid(grey, vir,
            labels = c("A", "B"),
            ncol = 1, nrow = 2) 
  ggsave("Plots/R/Ninja_Data/colours/col_set_f.jpeg")   

}
barplots_stackedcols(2:5)


barplots_stackedcols_dodge <- function(n.obst){

  obst <- obstacles(n.obst)
  names(obst) <- c('name', 'ntimes')
  obst$name <- letters[1:length(n.obst)]

  stage.count <- stages(n.obst)

  # vir
  vir <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_fill_viridis(discrete = TRUE, option = "D")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  # vir2
  vir2 <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_fill_viridis(discrete = TRUE, option = "A")+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))


  # grey
  grey <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  scale_fill_grey()+
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  # fil
  fil <- ggplot(data=stage.count) +
  geom_bar(aes(x=obstcount, fill=stages), position="dodge") +
  scale_y_continuous() +
  scale_x_discrete(labels=obst_list[1:length(n.obst)]) +
  xlab('Obstacle') + 
  ylab('Times Used') +
  labs(fill = 'Stage') +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))

  print(vir)
  ggsave("Plots/R/Ninja_Data/colours/viridis_d.jpeg")

  print(grey)
  ggsave("Plots/R/Ninja_Data/colours/grey_d.jpeg")

  print(fil)
  ggsave("Plots/R/Ninja_Data/colours/default_d.jpeg")  

  plot_grid(vir, vir_dodge,
            labels = c("A", "B"),
            ncol = 1, nrow = 2)   

}
barplots_stackedcols_dodge(2:5)


##### Time-series #####


sales_line_plots <- function(npoints){
   dat <- c(BJsales)
   
   months_list <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
   months <- as.factor(1:npoints)

   set.seed(seeds[1])
   start <- sample(138, 1)
   vals <- dat[start:(start+npoints-1)]
   group <- rep("Company A", length(months))
   salesA <- data.frame(Month=months, Sales=vals, Company=group)

   set.seed(seeds[2])
   start <- sample(138, 1)
   vals <- dat[start:(start+npoints-1)]
   group <- rep("Company B", length(months))
   salesB <- data.frame(Month=months, Sales=vals, Company=group)

   set.seed(seeds[3])
   start <- sample(138, 1)
   vals <- dat[start:(start+npoints-1)]
   group <- rep("Company C", length(months))
   salesC <- data.frame(Month=months, Sales=vals, Company=group)

   set.seed(seeds[4])
   start <- sample(138, 1)
   vals <- dat[start:(start+npoints-1)]
   group <- rep("Company D", length(months))
   salesD <- data.frame(Month=months, Sales=vals, Company=group)

   sales <- rbind(salesA, salesB)
   sales2 <- rbind(salesC, salesD)
   #print(sales)

   # CONTROLS #
   dflt_oneline_1 <- ggplot(data=salesA, aes(x=Month, y=Sales, group = Company, col = Company))+
                        geom_line(size=1)+
                        scale_color_manual(values = c("#453781FF"))+
                        theme_classic()+ 
                        scale_x_discrete(labels = months_list[1:npoints])+
                        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/one_line_control_1.jpeg")
   
   dflt_oneline_2 <- ggplot(data=salesB, aes(x=Month, y=Sales, group = Company, col = Company))+
                        geom_line(size=1)+
                        scale_color_manual(values = c("#55C667FF"))+
                        theme_classic()+ 
                        scale_x_discrete(labels = months_list[1:npoints])+
                        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/one_line_control_2.jpeg")
   

   dflt_twolines <- ggplot(data=sales, aes(x=Month, y=Sales, group = Company, col = Company))+
           geom_line(size=1)+
           scale_color_manual(values = c("#453781FF", "#55C667FF"))+
           theme_classic()+ 
           scale_x_discrete(labels = months_list[1:npoints])+
           theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/two_lines_control.jpeg")


   # SECOND CONTROLS #
   dflt_oneline_inferno <- ggplot(data=salesC, aes(x=Month, y=Sales, group = Company, col = Company))+
                        geom_line(size=1)+
                        scale_color_manual(values = c("#a72497"))+
                        theme_classic()+ 
                        scale_x_discrete(labels = months_list[1:npoints])+
                        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/one_line_inferno1.jpeg")
   
   dflt_oneline_inferno <- ggplot(data=salesD, aes(x=Month, y=Sales, group = Company, col = Company))+
                        geom_line(size=1)+
                        scale_color_manual(values = c("#f07f4f"))+
                        theme_classic()+ 
                        scale_x_discrete(labels = months_list[1:npoints])+
                        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/one_line_inferno2.jpeg")
   
  twoline_inferno <- ggplot(data=sales2, aes(x=Month, y=Sales, group = Company, col = Company))+
           geom_line(size=1)+
           scale_color_manual(values = c("#a72497", "#f07f4f"))+
           theme_classic()+ 
           scale_x_discrete(labels = months_list[1:npoints])+
           theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/twoline_inferno.jpeg")

   zeroed_twoline_inferno <- ggplot(data=sales2, aes(x=Month, y=Sales, group = Company, col = Company))+
           geom_line(size=1)+
           scale_color_manual(values = c("#a72497", "#f07f4f"))+
           theme_classic()+ 
           scale_x_discrete(labels = months_list[1:npoints])+
           scale_y_continuous(limits=c(0, max(sales2$Sales)))+
           theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/zeroed_twoline_inferno.jpeg")
   
   # ZEROED #
   zeroed_oneline_1 <- ggplot(data=salesA, aes(x=Month, y=Sales, group = Company, col = Company))+
           geom_line(size=1)+
           scale_color_manual(values = c("#453781FF"))+
           theme_classic()+ 
           scale_x_discrete(labels = months_list[1:npoints])+
           scale_y_continuous(limits=c(0, max(sales[1:npoints,]$Sales)))+
           theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/zeroed_oneline_1.jpeg")
   
   zeroed_oneline_2 <- ggplot(data=salesB, aes(x=Month, y=Sales, group = Company, col = Company))+
           geom_line(size=1)+
           scale_color_manual(values = c("#55C667FF"))+
           theme_classic()+ 
           scale_x_discrete(labels = months_list[1:npoints])+
           scale_y_continuous(limits=c(0, max(sales[npoints+1:2*npoints,]$Sales)))+
           theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/zeroed_oneline_2.jpeg")
   
   zeroed_twolines <- ggplot(data=sales, aes(x=Month, y=Sales, group = Company, col = Company))+
           geom_line(size=1)+
           scale_color_manual(values = c("#453781FF", "#55C667FF"))+
           theme_classic()+ 
           scale_x_discrete(labels = months_list[1:npoints])+
           scale_y_continuous(limits=c(0, max(sales$Sales)))+
           theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))
   ggsave("Plots/R/Sales/zeroed_twolines.jpeg")


   # ASPECT RATIO #

   large <- ggplot(data=salesA, aes(x=Month, y=Sales, group = Company, col = Company))+
                        geom_line(size=1)+
                        scale_color_manual(values = c("#453781FF"))+
                        theme_classic()+ 
                        scale_x_discrete(labels = months_list[1:npoints])+
                        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))+
                        theme(aspect.ratio = 2/1)
   ggsave("Plots/R/Sales/large.jpeg")
   
   small <- ggplot(data=salesA, aes(x=Month, y=Sales, group = Company, col = Company))+
                        geom_line(size=1)+
                        scale_color_manual(values = c("#453781FF"))+
                        theme_classic()+ 
                        scale_x_discrete(labels = months_list[1:npoints])+
                        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), text = element_text(size = 14))+
                        theme(aspect.ratio = 0.3/1)
   ggsave("Plots/R/Sales/small.jpeg")

}

seeds <- sample(1000, 4)
#seeds <- c(62, 905, 511, 579)
sales_line_plots(npoints=12)
seeds


# 62, 905, 511, 579 - Set 1
# 958, 36, 224, 483 - Set 2
# 511 579


# Consider - percentages, cumulative etc
