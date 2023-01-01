library(OECD)
library(plotly)
library(tidyverse)

# OECD Government/compulsory schemes (share of GDP)
#df_gov <- get_dataset("SHA",
#                      filter = "HF1.HCTOT.HPTOT.PARPIB.AUT+BEL+FIN+FRA+DEU+GRC+IRL+ITA+LUX+NLD+PRT+ESP",
#                      pre_formatted = TRUE)

#df_gov$ObsValue <- as.numeric(df_gov$ObsValue)

#df_gov$Time <- as.numeric(df_gov$Time)

#saveRDS(df_gov, file = "Health/df_gov.rds")

df_gov <- readRDS("Health/df_gov.rds")

# GDP at current prices
# df_GDP <- get_dataset("SNA_TABLE1",
#                      filter = "AUT+BEL+FIN+FRA+DEU+GRC+IRL+ITA+LUX+NLD+PRT+ESP.B1_GA.C",
#                      pre_formatted = TRUE)
#
# saveRDS(df_GDP, file = "Health/df_GDP.rds")

df_GDP <- readRDS("Health/df_GDP.rds")

# Health spending government at current prices
# df_gov_mllncu <- get_dataset("SHA",
#                              filter = "HF1.HCTOT.HPTOT.MLLNCU.AUT+BEL+FIN+FRA+DEU+GRC+IRL+ITA+LUX+NLD+PRT+ESP",
#                              pre_formatted = TRUE)
# 
# saveRDS(df_gov_mllncu, file = "Health/df_gov_mllncu.rds")

df_gov_mllncu <- readRDS("Health/df_gov_mllncu.rds")

# Health expenditure and financing
# Share of current expenditure on health
# df_gov_ptot <- get_dataset("SHA",
#                            filter = "HF1.HCTOT.HPTOT.PARCUR.AUT+BEL+FIN+FRA+DEU+GRC+IRL+ITA+LUX+NLD+PRT+ESP",
#                            pre_formatted = TRUE)
# 
# df_gov_ptot$ObsValue <- as.numeric(df_gov_ptot$ObsValue)
# 
# df_gov_ptot$Time <- as.numeric(df_gov_ptot$Time)
# 
# saveRDS(df_gov_ptot, file = "Health/df_gov_ptot.rds")

df_gov_ptot <- readRDS("Health/df_gov_ptot.rds")

