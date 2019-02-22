# Pg. 68
library(reconPlots)

demanda_elastica <- data.frame(precio   = c(1000, 500),
                               cantidad = c(1,    3))

demanda_unidad <- data.frame(precio   = c(1000, 2000),
                             cantidad = c(1,    0.5))



demanda_inelastica <- data.frame(precio   = c(10, 15),
                                 cantidad = c(4,  2))

fit <- lm(precio~cantidad, data=demanda_elastica)


ggplot(demanda_elastica, aes(cantidad, precio)) + 
  geom_abline(aes(intercept =  fit$coefficients[["(Intercept)"]], slope = fit$coefficients[["cantidad"]])) +
  geom_point() + 
  geom_rect(mapping=aes(xmin = 0, xmax = cantidad, ymin = 0, ymax = precio), alpha=0.5) + 
  xlim(0, 4) + 
  ylim(0, 1100)

# chequear extend options!
