# panggil data iris
data(iris)

# Menampilkan Sepal.Length
iris$Sepal.Length


# Tipe data setiap kolom
sapply(iris, class)


# Membuat variabel turunan
iris$turunan <- ifelse(
  iris$Sepal.Width > 3,
  "Besar",
  "Kecil"
)
head(iris)

# Mengubah turunan menjadi sepal
names(iris)[names(iris) == "turunan"] <- "sepal"


# Mengambil data sepal Besar
# dari species virginica
data_virginica <- iris[
  iris$sepal == "Besar" &
    iris$Species == "virginica",
]

data_virginica


# Menghitung jumlah species
table(iris$Species)


# Memecah data menjadi 3 data frame
data_setosa <- iris[iris$Species == "setosa", ]

data_versicolor <- iris[
  iris$Species == "versicolor",
]

data_virginica <- iris[
  iris$Species == "virginica",
]


# Mengurutkan berdasarkan Sepal.Width
data_setosa <- data_setosa[
  order(data_setosa$Sepal.Width),
]

data_versicolor <- data_versicolor[
  order(data_versicolor$Sepal.Width),
]

data_virginica <- data_virginica[
  order(data_virginica$Sepal.Width),
]


# Melihat hasil akhir
head(data_setosa)
head(data_versicolor)
head(data_virginica)