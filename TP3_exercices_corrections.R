
# TP3

# Objectifs
# - Rappel des modules précédents

# Exercice A : Importer les données

setwd("C:/Users/Anthony/Documents/asardell/TP3")
df <- read.csv(file = "quiz.csv", sep = "\t", dec = ",")
nrow(df)
ncol(df)
summary(df)

df$Identifiant <- as.factor(df$Identifiant)
df$TD <- as.factor(df$TD)
df$TP <- as.factor(df$TP)

# Exercice B : Statistiques descriptives

mean(df$Quiz1, na.rm = TRUE)
mean(df$Quiz2, na.rm = TRUE)
mean(df$Quiz3, na.rm = TRUE)
max(df$Quiz3, na.rm = TRUE)
median(df$Quiz2, na.rm = TRUE)
quantile(df$Quiz3, probs = seq(from = 0.1, to = 0.9, by =0.1), na.rm = TRUE)
sd(df$Quiz1, na.rm = TRUE)
sd(df$Quiz2, na.rm = TRUE)
sd(df$Quiz3, na.rm = TRUE)
table(df$TP)
round(prop.table(table(df$TP)), digits = 2)

# Exercice C : Extraction

resultat <- subset(df, Quiz3 > 10)
nrow(resultat)

resultat <- subset(df, TD == "1")
nrow(resultat)

resultat <- subset(df, TP != "21")
nrow(resultat)

resultat <- subset(df, Quiz3 >= 5 & Quiz3 <= 10)
nrow(resultat)

resultat <- subset(df, Identifiant %in% c("92655100", "85947666", "75752354", "172596215", "111505723", "42690322", "20972010", "43177455"))
nrow(resultat)

resultat <- subset(df, !Identifiant %in% c("92655100", "85947666", "75752354", "172596215", "111505723", "42690322", "20972010", "43177455"))
nrow(resultat)

resultat <- subset(df, Quiz1 >= 15 | Quiz2 >= 15 | Quiz3 >= 15)
nrow(resultat)

resultat <- subset(df, is.na(Quiz1))
nrow(resultat)

resultat <- subset(df, !is.na(Quiz1) & !is.na(Quiz2) & !is.na(Quiz3))
nrow(resultat)

# Exercice D : Top et Flop

df$Moyenne <- round((df$Quiz1 + df$Quiz2 + df$Quiz3) / 3, 1)

resultat <- df[order(df$Moyenne), ]
head(resultat, n = 3)

resultat <- df[order(-df$Moyenne), ]
head(resultat, n = 3)

resultat <- df[order(df$TP, -df$Moyenne), ]
head(resultat, n = 5)

aggregate(Moyenne ~ TP, data = df, FUN = mean)

aggregate(Moyenne ~ TD + TP, data = df, FUN = function(x) c(min = min(x), mean = mean(x), max = max(x), length(x)))

# Exercice E : Traitement de données

df$Quiz1[is.na(df$Quiz1)] <- mean(df$Quiz1, na.rm = TRUE)
df$Quiz2[is.na(df$Quiz2)] <- mean(df$Quiz2, na.rm = TRUE)
df$Quiz3[is.na(df$Quiz3)] <- mean(df$Quiz3, na.rm = TRUE)

df$Moyenne_Classe <- cut(df$Moyenne, breaks = quantile(df$Moyenne, na.rm = TRUE), include.lowest = TRUE)
summary(df$Moyenne_Classe)

write.table(df, "exam_export.csv", sep = ";", dec = ",", row.names = FALSE)
