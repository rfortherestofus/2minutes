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
  labs(title = "Ullamco sit Lorem culpa reprehenderit tempor tempor fugiat ut adipisicing fugiat officia nisi. Aliqua dolore duis laboris commodo quis magna dolore anim nostrud deserunt in eu sint. Reprehenderit excepteur adipisicing laboris sint exercitation esse nulla proident est dolore sunt. Non amet eiusmod laborum minim quis cupidatat elit proident ad fugiat.")


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
  labs(title = "Ullamco sit Lorem culpa reprehenderit tempor tempor fugiat ut adipisicing fugiat officia nisi. Aliqua dolore duis laboris commodo quis magna dolore anim nostrud deserunt in eu sint. Reprehenderit excepteur adipisicing laboris sint exercitation esse nulla proident est dolore sunt. Non amet eiusmod laborum minim quis cupidatat elit proident ad fugiat.") +
  theme(
    plot.title = element_textbox_simple()
  )
