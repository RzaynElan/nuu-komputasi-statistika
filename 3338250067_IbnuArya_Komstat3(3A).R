# 3338250067 IbnuAR
# ANALISIS DATA AIRQUALITY

# 1. Membuka data airquality
data(airquality)

# Melihat beberapa data awal
head(airquality)

# Melihat struktur data
str(airquality)

# Melihat ringkasan data
summary(airquality)


# 2. HISTOGRAM WIND + DENSITY

hist(airquality$Wind,
     breaks = 10,
     probability = TRUE,
     xlab = "Wind",
     ylab = "Density",
     main = "Histogram + Density Curve")

# Menghitung density
dens <- density(airquality$Wind)

# Menambahkan kurva density
lines(dens,
      col = "blue",
      lwd = 2)


# 3. BOXPLOT WIND

boxplot(airquality$Wind,
        horizontal = TRUE,
        main = "Boxplot Kecepatan Angin (Wind)",
        xlab = "Wind")


# 4. STEM-AND-LEAF WIND


# Menghilangkan data kosong
wind <- na.omit(airquality$Wind)

# Membuat stem-and-leaf
stem(wind)


# 5. SCATTER PLOT WIND DAN OZONE

plot(Ozone ~ Wind,
     data = airquality,
     pch = 16,
     main = "Scatter Plot Wind terhadap Ozone",
     xlab = "Kecepatan Angin (Wind)",
     ylab = "Kadar Ozone")