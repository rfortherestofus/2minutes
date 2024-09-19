library(tidyverse)
library(palmerpenguins)

penguins_bill_length_by_island <-
  penguins |>
  group_by(island) |>
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) 

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length
  )
) +
  geom_col() +
  geom_text(vjust = -0.5)

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length
  )
) +
  geom_col() +
  geom_text(vjust = -0.5) +
  theme_minimal(base_family = "IBM Plex Mono")

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length
  )
) +
  geom_col() +
  geom_text(vjust = -0.5,
            family = "IBM Plex Mono") +
  theme_minimal(base_family = "IBM Plex Mono")

theme_set(theme_minimal(base_family = "IBM Plex Mono"))

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length
  )
) +
  geom_col() +
  geom_text(vjust = -0.5)

update_geom_defaults(
  geom = "text",
  aes(family = "IBM Plex Mono")
)

ggplot(
  data = penguins_bill_length_by_island,
  aes(
    x = island,
    y = mean_bill_length,
    label = mean_bill_length
  )
) +
  geom_col() +
  geom_text(vjust = -0.5)
