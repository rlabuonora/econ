# http://www.columbia.edu/~md3405/IM_CT.pdf

# params restriccion presupuestaria
p1 <- 3
p2 <- 4
M <- 15

rest_p <- function(x) {
  c(p1 * x[1] + p2 * x[2] - M)
}

# funcion de utilidad
u <- function(x) {
  x1 <- x[1]
  x2 <- x[2]
  x1^(1/2) * x2^(1/2)
}

# solucion correcta
sol_corr <- c(15/6, 15/8)
# inicial
x0 <- c(2, 1.5)





sol <- solnp(x0, fun=u, eqfun=rest_p, eqB=0)

sol_corr <- c(15/6, 15/8)
sol$pars
eqn1(sol$pars)
u(sol$pars)

sol_corr - sol$pars

df <- tibble(
  p1 = 0:10,
  p2 = 0:10
)

df_2 <- expand.grid(p1 = seq(0, 5, by=0.01), 
                    p2 = seq(0, 5, by=0.01)) %>% 
  pmap(function(p1, p2) {
    c(
      p1 = p1, 
      p2 = p2,
    u = u(c(p1, p2)))
  }) %>% 
  purrr::map_df(~ bind_rows(.))


theme_set(theme_minimal())

ggplot(df_2, aes(p1, p2, z=u)) + 
  geom_contour(aes(color=..level..)) + 
  geom_segment(x = M/p1, y = 0, xend = 0, yend = M/p2) + 
  NULL

# generar y filtrar

u_opt <- sol$values[length(sol$values)]
p_opt <- sol$pars

sol_isocuanta <- df_2 %>% filter(abs(u-u_opt) < 0.01)

ggplot(df_2, aes(p1, p2)) + 
  geom_contour(aes(z=u)) +
  geom_line(data = sol_isocuanta) + 
  geom_segment(x = M/p1, y = 0, xend = 0, yend = M/p2, size=0.1) + 
  geom_point(aes(x=sol$pars[1], y=sol$pars[2]))
  

