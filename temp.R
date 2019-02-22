

df <- data.frame(x=c(1, 3, 5) * 1000, 
                 y= 1)
axs <- ggplot(df, aes(x, y)) + 
  geom_point()
axs
axs + scale_x_continuous(breaks = c(2000, 4000))
axs + scale_x_continuous(breaks = c(2000, 4000), labels = c("2k", "4k"))


leg <- ggplot(df, aes(y, x, width = 10, height = 100, fill=x)) + geom_tile()
leg

# relabel breaks in categorical scale

df2 <- data.frame(x=1:3, y=c("a", "b", "c"))

ggplot(df2, aes(x, y)) + geom_point()

ggplot(df2, aes(x, y)) + 
  geom_point() + 
  scale_y_discrete(labels=c(a="apple", b="banana", c="carrot"))
                   