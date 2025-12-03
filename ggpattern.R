library(tidyverse)
library(ggpattern)
library(gapminder)

afghanistan_life_expectancy <-
  gapminder |>
  filter(country == "Afghanistan") |>
  select(country, year, lifeExp)

afghanistan_life_expectancy

life_expectancy_chart <-
  afghanistan_life_expectancy |>
  ggplot(
    aes(
      x = year,
      y = lifeExp
    )
  ) +
  scale_x_continuous(expand = expansion(0, 0)) +
  scale_y_continuous(expand = expansion(0, 0)) +
  labs(
    title = "Life Expectancy in Afghanistan, 1952-2007",
    x = NULL,
    y = NULL
  ) +
  theme_minimal(
    base_size = 16,
    base_family = "Inter"
  ) +
  theme(
    plot.title = element_text(face = "bold"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )

life_expectancy_chart

life_expectancy_chart +
  geom_area(
    fill = "#6cabdd"
  )

life_expectancy_chart +
  geom_area_pattern(
    pattern = "circle",
    pattern_colour = "#6cabdd",
    pattern_fill = "#6cabdd",
    pattern_spacing = 0.025,
    color = "#6cabdd",
    linewidth = 1,
    fill = "transparent"
  )
