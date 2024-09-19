library(tidyverse)

minnesota_population_2019 <-
  read_csv("data-raw/minnesota_population_2019.csv")

minnesota_population_2019 |> 
  view()

minnesota_population_2019 |> 
  filter(age == "0 to 4") |> 
  view()

minnesota_population_2019 |> 
  filter(population > 180000) |> 
  view()
