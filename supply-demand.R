library(dplyr)
library(ggplot2)
library(reconPlots)


line.1 <- data.frame(x = c(1, 9),
                     y = c(1, 9))

line.2 <- data.frame(x = c(9, 1),
                     y = c(1, 9))

line.intersection <- curve_intersect(line.1, line.2)


ggplot(mapping = aes(x=x, y=y)) + 
  geom_line(data = line.1, color = "red") + 
  geom_line(data = line.2, color = "blue") + 
  geom_segment(lty = "dashed", 
               aes(x=0, y = line.intersection$y, xend=line.intersection$x, yend=line.intersection$y)) + 
  geom_segment(lty = "dashed", 
               aes(x=line.intersection$x, y=0, xend=line.intersection$x, yend=line.intersection$y))
