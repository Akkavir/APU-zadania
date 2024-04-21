# (a)
a <- 2 * exp(5)
b <- 2 * a

sprawdz <- function(x, y) {
  if (x > y) {
    print("Wartość zmiennej x jest większa.")
  } else if (y > x) {
    print("Wartość zmiennej y jest większa.")
  } else {
    print("Obie zmienne są równe.")
  }
}

sprawdz(a, b)

# (b)
?sum

# (c)
a <- 15:25
suma_a <- sum(a)
print(paste("Suma liczb w wektorze a:", suma_a))

# (d)
apropos("sum")

# (e)
setwd("C:\\\\Users\\\\ath\\\\Desktop\\\\Rz1")
a <- "ABCDEFGH"
write(a, file = "zmienna_a.txt")
rm(a)  # usunięcie zmiennej a
print(a)  
a <- readLines("zmienna_a.txt")  
print(a)  

# (f)
install.packages("gridExtra")
library(gridExtra)
?grid.arrange

# (g)
wektor_g <- seq(100, 20, by = -4)
print(wektor_g)

# (h)
a <- 9:5
b <- 11:16
d <- c(b, a)
print(d)

# (i)
nazwa <- c("Samsung 1", "Samsung 2", "Samsung 3", "Samsung 4", "Samsung 5", "Samsung 6", "Samsung 7", "Samsung 8", "Samsung 9", "Samsung 10")
wyświetlacz <- c(6.2, 6.5, 6.1, 6.4, 6.0, 6.3, 6.5, 6.2, 6.4, 6.6)
pamiec_RAM <- c(4, 8, 6, 6, 4, 6, 8, 6, 8, 6)
pamiec_wbudowana <- c(64, 128, 64, 128, 64, 128, 256, 128, 256, 128)
aparat_foto <- c(48, 64, 48, 64, 48, 64, 108, 64, 108, 48)
cena <- c(800, 1000, 900, 1100, 700, 1200, 1300, 1000, 1400, 900)
liczba_opinii <- c(200, 150, 180, 220, 250, 190, 170, 230, 160, 210)

smartfony <- data.frame(nazwa, wyświetlacz, pamiec_RAM, pamiec_wbudowana, aparat_foto, cena, liczba_opinii)
srednia_cena <- mean(smartfony$cena)
print(paste("Średnia cena smartfonów:", srednia_cena))

# (j)
nowy_smartfon <- data.frame(nazwa = "Samsung 11", 
                            wyświetlacz = 6.7, 
                            pamiec_RAM = 8, 
                            pamiec_wbudowana = 256, 
                            aparat_foto = 108, 
                            cena = 1500, 
                            liczba_opinii = 180)

smartfony <- rbind(smartfony, nowy_smartfon)
nowa_srednia_cena <- mean(smartfony$cena, na.rm = TRUE)  
print(paste("Nowa średnia cena smartfonów po dodaniu nowego:", nowa_srednia_cena))


# (k)
smartfony$ocena_klientow <- seq(0, 5, by = 0.5)
srednie_ceny_ocen <- tapply(smartfony$cena, smartfony$ocena_klientow, mean)
print(srednie_ceny_ocen)

# (l) Dodanie kolejnych 4 smartfonów do ramki danych
nowe_smartfony <- data.frame(nazwa = c("Samsung 12", "Samsung 13", "Samsung 14", "Samsung 15"),
                             wyświetlacz = c(6.4, 6.3, 6.5, 6.2),
                             pamiec_RAM = c(8, 6, 8, 6),
                             pamiec_wbudowana = c(256, 128, 256, 128),
                             aparat_foto = c(108, 64, 108, 64),
                             cena = c(1600, 1300, 1700, 1400),
                             liczba_opinii = c(0, 180, 220, 190),
                             ocena_klientow = c(4.5, 3.5, 4, 3.5))

smartfony <- rbind(smartfony, nowe_smartfony)

# Narysowanie wykresu słupkowego liczebności reprezentantów każdej z ocen klientów
barplot(table(smartfony$ocena_klientow), 
        main = "Liczebność reprezentantów każdej z ocen klientów",
        xlab = "Ocena klientów", ylab = "Liczba smartfonów")



# (m)
pct <- prop.table(table(smartfony$ocena_klientow)) * 100
pie(pct, labels = paste(names(pct), "(", round(pct, 1), "%)"))

# (n)
smartfony$status_opinii <- cut(smartfony$liczba_opinii, breaks = c(-Inf, 0, 50, 100, Inf), labels = c("nie ma", "mniej 50 opinii", "50-100 opinii", "więcej 100 opinii"))
smartfony$status_opinii <- as.factor(smartfony$status_opinii)
barplot(table(smartfony$status_opinii), main = "Procentowy udział smartfonów w zależności od statusu opinii")

# (o)
zdania <- paste(smartfony$`nazwa`, "ma ocenę klientów", smartfony$`ocena_klientow`, "bo ma liczbę opinii", smartfony$`liczba_opinii`)
print(zdania)

# (p)
write.csv(smartfony, file = "smartfony.csv", row.names = FALSE)
smartfony <- read.csv("smartfony.csv")
