
# TP1

# Objectifs
# - Construire un dataframe
# - Créer des colonnes dans un dataframe
# - Sélection et filtre sur un dataframe
# - Importer et exporter un dataframe

# Exercice 1 - Utilisation d'un dataframe existant

# Exploration du dataframe iris
data(iris)
View(iris)
summary(iris)

# Nombre de lignes et de colonnes
nrow(iris)
ncol(iris)

# Noms des colonnes
colnames(iris)

# Affichage des premières lignes
head(iris)

# Sélection de certaines colonnes et lignes
iris[, c("Sepal.Length", "Species")]
iris[c(100, 103, 105), ]
iris[50:100, ]

# Calculs statistiques sur les colonnes
mean(iris$Sepal.Length)
median(iris$Sepal.Width)
sd(iris$Petal.Length)
quantile(iris$Petal.Width, probs = seq(from = 0.1, to = 0.9, by =0.1))

# Exercice 2 - Import/Exporter un dataframe

# Importation des jeux de données manga et anime
dfManga <- read.csv("manga.csv", header = TRUE, sep = ",", dec = ".")
dfAnime <- read.csv("anime.csv", header = TRUE, sep = ",", dec = ".")

# Affichage des dimensions
dim(dfManga)
dim(dfAnime)

# Calculs statistiques
mean(dfManga$Score)
mean(dfAnime$Score)
sum(dfManga$Vote)
sum(dfAnime$Vote)
sd(dfManga$Score)
sd(dfAnime$Score)
quantile(dfManga$Score, probs = seq(from = 0.1, to = 0.9, by =0.1))
quantile(dfAnime$Score, probs = seq(from = 0.1, to = 0.9, by =0.1))

# Sélection et filtrage sur les dataframes
subset(dfManga, Score > 9)
subset(dfAnime, Rating == "R - 17+ (violence & profanity)" & Score >= 8)
subset(dfAnime, !Rating %in% c("PG - Children", "G - All Ages"))

# Fusion des dataframes et exportation
dfManga$Type <- "Manga"
dfAnime$Type <- "Anime"
dfConcat <- rbind(dfManga[, c("Title", "Score", "Vote", "Ranked", "Type")], dfAnime[, c("Title", "Score", "Vote", "Ranked", "Type")])
write.table(dfConcat, file = "ExportTp1.csv", sep = ";", row.names = FALSE)
