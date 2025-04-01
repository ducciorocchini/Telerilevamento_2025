# classifying data

library(terra)
library(imageRy)
library(ggplot2) # package needed for the final graph (histograms)
library(patchwork) # package needed to couple graphs

setwd("~/Desktop")
arctic <- rast("ellesmere_oli_2014172_lrg.jpg")
plot(arctic)
arctic <- flip(arctic)
plot(arctic)

# 1. values
valarc <- values(arctic)
valarc
head(valarc)

# 2. kmeans
karc <- kmeans(valarc, centers=3)
karc$cluster

# 3. land cover map
arcc <- setValues(arctic[[1]], karc$cluster)
plot(arcc)

# all of this can be done by just one function which is called: im.classify()
arccim <- im.classify(arctic, num_clusters=3)
arccim <- im.classify(arctic, num_clusters=3, seed=4)

im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# Classified images
m1992c <- im.classify(m1992, num_clusters=2, seed=4) 
# 1 = forest, 2 = human related areas
m1992cs <- subst(m1992c, c(1,2), c("forest","human"))
plot(m1992cs)

m2006c <- im.classify(m2006, num_clusters=2, seed=4)
# 2 = forest, 1 = human related areas
m2006cs <- subst(m2006c, c(2,1), c("forest","human"))
plot(m2006cs)

par(mfrow=c(1,2))
plot(m1992cs)
plot(m2006cs)

# percentages
f1992 <- freq(m1992cs)
p1992 <- f1992$count / ncell(m1992cs)
perc1992 <- p1992*100
# [1] 83.08683 16.91317

f2006 <- freq(m2006cs)
perc2006 <- f2006$count*100 / ncell(m2006cs)
# [1] 45.30561 54.69439

# build the table
# columns:
cover <- c("forest","human")
perc1992 <- c(83,17)
perc2006 <- c(45,55)

finalt <- data.frame(cover, perc1992, perc2006)

p1 <- ggplot(finalt, aes(x=cover, y=perc1992, color=cover)) +
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p2 <- ggplot(finalt, aes(x=cover, y=perc2006, color=cover)) +
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p1 + p2

p1 / p2

(p1 | p2 | p1) /
      p2

# ggplot2
im.list()

mato <- im.import("matogrosso_ast_2006209_lrg.jpg")
mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

p3 <- im.ggplot(mato, 1)
p4 <- im.ggplot(mato1992, 1)

(p1 | p2 | p1) /
      p3

(p4 | p1) /
(p3 | p2)

# Solar Orbiter 
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
sunc <- im.classify(sun, num_clusters=3, seed=4)
suncs <- subst(sunc, c(1,2,3), c("Low energy","Medium energy","High energy"))

fs <- freq(suncs)
ps <- fs$count*100 / ncell(suncs)

energy <- c("Low","Medium","High")
percentage <- ps
finalt <- data.frame(energy, ps)

p5 <- ggplot(finalt, aes(x=energy, y=percentage, color=energy)) +
  geom_bar(stat="identity", fill="white") 

p6 <- im.ggplot(sun, 1)

p6 / p5
