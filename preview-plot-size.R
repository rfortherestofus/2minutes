library(tidyverse)
library(palmerpenguins)

penguins |>
  count(island) |> 
  ggplot(
    aes(
      x = island,
      y = n
    )
  ) +
  geom_col()

ggsave(
  filename = "penguins-by-island.png",
  width = 4,
  height = 8,
  unit = "in"
)

library(camcorder)

gg_record(
  device = "png",
  width = 4,
  height = 8,
  unit = "in"
)

penguins |>
  count(island) |> 
  ggplot(
    aes(
      x = island,
      y = n
    )
  ) +
  geom_col()
