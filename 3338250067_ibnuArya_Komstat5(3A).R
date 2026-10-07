# LATIHAN SEBARAN KONTINU

# 1. Sebaran Log-Normal (Waktu Penyelesaian Modul)

#Case
#Waktu T (jam) mengikuti Log-Normal dengan meanlog = 2 dan sdlog = 0.5

#Question
#Berapa peluang insinyur membutuhkan waktu lebih dari 10 jam?

#Conclusion
mu <- 2       # meanlog
sigma <- 0.5  # sdlog

p1 <- 1 - plnorm(10, meanlog = mu, sdlog = sigma)
p1

# atau langsung:
plnorm(10, meanlog = mu, sdlog = sigma, lower.tail = FALSE)

#Ada sekitar 27.25% peluang insinyur membutuhkan waktu lebih dari 10 jam.

# Visualisasi
x <- seq(0, 40, length.out = 500)
y <- dlnorm(x, meanlog = mu, sdlog = sigma)
plot(x, y, type = "l", lwd = 2, col = "red",
     main = "Distribusi Log-Normal (meanlog=2, sdlog=0.5)",
     xlab = "Waktu (jam)", ylab = "Density")
abline(v = 10, col = "darkgreen", lwd = 2, lty = 2)
legend("topright", legend = c("PDF Log-Normal", "Ambang 10 jam"),
       col = c("red", "darkgreen"), lty = c(1,2), lwd = 2, bty = "n")


# 2. Sebaran Log-Normal (Pendapatan UMKM)

#Case
#Pendapatan bulanan UMKM ~ Log-Normal dengan meanlog = 3 dan sdlog = 0.8 (juta Rupiah)

#Question
#Berapakah nilai rata-rata (mean) ekspektasi pendapatan UMKM?

#Conclusion
mu <- 3
sigma <- 0.8

# E[X] = exp(mu + sigma^2/2)
mean_umkm <- exp(mu + sigma^2 / 2)
mean_umkm

# Verifikasi dengan simulasi
set.seed(2025)
dat <- rlnorm(100000, meanlog = mu, sdlog = sigma)
mean(dat)

#Rata-rata pendapatan UMKM sekitar 27.66 juta Rupiah per bulan.

# Visualisasi: histogram simulasi + PDF teoritis
hist(dat[dat < 150], breaks = 60, probability = TRUE,
     main = "Distribusi Log-Normal (meanlog=3, sdlog=0.8)",
     xlab = "Pendapatan (juta Rupiah)", col = "lightblue", border = "white")
x <- seq(0, 150, length.out = 500)
y <- dlnorm(x, meanlog = mu, sdlog = sigma)
lines(x, y, col = "red", lwd = 2)

# Garis vertikal untuk nilai mean
abline(v = mean_umkm, col = "darkgreen", lwd = 2, lty = 2)

legend("topright",
       legend = c("PDF Log-Normal", "Mean = 27.66"),
       col = c("red", "darkgreen"), lty = c(1,2), lwd = 2, bty = "n")


# 3. Sebaran Weibull (Umur Mikroprosesor)

#Case
#Umur komponen ~ Weibull dengan shape k = 2 dan scale lambda = 1000 jam

#Question
#Berapakah rata-rata (mean) ekspektasi umur komponen?

#Conclusion
k <- 2; lambda <- 1000

# E[T] = lambda * Gamma(1 + 1/k)
mean_weibull <- lambda * gamma(1 + 1/k)
mean_weibull

# Verifikasi dengan simulasi
set.seed(2025)
mean(rweibull(100000, shape = k, scale = lambda))

#Rata-rata umur komponen sekitar 886.23 jam.

# Visualisasi
t <- seq(0.001, 3000, length.out = 500)
plot(t, dweibull(t, shape = k, scale = lambda), type = "l", lwd = 2, col = "blue",
     main = "PDF Weibull (k=2, lambda=1000)",
     xlab = "t (jam)", ylab = "f(t)")
abline(v = mean_weibull, col = "red", lwd = 2, lty = 2)


# 4. Sebaran Student-t

#Case
#n = 6 observasi, derajat bebas v = n - 1 = 5

#Question
#Berapakah peluang P(|T| > 2)?

#Conclusion
n <- 6
v <- n - 1

# Probabilitas one-sided dan two-sided
pt(2, df = v, lower.tail = FALSE)       # P(T > 2)

2 * pt(2, df = v, lower.tail = FALSE)   # P(|T| > 2)

#Ada sekitar 10.19% peluang statistik T bernilai ekstrem (> 2 atau < -2).

x <- seq(-5, 5, by = 0.01)
y <- dt(x, df = v)
plot(x, y, type = "l", lwd = 2, main = "PDF Distribusi Student-t (df=5)",
     xlab = "t", ylab = "f(t)")
abline(v = c(-2, 2), col = "red", lty = 2, lwd = 2)


# 5. Sebaran F

#Case
#Mesin A (n1 = 8, s1^2 = 30) dan mesin B (n2 = 10, s2^2 = 20)

#Question
#Hitung p-value apakah varians mesin A lebih besar daripada mesin B

#Conclusion
n1 <- 8; n2 <- 10
s1sq <- 30
s2sq <- 20
Fstat <- s1sq / s2sq
df1 <- n1 - 1
df2 <- n2 - 1

# p-value one-sided kanan
p_value <- 1 - pf(Fstat, df1 = df1, df2 = df2)
p_value

# atau langsung:
pf(Fstat, df1 = df1, df2 = df2, lower.tail = FALSE)

#p-value sekitar 0.2795 (> 0.05), sehingga tidak cukup bukti bahwa
#varians mesin A lebih besar daripada mesin B.

# Plot PDF F(df1, df2)
x <- seq(0, 5, length.out = 500)
y <- df(x, df1 = df1, df2 = df2)
plot(x, y, type = "l", lwd = 2,
     main = paste("PDF Distribusi F (df1=", df1, ", df2=", df2, ")", sep=""),
     xlab = "x", ylab = "f(x)")
abline(v = Fstat, col = "red", lty = 2, lwd = 2)

