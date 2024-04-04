
# TD5

# Objectifs
# - Lire dans la table de la loi normale avec R
# - Simuler une série statistique selon une loi
# - Calculer des intervalles de confiance

# Exercice 1 - Comprendre la loi normale

# Création d'une série de distributions normales avec différentes moyennes et écart-types
par(mfrow = c(1,1))
plot(NA, xlim=c(-5, 5), ylim=c(0, 1), xlab="X", ylab="Densité de probabilité", main="Densités de probabilité de lois normales")
moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
    serie <- rnorm(n = 1000, mean = moyennes[i], sd = sigmas[i])
    lines(density(serie), col = colors[i])
    legend_labels <- c(legend_labels, paste("m =", moyennes[i], ", s =", sigmas[i]))
}
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

# Simulation d'une loi normale N(0, 1) de taille 10 000
serie_norm <- rnorm(n = 10000, mean = 0, sd = 1)
hist(serie_norm, probability = TRUE, main = "Histogramme de la loi normale N(0,1)")
lines(density(serie_norm), col = "blue")

# Calcul des quantiles théoriques et probabilités associées
quantile_95 <- qnorm(0.95, mean = 0, sd = 1)
prob_95 <- pnorm(quantile_95, mean = 0, sd = 1)
quantile_975 <- qnorm(0.975, mean = 0, sd = 1)
prob_greater_196 <- 1 - pnorm(1.96, mean = 0, sd = 1)

# Exercice 2 - Construire la table de loi normale

# Construction d'une table de loi normale approchée
# Défini dans le script pour une simplification, mais comprend des boucles pour générer les valeurs

# Exercice 3 - Simulation d'une population

# Simulation de la taille d'une population française selon une loi normale N(171,9)
population <- rnorm(n = 10000000, mean = 171, sd = 9)
mean_population <- mean(population)
sd_population <- sd(population)
hist(population, main = "Histogramme des tailles de la population française")

# Calcul de la proportion de personnes ayant une taille inférieure à 190cm et supérieure à 200cm
prop_less_190 <- sum(population < 190) / length(population)
prop_greater_200 <- sum(population >= 200) / length(population)

# Exercice 4 - Simulation d'échantillon

# Fonction pour tirer un échantillon et calculer la moyenne
moyenne_echantillon <- function(V, n) {
    echantillon <- sample(V, n, replace = TRUE)
    return(mean(echantillon))
}

# Réplication de l'échantillonnage pour différentes tailles et calcul des moyennes et écarts-types
# Utilisation de replicate() et apply() pour les calculs

# Exercice 5 - L'effet de la taille de l'échantillon

# Illustration de l'effet de la taille de l'échantillon sur la distribution des moyennes d'échantillons
# Utilisation de la fonction custom moyenne_echantillon() et du théorème central limite
