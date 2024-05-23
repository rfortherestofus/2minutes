library(tidyverse)
library(palmerpenguins)

penguins |> 
  group_by(island) |> 
  summarize(n = n())

penguins |> 
  count(island)
