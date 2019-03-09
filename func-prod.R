library(tidyverse)
library(viridis)
library(cowplot)

theme_set(theme_minimal())


df <- tibble(
  labor = 0:5,
  total_product = c(0, 2000, 3000, 3500, 3800, 3900),
  marginal_product = if_else(
    is.na(lead(total_product) - total_product),
          0,
          lead(total_product) - total_product),
  average_product = if_else(
    is.na(total_product / labor),
    0,
    total_product / labor)
)

total_product <- ggplot(df, aes(labor, total_product)) +
  geom_line() + 
  geom_point() +  
  geom_rect(aes(xmin = lag(labor), 
                ymin = lag(total_product), 
                xmax = labor, 
                ymax=total_product,
                fill = lag(marginal_product)),
            alpha = 0.5) +
  scale_x_continuous(minor_breaks = df$labor) + 
  scale_y_continuous(minor_breaks = df$total_product) + 
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 4000), size = 0.1, arrow = arrow(length=unit(0.2, "cm"))) +
  geom_segment(aes(x=0, y=0, xend = 6, yend = 0), size = 0.1, arrow = arrow(length=unit(0.2, "cm"))) + 
  scale_fill_viridis() +
  labs(x="Labor", y="Total Product", fill="Marginal Product") + 
  theme(legend.position="none")

marginal_product <- ggplot(df, 
                           aes(labor, marginal_product,
                           fill=(marginal_product))) + 
  geom_line() + 
  geom_point() + 
  geom_rect(alpha= 0.5, 
            aes(xmin = labor,
                ymin = 0,
                xmax = lead(labor),
                ymax = marginal_product)) + 
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 4000), size = 0.1, arrow = arrow(length=unit(0.2, "cm"))) +
  geom_segment(aes(x=0, y=0, xend = 6, yend = 0), size = 0.1, arrow = arrow(length=unit(0.2, "cm"))) + 
  ylim(c(0, 4000)) + 
  scale_fill_viridis() + 
  labs(x="Labor", y="Marginal Product", fill = "Marginal Product")

# scale colors are wrong
plot_grid(total_product, marginal_product)
