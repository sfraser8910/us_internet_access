library(readr)   
library(dplyr)
library(tidyverse)
library(janitor)
library(dplyr)

indi_cols <- c("SERIALNO", "AGEP", "RAC1P", "SCHL", "ESR")

house_cols <- c("SERIALNO", "HINCP", "ACCESSINET", "NOC")

indi <- bind_rows(
  read_csv("psam_pusa.csv",col_select = all_of(indi_cols)),
  read_csv("psam_pusb.csv",col_select = all_of(indi_cols)),
  read_csv("psam_pusc.csv",col_select = all_of(indi_cols)),
  read_csv("psam_pusd.csv",col_select = all_of(indi_cols))
) |> clean_names()

house <- bind_rows(
  read_csv("psam_husa.csv",col_select = all_of(house_cols)),
  read_csv("psam_husb.csv",col_select = all_of(house_cols)),
  read_csv("psam_husc.csv",col_select = all_of(house_cols)),
  read_csv("psam_husd.csv",col_select = all_of(house_cols))
) |> clean_names()

# Join household info into person-level data
x <- indi |>
  left_join(house, by = "serialno")

if (!dir.exists("data")) {
  dir.create("data")
}

#make data accessible elsewhere
saveRDS(x, file = "data/x.rds")


