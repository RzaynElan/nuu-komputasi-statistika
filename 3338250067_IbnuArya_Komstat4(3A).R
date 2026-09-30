# TUGAS DISTRIBUSI PELUANG

# 1. Sebaran Poisson

# Rata-rata pelanggan datang = 3 orang per jam
lambda <- 3

# P(X >= 5)
P_X_ge_5 <- 1 - ppois(4, lambda)
P_X_ge_5

# PMF Poisson
x <- 0:15
pmf <- dpois(x, lambda)

plot(x, pmf, type='h', lwd=3,
     main='Poisson(lambda=3)',
     xlab='Jumlah pelanggan',
     ylab='P(X=x)')


# 2. Sebaran Hypergeometrik

# Total bola = 100
# Bola merah = 20
# Sampel = 10

N <- 100
K <- 20
n <- 10

# Domain k
k <- seq(from = max(0, n + K - N),
         to = min(n, K))

# PMF: P(X = k)
pmf <- dhyper(k, m = K, n = N - K, k = n)

data.frame(k = k, P = pmf)

# Plot PMF
plot(k, pmf, type = "h", lwd = 3,
     main = paste0("Hypergeometric(N=",N,", K=",K,", n=",n,")"),
     xlab = "k (banyak bola merah dalam sampel)",
     ylab = "P(X=k)")


# 3. Sebaran Binomial

n <- 15
p <- 0.4
m <- 1000

# Simulasi 1.000 percobaan
set.seed(2025)
simulasi <- rbinom(m, size=n, prob=p)

# PMF teoritis
x <- 0:n
pmf <- dbinom(x, size=n, prob=p)

# Histogram hasil simulasi
hist(simulasi,
     breaks = seq(-0.5, 15.5, by=1),
     probability = TRUE,
     main = "Simulasi Binomial",
     xlab = "Jumlah sukses",
     ylab = "Probabilitas")

# PMF teoritis
points(x, pmf, type="h", lwd=3)
points(x, pmf, pch=19)

# Rata-rata simulasi
mean(simulasi)

# Rata-rata teoritis
n * p
