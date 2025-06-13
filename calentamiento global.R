library(tidyverse)
library(dplyr)
library(tidyr)
library(dslabs)
library(ggplot2)
data("temp_carbon")
data("greenhouse_gases")
data("historic_co2")
names(temp_carbon)
names(greenhouse_gases)
names(historic_co2)
levels(temp_carbon$year)
str(temp_carbon)

#el ultimo año
temp_carbon |> filter(!is.na(carbon_emissions)) |> pull(year)|> max()
temp_carbon |> .$year |> max()
temp_carbon |> filter(!is.na(carbon_emissions)) |> select(year)|> max()
temp_carbon |> filter(!is.na(carbon_emissions)) |> .$year |> max()
temp_carbon |> filter(!is.na(carbon_emissions)) |> max(.$year)

# diferencia en emisiones Carbono
temp_carbon |> filter(!is.na(carbon_emissions)) |> pull(year)
temp_carbon |> filter(!is.na(carbon_emissions)) |> pull(year)|> min()

temp_carbon |> filter(!is.na(carbon_emissions), year == 1951) 
temp_carbon |> filter(!is.na(carbon_emissions), year == 2014) 
9855-1767
1767+8088

# anomalia temp global
temp_carbon |> filter(!is.na(temp_anomaly)) |> pull(year) |>max() #1880
temp_carbon |> filter(!is.na(temp_anomaly)) |> pull(year)|> min() #2018

temp_carbon |> filter(!is.na(temp_anomaly), year == 1880) 
temp_carbon |> filter(!is.na(temp_anomaly), year == 2018) 
.82 - -.11
-.11 + .93

# grafico de linea de series temporales 
# cambio de titulos en ejes y coordenadas
ggplot(temp_carbon, aes(year, temp_anomaly, !is.na(year)))+
  geom_point()+
  geom_hline(aes(yintercept = 0),col="blue")+ #hline linea horizontal
  ylab("anomalia") +
  ggtitle("Anomalia relativa")+
  geom_text(aes(x=2000, y = -0.05, label = "Media siglo xx"), col="red") #coordenadas del texto hline
  

#pone la etiqueta eje y y borra escalas
ggplot(temp_carbon, aes(year, temp_anomaly, !is.na(year)))+
  geom_point()+
  geom_hline(aes(yintercept = 0),col="blue")+ #hline linea horizontal
  ylim("anomalia") +
  ggtitle("Anomalia relativa")+
  geom_text(aes(x=2000, y =0.05, label = "Media siglo xx"), col="red")


# buscar por sucesos en años especificsos, cambiar escala x
ggplot(temp_carbon, aes(year, temp_anomaly, !is.na(year)))+
  geom_point()+
  geom_hline(aes(yintercept = 0),col="blue")+ #hline linea horizontal
  ylab("anomalia") +
  ggtitle("Anomalia relativa")+
  geom_text(aes(x=2000, y = -0.05, label = "Media siglo xx"), col="red") +
  scale_x_continuous(limits = c(1870,2030), breaks = seq(1850, 2030, by =10)) #iniciando en 1820 hasta 2030 de 20 en 20 años

#agregar capas: lineas de anomalia temp oceano y tierra
ggplot(temp_carbon, aes(year, temp_anomaly, !is.na(year)))+
  geom_point()+
  geom_hline(aes(yintercept = 0),col="blue")+ #hline linea horizontal
  ylab("anomalia") +
  ggtitle("Anomalia relativa")+
  geom_text(aes(x=2000, y = -0.05, label = "Media siglo xx"), col="red") +
  geom_text(aes(x=1990, y = 0.3, label="Anomalia temp oceano")) +
  scale_x_continuous(limits = c(1870,2030), breaks = seq(1850, 2030, by =10)) #iniciando en 1820 hasta 2030 de 20 en 20 años


ocean <- ggplot(temp_carbon, aes(year, ocean_anomaly, !is.na(year)))+
  geom_point(color = "orange")+
  geom_hline(aes(yintercept = 0),col="blue")+ #hline linea horizontal
  ylab("anomalia oceano") +
  ggtitle("Anomalia relativa")+
  geom_text(aes(x=2000, y = -0.05, label = "Media siglo xx"), col="red")+ #coordenadas del texto hline
  scale_x_continuous(limits = c(1870,2030), breaks = seq(1850, 2030, by =10))
land <- ggplot(temp_carbon, aes(year, land_anomaly, !is.na(year)))+
  geom_point(color = "green")+
  geom_hline(aes(yintercept = 0),col="blue")+ #hline linea horizontal
  ylab("anomalia TIERRA") +
  ggtitle("Anomalia relativa")+
  geom_text(aes(x=2000, y = -0.05, label = "Media siglo xx"), col="red") +#coordenadas del texto hline
  scale_x_continuous(limits = c(1870,2030), breaks = seq(1850, 2030, by =10))
temp <- ggplot(temp_carbon, aes(year, temp_anomaly, !is.na(year)))+
  geom_point(color = "blue")+
  geom_hline(aes(yintercept = 0),col="blue")+ #hline linea horizontal
  ylab("anomalia TEMP") +
  ggtitle("Anomalia relativa")+
  geom_text(aes(x=2000, y = -0.05, label = "Media siglo xx"), col="red") +
  scale_x_continuous(limits = c(1870,2030), breaks = seq(1850, 2030, by =10))
ocean
land
temp

ggplot(aes(x=ocean, y=land))+
  geom_jitter(alpha = 0.7)  #grafico de puntos
tres<- data.frame(
  valor=c(temp_carbon$temp_anomaly, temp_carbon$land_anomaly, temp_carbon$ocean_anomaly),
  tipo = rep(c("Temp","tierra","aire"), each=length(temp_carbon$temp_anomaly))

  #grafica con las 3 temperaturas
set.seed(123) # hace que los resultados aleatorios sean reproducibles.
  
df<-data.frame(
    año = temp_carbon$year,
    tierra = temp_carbon$land_anomaly,
    oceano = temp_carbon$ocean_anomaly,
    global = temp_carbon$temp_anomaly
  )
df_long <- df |>
  pivot_longer(cols = c(tierra, oceano, global),
               names_to = "tipo",
               values_to = "temperatura")
ggplot(df_long, aes(x=año, y = temperatura, color =tipo))+
  geom_point()+
  scale_x_continuous(limits = c(1870,2030), breaks = seq(1850, 2030, by =10))+
  labs(title = "temperaturas den diferentes años por tipo",
       x = "año",
       y = "temperatura")

# grafico lineas de concentracion de eje por año
# faceta x gas, alineadno verticalmente 
# linea vertical con x-intercepto en 1850 inicio de rev industrial
# ppb unidades p ch4 y n2o, p CO2 son ppm
names(greenhouse_gases)

greenhouse_gases |>
  ggplot(aes(year, concentration))+
  geom_line()+
  facet_grid(~gas, scales = "free")+
  geom_vline(aes(xintercept = 1980), color="red", size = 0.3)
  ylab("Concentración de gases de efecto invernadero atmosférico por año, 0-2000")

#iniciando en 1750
greenhouse_gases |>
  ggplot(aes(year, concentration))+
  geom_line()+
  facet_grid(~gas, scales = "free")+
  geom_vline(aes(xintercept = 1980), color="red", size = 0.5)+
  scale_x_continuous(limits = c(1750,2030))+
  scale_y_continuous(breaks = seq(200, 1750, by =50))+
  ylab("Concentración de gases de efecto invernadero atmosférico por año, 0-2000")

#grafico de linea de series temporales de emicion de C
# eje y = toneladas metricas por año
temp_carbon |>
  ggplot(aes(year, carbon_emissions))+
  geom_line(size = 1.5, color = "violet")+
  scale_x_continuous(limits = c(1850,2030), breaks = seq(1850,2030, by = 20))
                     
                     
# grafico de liena de concentrac CO2 en el tiempo,
# coloreado por fuente de medicion
names(historic_co2)

co2_time <- historic_co2 |>
  ggplot(aes(year, co2, color = source))+
  geom_line(size = 1)+
  scale_x_continuous(limits = c(-800000, -775000))       ###, breaks = seq(2018,-803182, by = 10000))
co2_time
co2_time <- historic_co2 |>
  ggplot(aes(year, co2, color = source))+
  geom_line(size = 1)+
  scale_x_continuous(limits = c(-375000, -330000)) 

co2_time <- historic_co2 |>
  ggplot(aes(year, co2, color = source))+
  geom_line(size = 1)+
  scale_x_continuous(limits = c(-3000, 2018)) 

co2_time <- historic_co2 |>
  ggplot(aes(year, co2, color = source))+
  geom_line(size = 1)+
  scale_x_continuous(limits = c(-140000, -120000)) 
co2_time
head(co2)

historic_co2 |> filter(!is.na(co2)) |> pull(year) |> max()
historic_co2 |> filter(!is.na(co2)) |> pull(year) |> min()