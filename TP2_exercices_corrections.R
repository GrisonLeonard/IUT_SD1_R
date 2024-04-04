
# TP2 - Rappel et cas pratique

# Objectifs
# - Importer un dataframe
# - Sélection et filtre sur un dataframe
# - Trier un dataframe

# Exercice 1 - Importer les données

df <- read.csv("fao.csv", sep=";", dec=",", header = TRUE)
class(df)

nrow(df)
summary(df)

# Exercice 2 - Statistiques descriptives

mean(df$Dispo_alim, na.rm=TRUE)
sum(df$Population, na.rm=TRUE)
sd(df$Export_viande, na.rm=TRUE)
sd(df$Import_viande, na.rm=TRUE)
median(df$Prod_viande, na.rm=TRUE)
quantile(df$Dispo_alim, na.rm=TRUE)
quantile(df$Import_viande, probs=seq(0, 1, by=0.01), na.rm=TRUE)

# Exercice 3 - Tris et filtres

df_sorted_population <- df[order(df$Population), ]
head(df_sorted_population, n=5)
df_sorted_population_desc <- df[order(-df$Population), ]
head(df_sorted_population_desc, n=5)

df_sorted_prod <- df[order(-df$Prod_viande), ]
head(df_sorted_prod, n=5)

df_sorted_import <- df[order(-df$Import_viande), ]
head(df_sorted_import, n=5)

df_high_dispo <- subset(df, Dispo_alim >= 2300)
nrow(df_high_dispo)

df_specific <- subset(df, Dispo_alim > 3500 & Import_viande >= 1000)
nrow(df_specific)

df_FR_BE <- subset(df, Nom %in% c("France", "Belgique"))

# Exercice 4 - Modifier le dataframe

df$Part_export <- df$Export_viande / df$Prod_viande
df$Dispo_alim_pays <- df$Dispo_alim * df$Population

write.table(df, "ExportTp2.csv", sep=";", row.names=FALSE)

# Exercice 5 - Corrélation

plot(df$Prod_viande, df$Export_viande, main="Production vs Exportation de viande")
cor(df$Prod_viande, df$Export_viande, use="complete.obs")

cor_matrix <- cor(df[,sapply(df, is.numeric)], use="complete.obs")
library(corrplot)
corrplot(cor_matrix, method="circle")
