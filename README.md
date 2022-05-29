# P2_Probstat_F_5025201098
Ibra Abdi Ibadihi - 5025201098

## Soal 1
### A. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

Masukkan data dari tabel dalam variabel
```
x <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```
Cari standar deviasi dengan sd_[variabel]
```
sd_x <- sd(x)
sd_y <- sd(y)
sd_x
sd_y
```
![Screenshot](/img/1a.PNG)

### B. Carilah nilai t (p-value)!
Gunakan fungsi t.test
```
t.test(x, y, alternative = "greater", var.equal = FALSE)
```
![Screenshot](/img/1b.PNG)

### C. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika...
Bandingkan dua variable dengan var.test
```
var.test(x, y)
```
Tentukan apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5%
menggunakan t.test dengan var.equal = true
```
t.test(x, y, var.equal = TRUE)
```
![Screenshot](/img/1c.PNG)
Dapat dibandingkan dengan output 1b bahwa nilainya sama sehingga dapat disimpulkan tidak ada pengaruh signifikan secara statistika dengan 𝛼 = 5%

## Soal 2
Sumber : https://quizlet.com/explanations/questions/it-is-claimed-that-automobiles-are-driven-on-average-more-than-20000-kilometers-per-year-to-test-this-claim-100-randomly-selected-automobile-5cc9581c-1e2d7060-f8c4-4e03-b817-b086641e330e
### 2a. Apakah Anda setuju dengan klaim tersebut?
Ya

### 2b. Jelaskan maksud dari output yang dihasilkan!
Diketahui n = 100, Rata-Rata () = 23500, dan standar deviasi(σ) = 3900
Null hypothesis adalah H0 : μ = 23500
alternatif hipotesisnya adalah
H1 : μ < 23500
z = 8.97
### 2c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
P(Z>8.97)=1-P(Z<8.97)
1-1=0
Nilai P mendekati nol dan sehingga null hypothesis ditolak dan disimpulkan automobile berkendara lebih dari 23500km per tahun
![Screenshot](/img/2b.PNG)
## Soal 3
### 3a. H0 dan H1
Perhitungan H0
z = X̄ - μ0 / (σ/√n) = 9.50
Perhitungan H1
z = X̄ - μ0 / (σ/√n) = 10.98

### 3b. Sampel Statistik
Perhitungan dilakukan menggunakan tsum.test
```
tsum.test(n.x=19, mean.x=3.64, s.x=1.67, 
          n.y=27, mean.y=2.79, s.y = 1.32, 
          alternative = "greater", var.equal = TRUE)
```
![Screenshot](/img/3b.PNG)
### 3c. Lakukan Uji Statistik (df =2)
Uji dilakukan menggunakan plotdist dengan library mosaic
```
install.packages("mosaic")
library(mosaic)
plotDist(dist='t', df=2, col="blue")
```
![Screenshot](/img/3c.PNG)
### 3d. Nilai Kritikal
Untuk mendapatkan nilai kritikal digunakan fungsi qchisq dengan
```
qchisq(p = 0.05, df = 2, lower.tail=FALSE)
```
![Screenshot](/img/3d.PNG)

### 3E. Keputusan

### 3F. Kesimpulan
Ambil data dari link
```
myData  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")) 
dim(myData)
head(myData)
attach(myData)
```
## Soal 4
### 4a
Buat file menjadi grup
```
myData$V1 <- as.factor(myData$V1)
myData$V1 = factor(myData$V1,labels = c("Quas","Wex", "Exort", "Quas"))

class(myData$V1)
```
Bagi value ke ketiga grup
```
group1 <- subset(myData, V1=="Quas")
group2 <- subset(myData, V1=="Wex")
group3 <- subset(myData, V1=="Exort")
```
![Screenshot](/img/4a.PNG)

## Soal 5
install dan run library yang diperlukan
```
install.packages("multcompView")
library(ggplot2)
library(multcompView)
library(readr)
library(dplyr)
```
### 5a
Buka file yang telah didownload
```
GTL <- read_csv("C:/Users/itjus/Downloads/GTL.csv")
head(GTL)
str(GTL)
```
![Screenshot](/img/5a.PNG)

Buatlah visualisasi menggunakan plotting 


```
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```
![Screenshot](/img/5ac.PNG)

### 5b
Buat variabel faktor ANOVA
```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```
Lakukan aov dengan fungsi yang tersedia
```
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
![Screenshot](/img/5b.PNG)
### 5c
Lakukan summarise dengan mean dan sd yang tersedia dari file
```
data_summary <- group_by(GTL, Glass, Temp) %>%
 summarise(mean=mean(Light), sd=sd(Light)) %>%
 arrange(desc(mean))
print(data_summary)
```
![Screenshot](/img/5c.PNG)
### 5d
Gunakan fungsi `TukeyHSD`
```
tukey <- TukeyHSD(anova)
print(tukey)
```
![Screenshot](/img/5d.PNG)
![Screenshot](/img/5dc.PNG)
### 5e
Buat compact letter display
```
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
![Screenshot](/img/5e.PNG)
Masukkan pada tabel 

```
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```

![Screenshot](/img/5ec.PNG)

