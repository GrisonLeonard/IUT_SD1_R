
# TD1

# Objectifs
# - Prendre en main le logiciel RStudio
# - Se familiariser avec les commandes de base de R
# - Utiliser des scripts et mettre des commentaires
# - Manipuler des vecteurs
# - Calculer des statistiques descriptives

# Exercice 1 - Les objets et les vecteurs

# Mémo pour Exercice 1

# Création des objets a et b
a <- 10
b <- 5

# Multiplication de a et b, et affichage du résultat
resultat <- a * b
print(resultat)

# Création des objets A et B, sensibilité à la casse
A <- 7.2
B <- 10.1
print("Le langage R est sensible à la casse (majuscule/minuscule)")

# Addition de A et B, et remplacement de la valeur de resultat
resultat <- A + B
print(resultat)
print("La précédente valeur de resultat a été supprimée et remplacée par la somme de A et B.")

# Suppression de tous les objets
rm(list = ls())

# Exercice 2 - Fonctions usuelles

# Création de vecteurs et manipulation
v1 <- 1:5
v2 <- v1 + 3
v3 <- 1:6
v4 <- v3^2
v5 <- v4 / 2

# Affichage de classes pour différents types de vecteurs
vecteur_jours <- c("Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche")
print(class(vecteur_jours))

vecteur_bool <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
print(class(vecteur_bool))

# Génération de séquences et calcul de leur longueur
ma_sequence <- seq(from = 1, to = 10)
print(length(ma_sequence))

# Répétition d'éléments dans un vecteur
vecteur_rep <- rep(3, times = 5)
print(vecteur_rep)

# Suppression des vecteurs créés
rm(list = ls())

# Exercice 3 - Fonctions statistique univariées et simulation

# Génération d'échantillons aléatoires et calcul de statistiques
vecteur_unif <- runif(n = 5, min = 0, max = 1)
print(vecteur_unif)
print(mean(vecteur_unif))
print(median(vecteur_unif))
print(min(vecteur_unif))
print(max(vecteur_unif))

# Génération d'un échantillon suivant une distribution normale
echantillon_norm <- rnorm(n = 20, mean = -2, sd = 3)
print(mean(echantillon_norm))
print(sd(echantillon_norm))
hist(echantillon_norm)

# Arrondissement de valeurs et calcul de la masse salariale
salaires <- rnorm(n = 3000, mean = 2400, sd = 300)
salaires_arrondis <- round(salaires, 2)
masse_salariale <- sum(salaires_arrondis)
print(masse_salariale)

# Simulation d'un lancé de dé
simulation_de <- sample(x = c(1,2,3,4,5,6), size = 100000, replace = TRUE)
frequence_de <- prop.table(table(simulation_de))
print(sort(frequence_de, decreasing = TRUE))

