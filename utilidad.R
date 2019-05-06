library(tidyverse)

# consumer surplus for an individual

df <- tibble(
  p = c(10, rep(9:2, each=2), 0.2, 0.2,  0),
  q = rep(0:9, each = 2)
)


ggplot(df, aes(q, p)) + 
  geom_line() + 
  geom_rect(aes(xmin = 0, xmax = 0, ymin = 0, ymax = 0)) + 
  scale_x_continuous(labels = 0:9,
                     breaks = 0:9)
