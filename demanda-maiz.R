# Nordhaus pg. 46
library(tidyverse)
library(ggrepel)

theme_set(theme_minimal())

df <- tribble(
  ~precio, ~cantidad, ~lab, ~momento,
  5,     9,           "A",  "Antes",
  4,     10,          "B",  "Antes",
  3,     12,          "C",  "Antes",
  2,     15,          "D",  "Antes",
  1,     20,          "E",  "Antes"
)



ggplot(df, aes(x=cantidad, y=precio)) + 
  geom_line() + 
  geom_point() +
  geom_text_repel(aes(label=lab)) + 
  xlim(0, 20) + 
  ylim(0, 5) + 
  labs(x="Cantidad de Maíz",
       y="Precio del Maíz",
       title = "Demanda de Maíz",
       subtitle = "A medida que el precio se reduce los consumidores demandan más")

df_2 <- bind_rows(
  df,
  mutate(df, 
         momento = "Después",
         cantidad = cantidad-5)
)

ggplot(df_2, aes(x=cantidad, y=precio, color=momento)) + 
  geom_line() + 
  geom_point() +
  xlim(0, 20) + 
  ylim(0, 5) + 
  annotate("segment", x = 6, xend = 9, y=4, yend=4, arrow = arrow(length = unit(0.2, "cm"))) + 
  annotate("segment", x = 11, xend = 14, y=2, yend=2, arrow = arrow(length = unit(0.2, "cm"))) + 
  labs(x="Cantidad de Maíz",
       y="Precio del Maíz",
       title = "Demanda de Maíz",
       subtitle = "Si aumenta el ingreso de los consumidores la curva se desplaza hacia la derecha")



