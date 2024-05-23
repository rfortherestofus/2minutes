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
  geom_col() +
  labs(
    title = "Biscoe island has the most penguins",
    subtitle = "But the other islands are still great. There are penguins living there. So hey, don't ignore those two islands, ok?"
  )

penguins |>
  count(island) |>
  ggplot(
    aes(
      x = island,
      y = n
    )
  ) +
  geom_col() +
  labs(
    title = "Biscoe island has the most penguins",
    subtitle = str_wrap("But the other islands are still great. There are penguins living there. So hey, don't ignore those two islands, ok?", 10)
  )



library(tidyverse)
library(palmerpenguins)
library(ggtext)

penguins |>
  count(island) |>
  ggplot(
    aes(
      x = island,
      y = n
    )
  ) +
  geom_col() +
  labs(
    title = "Biscoe island has the most penguins",
    subtitle = "But the other islands are still great. There are penguins living there. So hey, don't ignore those two islands, ok?"
  ) +
  theme(
    plot.subtitle = element_textbox_simple()
  )
