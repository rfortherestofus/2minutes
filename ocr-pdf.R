library(tesseract)
library(pdftools)

project_2025_text <- pdf_text("project2025.pdf")

project_2025_text |> 
  enframe(
    name = "page_number",
    value = "text"
  ) |> 
  mutate(
    paragraphs = str_split(text, "\n\n")
  ) |>
  unnest(paragraphs) |>
  mutate(paragraphs = str_squish(paragraphs)) |> 
  filter(paragraphs != "") |> 
  select(paragraphs) |> 
  # slice(101) |> 
  pull(paragraphs)
  
  # Remove empty paragraphs
  filter(str_trim(paragraphs) != "") |> 
  view()
  cat() |>
  str()
  as_tibble()
