library(tidyverse)
library(fs)

csv_files <-
  dir_ls(
    path = "csv_files"
  )

read_csv(csv_files)
