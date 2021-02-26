rm(list=ls())
library(readxl)

for(i in 1:6){
    r <- assign(paste0("r",i), (as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", paste0("R - v",i)))))
    py <- assign(paste0("py",i), (as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", paste0("Py - v",i)))))
    assign(paste0("ver",i), rbind(r, py))
}

ver1 <- ver1[-1,]
r1 <- r1[-1,]
py1 <- py1[-1,]

names(ver1) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "con_1", "con_2", "con_3", "con_4", 
                 "log_1", "log_2", "log_3", "log_4",
                 "trn_1", "trn_2", "trn_3", "trn_4",
  
                 "def_1", "def_2", "def_3", 
                 "nar_1", "nar_2", "nar_3", 
                 "wid_1", "wid_2", "wid_3",
                 "all_1", "all_2", "all_3",
  
                 "vir_sta_1", "vir_sta_2", "vir_sta_3", "vir_sta_4", 
                 "vir_dge_1", "vir_dge_2", "vir_dge_3", "vir_dge_4",
                 "sta_dge",
                 "a_cols_1", "a_cols_2", 
  
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
  
                 "cd_trn",
                 "cd_zro"
                 )

names(r1) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "con_1", "con_2", "con_3", "con_4", 
                 "log_1", "log_2", "log_3", "log_4",
                 "trn_1", "trn_2", "trn_3", "trn_4",
  
                 "def_1", "def_2", "def_3", 
                 "nar_1", "nar_2", "nar_3", 
                 "wid_1", "wid_2", "wid_3",
                 "all_1", "all_2", "all_3",
  
                 "vir_sta_1", "vir_sta_2", "vir_sta_3", "vir_sta_4", 
                 "vir_dge_1", "vir_dge_2", "vir_dge_3", "vir_dge_4",
                 "sta_dge",
                 "a_cols_1", "a_cols_2", 
  
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
  
                 "cd_trn",
                 "cd_zro"
                 )

names(py1) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "con_1", "con_2", "con_3", "con_4", 
                 "log_1", "log_2", "log_3", "log_4",
                 "trn_1", "trn_2", "trn_3", "trn_4",
  
                 "def_1", "def_2", "def_3", 
                 "nar_1", "nar_2", "nar_3", 
                 "wid_1", "wid_2", "wid_3",
                 "all_1", "all_2", "all_3",
  
                 "vir_sta_1", "vir_sta_2", "vir_sta_3", "vir_sta_4", 
                 "vir_dge_1", "vir_dge_2", "vir_dge_3", "vir_dge_4",
                 "sta_dge",
                 "a_cols_1", "a_cols_2", 
  
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
  
                 "cd_trn",
                 "cd_zro"
                 )
###

names(ver2) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "con_1", "con_2", "con_3", "con_4", 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "log_1", "log_2", "log_3", "log_4",
                 
                 "def_1", "def_2", "def_3", 
                 "wid_1", "wid_2", "wid_3",
                 "nar_1", "nar_2", "nar_3", 
                 "all_1", "all_2", "all_3",
                 
                 "def_sta_1", "def_sta_2", "def_sta_3", "def_sta_4", 
                 "def_dge_1", "def_dge_2", "def_dge_3", "def_dge_4",
                 "sta_dge",
                 "b_cols_1", "b_cols_2", 
  
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
  
                 "cd_trn",
                 "cd_zro"
                 )

names(r2) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "con_1", "con_2", "con_3", "con_4", 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "log_1", "log_2", "log_3", "log_4",
                 
                 "def_1", "def_2", "def_3", 
                 "wid_1", "wid_2", "wid_3",
                 "nar_1", "nar_2", "nar_3", 
                 "all_1", "all_2", "all_3",
                 
                 "def_sta_1", "def_sta_2", "def_sta_3", "def_sta_4", 
                 "def_dge_1", "def_dge_2", "def_dge_3", "def_dge_4",
                 "sta_dge",
                 "b_cols_1", "b_cols_2", 
  
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
  
                 "cd_trn",
                 "cd_zro"
                 )

names(py2) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "con_1", "con_2", "con_3", "con_4", 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "log_1", "log_2", "log_3", "log_4",
                 
                 "def_1", "def_2", "def_3", 
                 "wid_1", "wid_2", "wid_3",
                 "nar_1", "nar_2", "nar_3", 
                 "all_1", "all_2", "all_3",
                 
                 "def_sta_1", "def_sta_2", "def_sta_3", "def_sta_4", 
                 "def_dge_1", "def_dge_2", "def_dge_3", "def_dge_4",
                 "sta_dge",
                 "b_cols_1", "b_cols_2", 
  
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
  
                 "cd_trn",
                 "cd_zro"
                 )
###

names(ver3) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "log_1", "log_2", "log_3", "log_4",
                 "con_1", "con_2", "con_3", "con_4", 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 
                 "nar_1", "nar_2", "nar_3", 
                 "def_1", "def_2", "def_3", 
                 "wid_1", "wid_2", "wid_3",  
                 "all_1", "all_2", "all_3",
                 
                 "def_dge_1", "def_dge_2", "def_dge_3", "def_dge_4",
                 "def_sta_1", "def_sta_2", "def_sta_3", "def_sta_4", 
                 "sta_dge",
                 "c_cols_1", "c_cols_2", 
  
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",                
  
                 "cd_zro",
                 "cd_trn"
                 )

names(r3) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "log_1", "log_2", "log_3", "log_4",
                 "con_1", "con_2", "con_3", "con_4", 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 
                 "nar_1", "nar_2", "nar_3", 
                 "def_1", "def_2", "def_3", 
                 "wid_1", "wid_2", "wid_3",  
                 "all_1", "all_2", "all_3",
                 
                 "def_dge_1", "def_dge_2", "def_dge_3", "def_dge_4",
                 "def_sta_1", "def_sta_2", "def_sta_3", "def_sta_4", 
                 "sta_dge",
                 "c_cols_1", "c_cols_2", 
  
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",                
  
                 "cd_zro",
                 "cd_trn"
                 )

names(py3) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "log_1", "log_2", "log_3", "log_4",
                 "con_1", "con_2", "con_3", "con_4", 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 
                 "nar_1", "nar_2", "nar_3", 
                 "def_1", "def_2", "def_3", 
                 "wid_1", "wid_2", "wid_3",  
                 "all_1", "all_2", "all_3",
                 
                 "def_dge_1", "def_dge_2", "def_dge_3", "def_dge_4",
                 "def_sta_1", "def_sta_2", "def_sta_3", "def_sta_4", 
                 "sta_dge",
                 "c_cols_1", "c_cols_2", 
  
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",                
  
                 "cd_zro",
                 "cd_trn"
                 )
###

names(ver4) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "log_1", "log_2", "log_3", "log_4",
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "con_1", "con_2", "con_3", "con_4", 
  
                 "nar_1", "nar_2", "nar_3", 
                 "wid_1", "wid_2", "wid_3",
                 "def_1", "def_2", "def_3", 
                 "all_1", "all_2", "all_3",
  
                 "gr_sta_1", "gr_sta_2", "gr_sta_3", "gr_sta_4",
                 "gr_dge_1", "gr_dge_2", "gr_dge_3", "gr_dge_4",  
                 "sta_dge",
                 "d_cols_1", "d_cols_2", 
  
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "sep_1a", "sep_1b", "sep_2",

                 "cd_trn",
                 "cd_zro"
                 )

names(r4) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "log_1", "log_2", "log_3", "log_4",
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "con_1", "con_2", "con_3", "con_4", 
  
                 "nar_1", "nar_2", "nar_3", 
                 "wid_1", "wid_2", "wid_3",
                 "def_1", "def_2", "def_3", 
                 "all_1", "all_2", "all_3",
  
                 "gr_sta_1", "gr_sta_2", "gr_sta_3", "gr_sta_4",
                 "gr_dge_1", "gr_dge_2", "gr_dge_3", "gr_dge_4",  
                 "sta_dge",
                 "d_cols_1", "d_cols_2", 
  
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "sep_1a", "sep_1b", "sep_2",

                 "cd_trn",
                 "cd_zro"
                 )

names(py4) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "log_1", "log_2", "log_3", "log_4",
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "con_1", "con_2", "con_3", "con_4", 
  
                 "nar_1", "nar_2", "nar_3", 
                 "wid_1", "wid_2", "wid_3",
                 "def_1", "def_2", "def_3", 
                 "all_1", "all_2", "all_3",
  
                 "gr_sta_1", "gr_sta_2", "gr_sta_3", "gr_sta_4",
                 "gr_dge_1", "gr_dge_2", "gr_dge_3", "gr_dge_4",  
                 "sta_dge",
                 "d_cols_1", "d_cols_2", 
  
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "sep_1a", "sep_1b", "sep_2",

                 "cd_trn",
                 "cd_zro"
                 )
###

names(ver5) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "con_1", "con_2", "con_3", "con_4",
                 "log_1", "log_2", "log_3", "log_4", 
                 
                 "wid_1", "wid_2", "wid_3",
                 "def_1", "def_2", "def_3", 
                 "nar_1", "nar_2", "nar_3", 
                 "all_1", "all_2", "all_3",
  
                 "vir_dge_1", "vir_dge_2", "vir_dge_3", "vir_dge_4",
                 "vir_sta_1", "vir_sta_2", "vir_sta_3", "vir_sta_4", 
                 "sta_dge",
                 "vir_cols_1", "vir_cols_2", 
  
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 
                 "cd_zro",
                 "cd_trn"
                 )

names(r5) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "con_1", "con_2", "con_3", "con_4",
                 "log_1", "log_2", "log_3", "log_4", 
                 
                 "wid_1", "wid_2", "wid_3",
                 "def_1", "def_2", "def_3", 
                 "nar_1", "nar_2", "nar_3", 
                 "all_1", "all_2", "all_3",
  
                 "vir_dge_1", "vir_dge_2", "vir_dge_3", "vir_dge_4",
                 "vir_sta_1", "vir_sta_2", "vir_sta_3", "vir_sta_4", 
                 "sta_dge",
                 "vir_cols_1", "vir_cols_2", 
  
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 
                 "cd_zro",
                 "cd_trn"
                 )

names(py5) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "con_1", "con_2", "con_3", "con_4",
                 "log_1", "log_2", "log_3", "log_4", 
                 
                 "wid_1", "wid_2", "wid_3",
                 "def_1", "def_2", "def_3", 
                 "nar_1", "nar_2", "nar_3", 
                 "all_1", "all_2", "all_3",
  
                 "vir_dge_1", "vir_dge_2", "vir_dge_3", "vir_dge_4",
                 "vir_sta_1", "vir_sta_2", "vir_sta_3", "vir_sta_4", 
                 "sta_dge",
                 "vir_cols_1", "vir_cols_2", 
  
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "sep_1a", "sep_1b", "sep_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 
                 "cd_zro",
                 "cd_trn"
                 )
###

names(ver6) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "log_1", "log_2", "log_3", "log_4", 
                 "con_1", "con_2", "con_3", "con_4",
                 
                 "wid_1", "wid_2", "wid_3",
                 "nar_1", "nar_2", "nar_3", 
                 "def_1", "def_2", "def_3", 
                 "all_1", "all_2", "all_3",
  
                 "gr_dge_1", "gr_dge_2", "gr_dge_3", "gr_dge_4",
                 "gr_sta_1", "gr_sta_2", "gr_sta_3", "gr_sta_4", 
                 "sta_dge",
                 "f_cols_1", "f_cols_2", 
  
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "sep_1a", "sep_1b", "sep_2",
                 
                 "cd_zro",
                 "cd_trn"
                 )
                 
names(r6) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "log_1", "log_2", "log_3", "log_4", 
                 "con_1", "con_2", "con_3", "con_4",
                 
                 "wid_1", "wid_2", "wid_3",
                 "nar_1", "nar_2", "nar_3", 
                 "def_1", "def_2", "def_3", 
                 "all_1", "all_2", "all_3",
  
                 "gr_dge_1", "gr_dge_2", "gr_dge_3", "gr_dge_4",
                 "gr_sta_1", "gr_sta_2", "gr_sta_3", "gr_sta_4", 
                 "sta_dge",
                 "f_cols_1", "f_cols_2", 
  
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "sep_1a", "sep_1b", "sep_2",
                 
                 "cd_zro",
                 "cd_trn"
                 )

names(py6) <- c("timestamp", "consent", "age", "uni", "sp_aware", "obs_skl", "num_skl", "cblind", "vis_pro",
                 
                 "trn_1", "trn_2", "trn_3", "trn_4",
                 "log_1", "log_2", "log_3", "log_4", 
                 "con_1", "con_2", "con_3", "con_4",
                 
                 "wid_1", "wid_2", "wid_3",
                 "nar_1", "nar_2", "nar_3", 
                 "def_1", "def_2", "def_3", 
                 "all_1", "all_2", "all_3",
  
                 "gr_dge_1", "gr_dge_2", "gr_dge_3", "gr_dge_4",
                 "gr_sta_1", "gr_sta_2", "gr_sta_3", "gr_sta_4", 
                 "sta_dge",
                 "f_cols_1", "f_cols_2", 
  
                 "ab_zro_1", "ab_zro_1b", "ab_zro_2",
                 "ab_trn_1a", "ab_trn_1b", "ab_trn_2", 
                 "sep_1a", "sep_1b", "sep_2",
                 
                 "cd_zro",
                 "cd_trn"
                 )
###


##### Y SCALES #####
ctrl_y_scale <- rbind(ver1[,10:13], ver2[,10:13], ver3[,14:17], ver4[,18:21], ver5[,14:17], ver6[,18:21])
log_y_scale <- rbind(ver1[,14:17], ver2[,18:21], ver3[,10:13], ver4[,10:13], ver5[,18:21], ver6[,14:17])
trnc_y_scale <- rbind(ver1[,18:21], ver2[,14:17], ver3[,18:21], ver4[,14:17], ver5[,10:13], ver6[,10:13])

### Y Scales Q1 ###
#Approximately many times would you say the 'Salmon Ladder' was used?

#control
con_1 <- ctrl_y_scale[,1]
which(con_1 == '41/42') # entry 26 

con_1[26] <- 41.5 # take midpoint of two values
#OR
con_1 <- con_1[-26] # remove value

con_1 <- as.numeric(con_1)
summary(con_1)
range(con_1)[2]-range(con_1)[1]

#truncated
trn_1 <- trnc_y_scale[,1]
summary(trn_1)

range(trn_1)[2]-range(trn_1)[1]

#log

log_y_scale_r <- rbind(r1[,14:17], r2[,18:21], r3[,10:13], r4[,10:13], r5[,18:21], r6[,14:17])
log_y_scale_py <- rbind(py1[,14:17], py2[,18:21], py3[,10:13], py4[,10:13], py5[,18:21], py6[,14:17])

log_1_r <- log_y_scale_r[,1]
log_1_py <- log_y_scale_py[,1]
log_1_py <- log_1_py[-c(9, 11, 29)]
log_1_py[14] <- 1e+15
log_1_py[21] <- 1e+9
log_1_py <- as.numeric(log_1_py)
log_1 <- c(log_1_r, log_1_py)

summary(log_1_r)
summary(log_1_py)
summary(log_1)


### Y Scales Q2 ###
# Approximately how much more than 'Log Grip' would you say 'Salmon Ladder' was

con_2 <- ctrl_y_scale[,2]
summary(con_2)

trnc_2 <- trnc_y_scale[,2]
summary(trnc_2)

log_2 <- log_y_scale[,2]
summary(log_2)

### Y Scales Q3 ###
# Approximately how much more than 'Quintuple Steps' would you say 'Salmon Ladder' was used?
con_3 <- ctrl_y_scale[,3]
summary(con_3)

log_3 <- log_y_scale[,3]
summary(log_3)

trnc_3 <- trnc_y_scale[,3]
summary(trnc_3)

### Y Scales Q4 ###
# "In your opinion, approximately how many times would you say 'Log Grip' was used, as a percentage of the number of times 'Salmon Ladder' was used?

con_4 <- ctrl_y_scale[,4]
con_4 <- con_4[-which(is.na(ctrl_y_scale[,4]))] # remove NA values

con_4[17] <- 12.5 # change value "12.5 %" to numeric value
con_4 <- as.numeric(con_4)

for(i in 1:length(con_4)){
    if(con_4[i] < 1){
       con_4[i] <- con_4[i]*100
    }
}

summary(con_4)

trnc_4 <- trnc_y_scale[,4]
trnc_4 <- trnc_4[-which(is.na(trnc_y_scale[,4]))] # remove NA values

for(i in 1:length(trnc_4)){
    if(trnc_4[i] < 1){
       trnc_4[i] <- trnc_4[i]*100
    }
}

summary(trnc_4)


log_4 <- log_y_scale[,4]
log_4 <- log_4[-which(is.na(log_y_scale[,4]))] # remove NA values
log_4[17] <- 3
log_4 <- as.numeric(log_4)

for(i in 1:length(log_4)){
    if(log_4[i] < 1){
       log_4[i] <- log_4[i]*100
    }
}

summary(log_4)


### AXIS RATIO ###
ctrl_ratio <- rbind(ver1[,22:24], ver2[,22:24], ver3[,25:27], ver4[,28:30], ver5[,25:27], ver6[,28:30])
wide_ratio <- rbind(ver1[,25:27], ver2[,28:30], ver3[,22:24], ver4[,22:24], ver5[,28:30], ver6[,25:27])
narrow_ratio <- rbind(ver1[,28:30], ver2[,25:27], ver3[,28:30], ver4[,25:27], ver5[,22:24], ver6[,22:24])

# Axis ratio Q1 #
#How large would you say the difference between 'Jumping spider' and 'Salmon Ladder' is?
def_1 <- ctrl_ratio[,1]
summary(def_1)

wid_1 <- wide_ratio[,1]
summary(wid_1)

nar_1 <- narrow_ratio[,1]
summary(nar_1)

# Axis ratio Q2 #
#How large would you say the difference between 'Log Grip' and 'Floating Steps' is?
def_2 <- ctrl_ratio[,2]
summary(def_2)

wid_2 <- wide_ratio[,2]
summary(wid_2)

nar_2 <- narrow_ratio[,2]
summary(nar_2)

# Axis ratio Q3 #
#How many times would you say 'Floating Steps' were used?

def_3 <- ctrl_ratio[,3]
summary(def_3)

wid_3 <- wide_ratio[,3]
summary(wid_3)

nar_3 <- narrow_ratio[,3]
summary(nar_3)


all <- rbind(ver1[,31:33], ver2[,31:33], ver3[,31:33], ver4[,31:33], ver5[,31:33], ver6[,31:33])

# Axis ratio Q4 #
#Which of the three bar charts do you find most aesthetically pleasing?
v1_aes <- table(ver1[,31:33][,1]) 
names(v1_aes) <- c("Default", "Narrow", "Wide")

v2_aes <- table(ver2[,31:33][,1])
names(v2_aes) <- c("Default", "Wide", "Narrow")

v3_aes <- c(table(ver3[,31:33][,1]), 0)
names(v3_aes) <- c("Narrow", "Default", "Wide")

v4_aes <- table(ver4[,31:33][,1])
names(v4_aes) <- c("Narrow", "Wide", "Default")

v5_aes <- c(0, table(ver5[,31:33][,1]))
names(v5_aes) <- c("Wide", "Default", "Narrow")

v6_aes <- table(ver6[,31:33][,1])
names(v6_aes) <- c("Wide", "Narrow", "Default")

all_aes <- v1_aes + 
  v2_aes[names(v1_aes)] + 
  v3_aes[names(v1_aes)] + 
  v4_aes[names(v1_aes)] + 
  v5_aes[names(v1_aes)] + 
  v6_aes[names(v1_aes)]

# Axis ratio Q5 #
#Which bar chart do you feel is easiest to read and interpret?
v1_easint <- table(ver1[,31:33][,2]) 
names(v1_easint) <- c("Default", "Narrow", "Wide")

v2_easint <- table(ver2[,31:33][,2])
names(v2_easint) <- c("Default", "Wide", "Narrow")

v3_easint <- table(ver3[,31:33][,2])
names(v3_easint) <- c("Narrow", "Default", "Wide")

v4_easint <- c(table(ver4[,31:33][,2]), 0)
names(v4_easint) <- c("Narrow", "Default", "Wide")

v5_easint <- table(ver5[,31:33][,2])
names(v5_easint) <- c("Wide", "Default", "Narrow")

v6_easint <- c(0, table(ver6[,31:33][,2]))
names(v6_easint) <- c("Wide", "Narrow", "Default")

all_easint <- v1_easint + 
  v2_easint[names(v1_easint)] + 
  v3_easint[names(v1_easint)] + 
  v4_easint[names(v1_easint)] + 
  v5_easint[names(v1_easint)] + 
  v6_easint[names(v1_easint)]


# Axis ratio Q6 #
#Which bar chart do you find hardest to read and interpret?
v1_hrdint <- table(ver1[,31:33][,2]) 
names(v1_hrdint) <- c("Default", "Narrow", "Wide")

v2_hrdint <- table(ver2[,31:33][,2])
names(v2_hrdint) <- c("Default", "Wide", "Narrow")

v3_hrdint <- table(ver3[,31:33][,2])
names(v3_hrdint) <- c("Narrow", "Default", "Wide")

v4_hrdint <- c(table(ver4[,31:33][,2]), 0)
names(v4_hrdint) <- c("Narrow", "Default", "Wide")

v5_hrdint <- table(ver5[,31:33][,2])
names(v5_hrdint) <- c("Wide", "Default", "Narrow")

v6_hrdint <- c(0, table(ver6[,31:33][,2]))
names(v6_hrdint) <- c("Wide", "Narrow", "Default")

all_hrdint <- v1_hrdint + 
  v2_hrdint[names(v1_hrdint)] + 
  v3_hrdint[names(v1_hrdint)] + 
  v4_hrdint[names(v1_hrdint)] + 
  v5_hrdint[names(v1_hrdint)] + 
  v6_hrdint[names(v1_hrdint)]


##### STACKED BARS #####
vir_stack <- rbind(ver1[,34:37], ver5[,38:41])
def_stack <- rbind(ver2[,34:37], ver3[,38:41])
gry_stack <- rbind(ver4[,34:37], ver6[,38:41])

names(vir_stack) <- c('stack_1', 'stack_2', 'stack_3', 'stack_4')
names(def_stack) <- c('stack_1', 'stack_2', 'stack_3', 'stack_4')
names(gry_stack) <- c('stack_1', 'stack_2', 'stack_3', 'stack_4')

stack <- rbind(vir_stack, def_stack, gry_stack)

# Q1 #
# How many times would you say 'Floating Steps' were used in the Finals (Regional/City) round?
summary(stack[,1])
table(stack[,1])

# Q2 #
# How many times would you say 'Log Grip' was used in the Finals (Regional/City) round?
summary(stack[,2])
table(stack[,2])

# Q3 #
#Please select the statement you feel applies to the bar chart above.
stack_3 <- (stack[,3])[-which(is.na(stack[,3]))]

for(i in 1:length(stack_3)){  
  if(stack_3[i] == "Log Grip' was used LESS in Finals (Regional/City) rounds than in Qualifying (Regional/City) rounds."){
    stack_3[i] <- 'less'
  }else if(stack_3[i] == "Log Grip' was used MORE in Finals (Regional/City) rounds than in Qualifying (Regional/City) rounds."){
    stack_3[i] <- 'more'
  }else if(stack_3[i] == "Log Grip' was used an EQUAL number of times in Finals (Regional/City) rounds and Qualifying (Regional/City) rounds."){
    stack_3[i] <- 'equal'
  }
}

table(stack_3)

# Q4 #
#Which obstacle do you think was used MORE in Finals (Regional/City) rounds…?
stack_4 <- (stack[,4])

for(i in 1:length(stack_4)){  
  if(stack_4[i] == "They were used the same amount of times"){
    stack_4[i] <- "same"
  }
}

table(stack_4)


### DODGED BARS ###
vir_dodge <- rbind(ver1[,38:41], ver5[,34:37])
def_dodge <- rbind(ver2[,38:41], ver3[,34:37])
gry_dodge <- rbind(ver4[,38:41], ver6[,34:37])

names(vir_dodge) <- c('dodge_1', 'dodge_2', 'dodge_3', 'dodge_4')
names(def_dodge) <- c('dodge_1', 'dodge_2', 'dodge_3', 'dodge_4')
names(gry_dodge) <- c('dodge_1', 'dodge_2', 'dodge_3', 'dodge_4')

dodge <- rbind(vir_dodge, def_dodge, gry_dodge)

# Q1 #
# How many times would you say 'Floating Steps' were used in the Finals (Regional/City) round?
summary(dodge[,1])
table(dodge[,1])

# Q2 #
# How many times would you say 'Log Grip' was used in the Finals (Regional/City) round?
summary(dodge[,2])
table(dodge[,2])

# Q3 #
#Please select the statement you feel applies to the bar chart above.
dodge_3 <- (dodge[,3])[-which(is.na(dodge[,3]))]

for(i in 1:length(dodge_3)){  
  if(dodge_3[i] == "Log Grip' was used LESS in Finals (Regional/City) than in Qualifying (Regional/City)."){
    dodge_3[i] <- 'less'
  }else if(dodge_3[i] == "Log Grip' was used MORE in Finals (Regional/City) than in Qualifying (Regional/City)."){
    dodge_3[i] <- 'more'
  }else if(dodge_3[i] == "Log Grip' was used an EQUAL number of times in Finals (Regional/City) and Qualifying (Regional/City)."){
    dodge_3[i] <- 'equal'
  }
}

table(dodge_3)

# Q4 #
#Which obstacle do you think was used MORE in Finals (Regional/City) rounds…?
dodge_4 <- (dodge[,4])

for(i in 1:length(dodge_4)){  
  if(dodge_4[i] == "They were used the same amount of times"){
    dodge_4[i] <- "same"
  }
}

table(dodge_4)

# compare stacked and dodged bars #
rbind(table(stack_3), table(dodge_3))
rbind(table(stack_4), table(dodge_4))

### STACK/DODGE COMPARISONS ###
# Q1 #
#Which bar chart do you feel is easiest to read and interpret?
sta_dge <- c(ver1[,42], ver2[,42], ver3[,42], ver4[,42], ver5[,42], ver6[,42])
table(sta_dge)

sta_dge_vir <- c(ver1[,42], ver5[,42])
sta_dge_def <- c(ver2[,42], ver3[,42])
sta_dge_gry <- c(ver4[,42], ver6[,42])

rbind(table(sta_dge_vir), table(sta_dge_def), table(sta_dge_gry))

# Q2 #
# Which colour scheme do you find most aesthetically pleasing?

a_cols <- ver1[,43:44]
b_cols <- ver2[,43:44]
c_cols <- ver3[,43:44]
d_cols <- ver4[,43:44]
e_cols <- ver5[,43:44]
f_cols <- ver6[,43:44]

col_set <- c('a', 'b', 'c', 'd', 'e', 'f')
# a - viridis/default
# b - default/viridis
# c - default/grey
# d - grey/default
# e - viridis/grey
# f - grey/viridis

cbind(col_set, (rbind(table(a_cols[,1]), table(b_cols[,1]), table(c_cols[,1]), table(d_cols[,1]), table(e_cols[,1]), table(f_cols[,1]))))

# Q3 #
# Do you feel that one of the colour schemes makes it easier to read and interpret? If so, please select which one.
table(a_cols[,2])
table(b_cols[,2])
table(c_cols[,2])
table(d_cols[,2])
table(e_cols[,2])
table(f_cols[,2])


