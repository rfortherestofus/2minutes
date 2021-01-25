library(tidyverse)
library(palmerpenguins)

# When you use group_by() with summarize() you get this message:
# `summarise()` ungrouping output (override with `.groups` argument)

penguins %>% 
  group_by(island) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE))

# The default behavior is to drop the last level of grouping.
# This is the same as adding .groups = "drop_last" as an argument in summarize().

penguins %>% 
  group_by(island) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE),
            .groups = "drop_last") %>% 
  slice_max(order_by = mean_weight,
            n = 1)

# But you can also use .groups = "keep" which will keep the grouping.

penguins %>% 
  group_by(island) %>% 
  summarize(mean_weight = mean(body_mass_g, na.rm = TRUE),
            .groups = "keep") %>% 
  slice_max(order_by = mean_weight,
            n = 1)


