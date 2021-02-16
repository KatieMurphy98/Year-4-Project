rm(list=ls())
library(readxl)

### ver 1 data ###
  r1 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "R - v1"))
  py1 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "Py - v1"))
  ver1 <- rbind(r1, py1)[-1,]
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
###

### ver 2 data ###
  r2 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "R - v2"))
  py2 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "Py - v2"))
  ver2 <- rbind(r2, py2)
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
###

### ver 3 data ###
  r3 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "R - v3"))
  py3 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "Py - v3"))
  ver3 <- rbind(r3, py3)
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
###

### ver 4 data ###
  r4 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "R - v4"))
  py4 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "Py - v4"))
  ver4 <- rbind(r4, py4)
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
###

### ver 5 data ###
  r5 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "R - v5"))
  py5 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "Py - v5"))
  ver5 <- rbind(r5, py5)
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
###

### ver 6 data ###
  r6 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "R - v6"))
  py6 <- as.data.frame(read_excel("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/survey responses/raw.xlsx", "Py - v6"))
  ver6 <- rbind(r6, py6)
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
###


ctrl_y_scale <- rbind(ver1[,10:13], ver2[,10:13], ver3[,14:17], ver4[,18:21], ver5[,14:17], ver6[,18:21])
log_y_scale <- rbind(ver1[,14:17], ver2[,18:21], ver3[,10:13], ver4[,10:13], ver5[,18:21], ver6[,14:17])
trnc_y_scale <- rbind(ver1[,18:21], ver2[,14:17], ver3[,18:21], ver4[,14:17], ver5[,10:13], ver6[,10:13])

# Approximately how much more than 'Log Grip' would you say 'Salmon Ladder' was used?
t.test(ctrl_y_scale[,2], log_y_scale[,2]) # p = 2.222e-10 < 0.05 **
t.test(ctrl_y_scale[,2], trnc_y_scale[,2]) # p = 0.02725 < 0.05 *
t.test(log_y_scale[,2], trnc_y_scale[,2]) # p = 1.027e-13 < 0.05 ***

# Approximately how much more than 'Quintuple Steps' would you say 'Salmon Ladder' was used?
t.test(ctrl_y_scale[,3], log_y_scale[,3]) # p = 8.022e-06 < 0.05 **
t.test(ctrl_y_scale[,3], trnc_y_scale[,3]) # p = 0.001051 < 0.05 *
t.test(log_y_scale[,3], trnc_y_scale[,3]) # p = 3.79e-12 < 0.05 ***