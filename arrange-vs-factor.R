library(tidyverse)
library(palmerpenguins)
library(gt)

# When we make a table, our data shows up in the order it is printed.

penguins %>% 
  group_by(species) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE)) %>% 
  ungroup() 

penguins %>% 
  group_by(species) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE)) %>% 
  ungroup() %>% 
  gt()

# If we want to reorder rows in a table, we use the arrange() function.

penguins %>% 
  group_by(species) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE)) %>% 
  ungroup() %>% 
  arrange(desc(mean_weight)) %>% 
  gt()

# Let's see if arrange() works for reordering a bar chart.
# Here's the basic bar chart we want to make:

penguins %>% 
  group_by(species) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE)) %>% 
  ungroup() %>% 
  ggplot(aes(x = species,
             y = mean_weight)) +
  geom_col()

# Let's add an arrange and see if it works.

penguins %>% 
  group_by(species) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE)) %>% 
  ungroup() %>% 
  arrange(desc(mean_weight)) %>% 
  ggplot(aes(x = species,
             y = mean_weight)) +
  geom_col()

# It doesn't! 
# Instead, we need to use factors.
# I'm using fct_reorder() from the forcats package. 
# This function reorders one variable by the value of another variable.

penguins %>% 
  group_by(species) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE)) %>% 
  ungroup() %>% 
  mutate(species = fct_reorder(species, desc(mean_weight))) %>% 
  ggplot(aes(x = species,
             y = mean_weight)) +
  geom_col()

# Does using factors work for tables?

penguins %>% 
  group_by(species) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE)) %>% 
  ungroup() %>% 
  mutate(species = fct_reorder(species, desc(mean_weight))) %>% 
  gt()

# Nope!
