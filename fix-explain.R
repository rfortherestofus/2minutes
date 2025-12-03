library(tidyverse)
library(palmerpenguins)

penguins |>
  count(island) |>
  ggplot(
    aes(
      x = island,
      y = n,
    )
  ) +
  geom_bar()
