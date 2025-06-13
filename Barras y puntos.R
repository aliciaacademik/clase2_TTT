library(ggplot2)
library(dslabs)
data(mtcars)
head(mtcars)
str(mtcars)
names(mtcars)

mtcars_filtrado <- mtcars[complete.cases(mtcars), ]
grafico <- ggplot(mtcars_filtrado, aes(x= rownames(mtcars_filtrado), y = mpg, fill = factor(cyl))) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_hline(yintercept = 10, linetype = "dashed", color = "red")
  geom_text(aes(label = mpg), vjust = -.5 color = "black", size = 3) +
  labs(title = "Millas por galon por modelo",
       x="modelo de auto",
       y="Millas por galón")+
  theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_fill_manual(values = c("red","blue","green"))
print(grafico)

grafico2<-ggplot(mtcars, aes(x=reorder(rownames(mtcars_filtrado), -mpg), y = mpg, fill = factor(cyl)))+
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_text(aes(label = mpg), vjust = -0.5, color = "black", size = 3) +  #etiquetar barras
  labs(title = "Grafico de barras ordenado por millas por galon",
       x="modelo de auto",
       y="Millas por galón",
       fill = "cilindros")+
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) #rotar etiquetas eje x

print(grafico2)

#ggplot abrimos data, ejes
ggplot(mtcars, aes(x=reorder(rownames(mtcars_filtrado), -mpg), y = mpg, fill = factor(cyl)))+
  geom_bar(stat = "identity", position = "dodge", color = "black")+
  geom_text(aes(label = mpg), vjust=-0.5, color="white", size=3) +
  labs(title = "Grafico de barras ordenado por millas por galon",
       x="modelo de auto",
       y="millas por galon",
       fill = "cilindros") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 4, hjust = 1),
        panel.grid.major = element_blank(),  #elemina lineas de cuadricula principal
        panel.grid.minor = element_blank(), #elimina lineas de cuadricula secundaria
        panel.background = element_blank(), #elimina fondo del panel
        axis.line = element_line(color="black"),  #añade linea de ejes
        legend.position = "bottom",   #mover leyenda a parte inferior
        legend.title = element_text(size = 10, face = "bold"), #estilo de titulo de leyenda
        )

#ordenado de menor a mayor (mpg) en lugar de -mpg
ggplot(mtcars, aes(x=reorder(rownames(mtcars_filtrado), mpg), y = mpg, fill = factor(cyl)))+
  geom_bar(stat = "identity", position = "dodge", color = "black")+
  geom_text(aes(label = mpg), vjust=-0.5, color="white", size=3) +
  labs(title = "Grafico de barras ordenado por millas por galon",
       x="modelo de auto",
       y="millas por galon",
       fill = "cilindros") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 4, hjust = 1),
        panel.grid.major = element_blank(),  #elemina lineas de cuadricula principal
        panel.grid.minor = element_blank(), #elimina lineas de cuadricula secundaria
        panel.background = element_blank(), #elimina fondo del panel
        axis.line = element_line(color="black"),  #añade linea de ejes
        legend.position = "bottom",   #mover leyenda a parte inferior
        legend.title = element_text(size = 10, face = "bold"), #estilo de titulo de leyenda
  )


#demostración final
install.packages("gridExtra")
library(dslabs)
library(ggplot2)
library(dplyr)
library(gridExtra)



#dimensigridExtra#dimensiones de 3 especies de flores diferentes
# grafico de barras para comparar longitud de sepalos por especie
# diagrama de dispersion con puntos jittered para mostrar distribucion

data("iris")
head(iris)
plot_sepals <- iris|>
  ggplot(aes(x=Species, y=Sepal.Length, fill = Species))+
  geom_bar(stat = "identity", position="dodge", alpha=0.7) + #dodge para que no se superpongan, que hay espacio entre ellas #alpha es para trnasparencia
  labs(title = "Comparación de longitud de sépalos por especie",
       x="Especie",
       y="Longitud de sépalo") +
  theme_minimal()

plot_sepals

#grafico de petalos

plot_petals <- iris |>
  ggplot(aes(x=Species, y=Petal.Length, color=Species))+
  geom_jitter(alpha = 0.7) +  #grafico de puntos
  labs(title = "Distribución de longitud de pétalos por especie",
       x="Especie",
       y="Longitud de pétalos"+
  theme_classic()
  )
plot_petals

grid.arrange(plot_sepals, plot_petals, ncol=1)

install.packages("patchwork")
library(patchwork)

plot_sepals / plot_petals
