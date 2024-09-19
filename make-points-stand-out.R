library(tidyverse)

pre_post_data <-
  tribble(
    ~question,
    ~timing,
    ~rating,
    "I learned to do thing X",
    "Pre",
    1.6,
    "I learned to do thing X",
    "Post",
    4.2
  )

pre_post_data

pre_post_plot <- function(df) {
  df |>
    ggplot(
      aes(
        x = rating,
        y = question,
        fill = timing
      ),
    ) +
    scale_x_continuous(
      limits = c(1, 5),
      breaks = seq(1, 5, 1),
      expand = expansion(0, 0)
    ) +
    scale_fill_manual(
      values = c(
        "Pre" = "#6d8d24",
        "Post" = "#213921"
      ),
      guide = guide_legend(reverse = TRUE),
      name = NULL
    ) +
    theme_minimal(base_size = 16) +
    theme(
      plot.margin = margin(rep(20, 4)),
      axis.title = element_blank(),
      panel.grid.minor = element_blank(),
      panel.grid.major.y = element_blank(),
      plot.title = element_text(
        face = "bold",
        color = "grey30"
      ),
      plot.title.position = "plot",
      legend.position = "top",
      axis.text.x = element_text(
        color = "grey40",
        size = 12
      ),
      axis.text.y = element_text(
        color = "grey40",
        size = 12
      )
    )
}

pre_post_plot(pre_post_data)

pre_post_plot(pre_post_data) +
  geom_point(
    shape = 21,
    size = 8
  )

pre_post_data_v2 <-
  tribble(
    ~question,
    ~timing,
    ~rating,
    "I learned to do thing Y",
    "Pre",
    3.5,
    "I learned to do thing Y",
    "Post",
    3.6
  )

pre_post_data_v2

pre_post_plot(pre_post_data_v2) +
  geom_point(
    shape = 21,
    size = 8
  )

pre_post_plot(pre_post_data_v2) +
  geom_point(
    shape = 21,
    size = 8,
    color = "white"
  )

pre_post_plot(pre_post_data_v2) +
  geom_point(
    shape = 21,
    size = 8,
    color = "white",
    stroke = 1
  )
