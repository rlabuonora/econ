library(dplyr)
library(ggplot2)
library(reconPlots)
library(viridis)

theme_set(theme_minimal())

x_max <- 5

line.1 <- data.frame(x = c(0, x_max),
                     y = c(0, x_max),
                     name="supply")

line.2 <- data.frame(x = c(x_max, 0),
                     y = c(0, x_max),
                     name="demand")

line.3 <- line.1 %>% 
  mutate(y = y + 2,
         name="demand_1")

line.intersection <- curve_intersect(line.1, line.2)

line.intersection.1 <- curve_intersect(line.3, line.2)



ggplot(mapping = aes(x=x, y=y)) + 
  geom_line(data = line.1, aes(group = 1, color=name)) + 
  geom_line(data = line.2, aes(group = 1, color=name)) + 
  geom_line(data = line.3, aes(group = 1, color=name)) + 
  geom_segment(lty = "dashed", 
               aes(x=0, y = line.intersection$y, xend=line.intersection$x, yend=line.intersection$y)) + 
  geom_segment(lty = "dashed", 
               aes(x=line.intersection$x, y=0, xend=line.intersection$x, yend=line.intersection$y)) + 
  geom_segment(lty = "dashed",
               aes(x=line.intersection.1$x, y=0, xend=line.intersection.1$x, yend=line.intersection.1$y)) + 
  geom_segment(lty = "dashed",
               aes(x=0, y=line.intersection.1$y, xend=line.intersection.1$x, yend=line.intersection.1$y)) + 
  annotate("point", x=line.intersection$x, y=line.intersection$y) + 
  annotate("point", x=line.intersection.1$x, y = line.intersection.1$y) + 
  ylim(c(0, 7)) + 
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 7), arrow = arrow(length=unit(0.2, "cm"))) +
  geom_segment(aes(x=0, y=0, xend = 7, yend = 0), arrow = arrow(length=unit(0.2, "cm"))) + 
  scale_color_manual( values = c("#23576E", "#099FDB", 
                                 "#29B00E", "#208F84", 
                                 "#F55840", "#924F3E"))


# pg. 76

ggplot(mapping = aes(x=x, y=y)) + 
  geom_line(data = line.1, aes(color=name)) + 
  geom_line(data = line.2, aes(color=name)) + 
  geom_segment(lty = "dashed", 
               aes(x=0, y = line.intersection$y, xend=line.intersection$x, yend=line.intersection$y)) + 
  geom_segment(lty = "dashed", 
               aes(x=line.intersection$x, y=0, xend=line.intersection$x, yend=line.intersection$y)) +
  scale_color_manual(name = NULL, 
                     labels = c("Demanda", "Oferta"),
                     values = c("#23576E", "#099FDB", 
                                "#29B00E", "#208F84", 
                                "#F55840", "#924F3E")) +
  scale_x_continuous(expand = c(0, 0.2), breaks = c(0, line.intersection$x), labels=c("", expression(~Q[0])))  +
  scale_y_continuous(expand = c(0, 0.2), breaks = c(0, line.intersection$y), labels=c("", expression(~P[0]))) + 
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 6), arrow = arrow(length=unit(0.2, "cm"))) +
  geom_segment(aes(x=0, y=0, xend = 6, yend = 0), arrow = arrow(length=unit(0.2, "cm"))) + 
  theme(axis.title.y = 
          element_text(angle = 0),
        axis.title.x = 
          element_text(hjust=0.95, vjust=6))  +
  labs(x="X", y="P")

