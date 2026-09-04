#Tugas Komputasi Statistika

#Vektor Numeric(Desimal/Pecahan)
v_num <- c(11.5,5.5,-0.5,3.14)

#Vektor Integer(Bulat)
v_int <- c(1L,-2,0,5,100L)

#Vektor Logical
v_log <- c(TRUE,FALSE,TRUE)

#Vektor Character
v_char <- c("Tugas","Komputasi","Statistika")

v_num
v_int
v_log
v_char

#Matrix 4x3
m <- matrix(1:12,nrow = 4,ncol = 3)
m
#Array 4 Dimensi(Ada Lapisan)
x <- array(1:12,dim = c(2,3,4))
x

#Data Frame
df <- data.frame(
  Lagu = c("Blue","Senorita","Perfect","Dandelions"),
  Rilis = c("12","13","14","15"),
  Original = c(TRUE,TRUE,TRUE,TRUE)
)
df

#List
listku <- list(
  angka = c(3,1,4),
  mat = matrix(1:4,nrow = 2),
  df = data.frame(NO = 1:2, Pesanan = c(1123,1134)),
  
  list_dlm = list(
    kota = "cilegon",
    status = TRUE,
    note = c("proses", "selesaiiiii")
  )
)
listku

listku$mat
listku$angka
listku$list_dlm
