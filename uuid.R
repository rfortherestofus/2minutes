library(tidyverse)

generate_multiple_selections <- function() {
  features <- c("Price", "Quality", "Design", "Durability", "Customer Service", "Warranty")
  num_selections <- sample(1:4, 1)
  selected_features <- sample(features, num_selections)
  paste(selected_features, collapse = ", ")
}

cities <- c(
  "New York",
  "Los Angeles",
  "Chicago",
  "Houston",
  "Phoenix",
  "Philadelphia",
  "San Antonio",
  "San Diego",
  "Dallas",
  "San Jose",
  "Austin",
  "Seattle",
  "Denver",
  "Boston",
  "Miami"
)

survey_data <-
  tibble(
    age = sample(
      18:75,
      200,
      replace = TRUE
    ),
    gender = sample(
      c(
        "Male",
        "Female",
        "Non-binary"
      ),
      200,
      replace = TRUE,
      prob = c(0.48, 0.48, 0.04)
    ),
    location = sample(
      cities,
      200,
      replace = TRUE,
      prob = c(
        0.12,
        0.10,
        0.08,
        0.08,
        0.07,
        0.07,
        0.06,
        0.06,
        0.06,
        0.06,
        0.06,
        0.06,
        0.06,
        0.06,
        0.06
      )
    ),
    favorite_features = map_chr(1:200, ~ generate_multiple_selections())
  )

survey_data

survey_data |>
  mutate(id = row_number()) |> 
  separate_longer_delim(
    favorite_features,
    delim = ", "
  ) |>
  count(location, favorite_features) |> 
  complete(location, favorite_features)
