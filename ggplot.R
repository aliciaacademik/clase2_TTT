library(dplyr)
library(ggplot2)
library(tidyverse)
library(dslabs)
library(NHANES)
data(murders)
data(NHANES)
data(na_example)
mean(na_example)
sd(na_example)
mean(na_example, na.rm = TRUE)
mean(na_example, na.rm = "TRUE")
sd(na_example, na.rm = TRUE)
sd(na_example, na.rm = "TRUE")

###########  ggplot2 dispersion ########
#data
#geometry
# mapes: x = population
# y = murdes 
# asterics mapping
# scale
# style

# arg 1 = k data assoc w obj

ggplot(data = murders)
p <- ggplot(data = murders)
class(p)
print(p)

murders |> ggplot() +
  geom_point(aes(x = population/10^6, y = total))

p + geom_point(aes(population/10^6, total)) +
  geom_text(aes(population/10^6, total, label = abb))


p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb))


p + geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1.5)


p + geom_point(size = 3) +
  geom_text(aes(x = 10, y = 800, label = "Hello there!"))


data(heights)

p <- murders |> ggplot()

p <- heights |> ggplot()


str(murders)

p <- murders |> ggplot(aes(population/10^6, total))
p
murders |> ggplot(aes(population/10^6, total)) +
  geom_point()

murders |> ggplot(aes(total, population/10^6, label = abb)) +
  geom_label(aes(total, population/10^6, label = abb))

murders |> ggplot(aes(total, population/10^6, label = abb)) +
  geom_label(color = "blue")

murders |> ggplot(aes(total, population/10^6, label = abb, colour = region)) +
  geom_label()

p <- murders |> ggplot(aes(population/10^6, total, label = abb, colour = region)) +
  geom_label()
p

p + scale_x_log10() + scale_y_log10()

p + ggtitle("Gun murder data")



######### histogram  #################
data(heights)

geom_histogram()

p <- heights |> ggplot(aes(height))
p + geom_histogram()
p + geom_histogram(binwidth = 1)

heights |>
  ggplot(aes(height)) +
  geom_histogram()

######### Densidad suavizada ######
heights |>
  ggplot(aes(height)) +
  geom_density()

# asignar grupos 
heights |>
  ggplot(aes(height, group = sex)) +
  geom_density()

# diferente color para grupos
heights |>
  ggplot(aes(height, colour = sex)) +
  geom_density()

# asignar grupos con argumento fill
heights |>
  ggplot(aes(height, fill = sex)) +
  geom_density()
# la segunda densidad se dibuja encima

heights |>
  ggplot(aes(height, fill = sex)) +
  geom_density(alpha = 0.2)


######### Practica GAPMINDER ########
str(NHANES)
head(NHANES)

tab <- NHANES |>
  filter(Gender == "female" & AgeDecade == " 20-29")
head(tab)

M <- mean(tab$BPSysAve, na.rm = TRUE)
M
S <-sd(tab$BPSysAve, na.rm = TRUE)
S
ref <- c(M, S)
ref

#### Resumiendo promedios y pull
tab <- NHANES |>
  filter(Gender == "female" & AgeDecade == " 20-29")


ref <- tab |>
  summarize(avg = mean(BPSysAve, na.rm = TRUE), stdv = sd(BPSysAve, na.rm = TRUE))
ref

ref_avg <- ref |> pull(avg)
ref_avg

### Min & max
Pres_M <- NHANES |>
  filter(Gender == "female" & AgeDecade == " 20-29") |>
  summarize(minbp = min(BPSysAve, na.rm = TRUE), maxbp = max(BPSysAve, na.rm = TRUE))
Pres_M


### group by

# mujeres
BPS_Age_F <- NHANES |>
  filter(Gender == "female") |>
  group_by(AgeDecade) |>
  summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
 BPS_Age_F


length(BPS_Age$AgeDecade == "NA") 

# hombres
BPS_Age_M <- NHANES |>
  filter(Gender == "male") |>
  group_by(AgeDecade) |>
  summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
BPS_Age_M


# edad y genero
BPS_Age_sx <- NHANES |>
  group_by(AgeDecade, Gender) |>
  summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))
BPS_Age_sx


### arrange
# ordenar resultado segun una variable o resultado dado
# ejemplo de orden por presion arterial
NHANES %>% arrange(BPSysAve) #ascendente
NHANES |> arrange(desc(BPSysAve))  # descendente

# ordena por edad y luego por genero
NHANES |> arrange(Age, Gender)
NHANES |> arrange(desc(Age), desc(Gender))

# diferencias por raza y edad para hombres
NHANES |>
  filter(Gender == "male") |>
  group_by(AgeDecade, Race1) |>
  summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE)) |>
  arrange(average)





