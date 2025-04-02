# R code for classifying images

# install.packages("patchwork")

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992 = flip(mato1992)
plot(mato1992)

mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 = flip(mato2006)
plot(mato2006)

mato1992c = im.classify(mato1992, num_clusters=2)
# class 1 = human
# class 2 = forest

mato2006c = im.classify(mato2006, num_clusters=2)
# class 1 = forest
# class 2 = human

f1992 = freq(mato1992c)
tot1992 = ncell(mato1992c)
prop1992 = f1992 / tot1992
perc1992 = prop1992 * 100

# human = 17%, forest = 83%

perc2006 = freq(mato2006c) * 100 / ncell(mato2006c)

# human = 54%, forest = 45%

# Creating dataframe

class = c("Forest","Human")
y1992 = c(83,17)
y2006 = c(45,55)
tabout = data.frame(class, y1992, y2006)

p1 = ggplot(tabout, aes(x=class, y=y1992, color=class)) + 
  geom_bar(stat="identity", fill="white") + 
  ylim(c(0,100))

p2 = ggplot(tabout, aes(x=class, y=y2006, color=class)) + 
  geom_bar(stat="identity", fill="white") + 
  ylim(c(0,100))

p1 + p2
p1 / p2

p0 = im.ggplot(mato1992)
p00 = im.ggplot(mato2006)
  
p0 + p00 + p1 + p2

% https://stackoverflow.com/questions/52684424/show-the-percentage-instead-of-count-in-histogram-using-ggplot2-r


#----- Day 2

# Coloring bars

ggplot(tabout, aes(x=class, y=y2006, fill=class, color=class)) + 
  geom_bar(stat="identity") + 
  ylim(c(0,100))

# https://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization

# Horizontal bars

p1 = ggplot(tabout, aes(x=class, y=y1992, color=class)) +
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100)) +
  coord_flip()

p2 = ggplot(tabout, aes(x=class, y=y2006, color=class)) +
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100)) +
  coord_flip()

p1 / p2

classall = c("Forest1992","Human1992","Forest2006","Human2006")
percentage = c(83,17,45,55)
all = data.frame(classall, percentage)

# Stacked barplot with multiple groups
ggplot(data=all, aes(x=classall, y=percentage, color=classall)) +
  geom_bar(stat="identity", fill="white")

