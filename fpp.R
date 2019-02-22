library(tibble)

theme_set(theme_minimal())

df <- tribble(
  ~food, ~machines,   ~lab,
  0,      150,        "A",  
  10,     140,        "B",
  20,     120,        "C",
  30,     90,         "D",
  40,     50,         "E",
  50,     0,          "F"
) %>% 
  mutate(machines_2 = machines + 30)

ggplot(df, aes(x=food, y=machines)) + 
  geom_point() + 
  geom_line() + 
  geom_line(aes(x=food, y = machines_2), lty="dashed") + 
  geom_ribbon(aes(ymin = 0, ymax=machines), alpha = 0.5) + 
  geom_ribbon(aes(ymin = machines, ymax = machines_2), alpha = 0.5, fill = "red") +
  geom_line(aes(x=food, y=machines), arrow=arrow(length=unit(0.25, "cm"))) + 
  labs(x="Comida", y= "Máquinas")
