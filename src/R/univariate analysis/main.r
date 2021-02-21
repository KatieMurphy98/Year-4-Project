rm(list=ls())
library(readxl)

for(i in 1:6){
    r <- assign(paste0("r",i), (as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", paste0("R - v",i)))))
    py <- assign(paste0("py",i), (as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", paste0("Py - v",i)))))
    assign(paste0("ver",i), rbind(r, py))
}

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


ctrl_y_scale <- rbind(ver1[,10:13], ver2[,10:13], ver3[,14:17], ver4[,18:21], ver5[,14:17], ver6[,18:21])
log_y_scale <- rbind(ver1[,14:17], ver2[,18:21], ver3[,10:13], ver4[,10:13], ver5[,18:21], ver6[,14:17])
trnc_y_scale <- rbind(ver1[,18:21], ver2[,14:17], ver3[,18:21], ver4[,14:17], ver5[,10:13], ver6[,10:13])

### Y Scales Q1 ###
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




log_4 <- log_y_scale[,4]
summary(log_4)




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
log_4[18] <- 3
log_4 <- as.numeric(log_4)

for(i in 1:length(log_4)){
    if(log_4[i] < 1){
       log_4[i] <- log_4[i]*100
    }
}

summary(log_4)
