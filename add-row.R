library(tidyverse)
library(janitor)
library(gganimate)

goals <-
  tibble::tribble(
    ~Rank, ~Player, ~League, ~Cup, ~Continental, ~Country.and.other, ~Total, ~Career.span,
    1L, "Cristiano Ronaldo", "553[a]", 56L, 165L, 133L, "907[63]", "2002–present",
    2L, "Lionel Messi*", "517[b]", 71L, 149L, 112L, "849[68]", "2004–present",
    3L, "Pelé*", "604[c]", 49L, 26L, 83L, "762", "1957–1977",
    4L, "Romário", "545[d]", 93L, 54L, 64L, "756", "1985–2007",
    5L, "Ferenc Puskás", "516[e]", 69L, 56L, 84L, "725", "1943–1966",
    6L, "Josef Bican*", "515[f]", 137L, 38L, 32L, "722", "1931–1955",
    7L, "Robert Lewandowski", "400[g]", 57L, 107L, 84L, "648[73]", "2008–present",
    8L, "Jimmy Jones*", "330[h]", 286L, 14L, 9L, "639", "1947–1964",
    9L, "Gerd Müller*", "405[i]", 92L, 69L, 68L, "634", "1964–1981",
    10L, "Joe Bambrick*", "347[j]", 253L, 5L, 21L, "626", "1926–1943",
    11L, "Abe Lenstra", "573[k]", 18L, 0L, 33L, "624", "1936–1963",
    12L, "Luis Suárez", "409[l]", 48L, 57L, 69L, "583[78]", "2005–present",
    13L, "Eusébio", "381[m]", 97L, 59L, 41L, "578", "1960–1978",
    14L, "Glenn Ferguson", "313[n]", 241L, 9L, 0L, "563", "1987–2011",
    15L, "Zlatan Ibrahimović", "394[o]", 48L, 57L, 62L, "561", "1999–2023",
    16L, "Imre Schlosser", "413[p]", 68L, 13L, 59L, "553", "1906–1928",
    17L, "Fernando Peyroteo*", "464[q]", 72L, 3L, 14L, "553", "1937–1949",
    18L, "Uwe Seeler*", "447[r]", 41L, 21L, 43L, "552", "1954–1978",
    19L, "Jimmy McGrory*", "407[s]", 131L, 0L, 12L, "550", "1923–1937",
    20L, "Alfredo Di Stéfano", "378[t]", 54L, 76L, 29L, "537", "1945–1966",
    21L, "György Sárosi", "350[u]", 35L, 103L, 42L, "530", "1931–1948",
    22L, "Roberto Dinamite", "476[v]", 10L, 5L, 22L, "513", "1971–1992",
    23L, "Hugo Sánchez", "390[w]", 49L, 38L, 30L, "507", "1976–1997",
    24L, "Franz Binder", "297[x]", 93L, 87L, 26L, "503", "1930–1949",
    25L, "Zico", "410[x]", 27L, 16L, 48L, "501", "1971–1994"
  ) |>
  clean_names() |>
  select(player, total) |>
  mutate(total = parse_number(total)) |>
  mutate(player = str_remove(player, "\\*")) |>
  add_row(
    player = "Elias Keyes",
    total = 1000
  ) |>
  mutate(player = fct_reorder(player, total)) 

goals |>
  ggplot(
    aes(
      x = total,
      y = player,
      label = total
    )
  ) +
  geom_col() +
  geom_text(
    hjust = 1.2,
    color = "white"
  ) +
  labs(
    title = "Best players",
    subtitle = "Goals scored",
    caption = "P.S not accurate"
  ) +
  scale_x_continuous(expand = expansion(0.01, 0)) +
  theme_void() +
  theme(
    axis.text.y = element_text(hjust = 1),
    plot.caption = element_text(
      color = "gray95"
    ),
    plot.title.position = "plot",
    plot.title = element_text(
      hjust = 0.5,
      face = "bold"
    ),
    plot.subtitle = element_text(
      hjust = 0.5
    ),
    legend.position = "None"
  )

