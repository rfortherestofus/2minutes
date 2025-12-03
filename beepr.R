library(tidyverse)
library(fs)
library(beepr)

csv_files <-
  dir_ls(
    path = "csv_files"
  )

my_data <-
  map(csv_files, read_csv) |>
  bind_rows()

beep(sound = 8)

