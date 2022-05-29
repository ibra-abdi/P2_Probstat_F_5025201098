# 1
# 1a
# Carilah standar deviasi dari data selisih pasangan pengamatan tabel diatas!

# Masukkan data
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

# Cari standar deviasi
sd_x <- sd(x)
sd_y <- sd(y)

sd_x
sd_y

# 1b
# Carilah nilai t (p-value)!

# Menggunakan t-test
t.test(x, y, alternative = "greater", var.equal = FALSE)

# 1c
var.test(x, y)

t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)


# 2
install.packages("BSDA")
library(BSDA)

# 2a
# readme

# 2b 
tsum.test(mean.x=23500, sd(3900), n.x=100)

# 2c
# readme

# 3
# 3a
# H0 dan H1
# readme

# 3b 
# Hitung Sampel Statistik
tsum.test(n.x=19, mean.x=3.64, s.x=1.67, 
     n.y=27, mean.y=2.79, s.y = 1.32, 
     alternative = "greater", var.equal = TRUE)

# 3c
# Lakukan Uji Statistik (df =2)
install.packages("mosaic")
library(mosaic)

plotDist(dist='t', df=2, col="green")

# 3d
qchisq(p = 0.05, df = 2, lower.tail=FALSE)

# 3e dan 3d di readme

# 4
# 4a

myData <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")) 
dim(myData)
head(myData)
attach(myData)

myData$V1 <- as.factor(myData$V1)
myData$V1 = factor(myData$V1,labels = c("Quas","Wex", "Exort", "Quas"))

class(myData$V1)

group1 <- subset(myData, V1=="Quas")
group2 <- subset(myData, V1=="Wex")
group3 <- subset(myData, V1=="Exort")

# 5
# 5a
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("C:/Users/itjus/Downloads/GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
 facet_grid(.~Glass, labeller = label_both)

# 5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# 5c
data_summary <- group_by(GTL, Glass, Temp) %>%
 summarise(mean=mean(Light), sd=sd(Light)) %>%
 arrange(desc(mean))
print(data_summary)

# 5d
tukey <- TukeyHSD(anova)
print(tukey)

# 5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)

write.csv("GTL_summary.csv")