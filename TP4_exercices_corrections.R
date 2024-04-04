
# TP4

# Objectifs
# - Construire des structures conditionnelles
# - Construire des boucles
# - Créer des fonctions
# - Utilisation des fonctions de test logique

# Exercice 1 - Création de fonction

# Fonction pour calculer le salaire net à partir du salaire brut
salaire_net <- function(salaire_brut, temps_travail = 1, statut = "cadre") {
  if (!is.numeric(salaire_brut) || salaire_brut <= 0) {
    stop("Le salaire brut doit être un nombre positif.")
  }
  if (!is.numeric(temps_travail) || temps_travail <= 0 || temps_travail > 1) {
    stop("Le temps de travail doit être un nombre entre 0 et 1.")
  }
  if (!(statut %in% c("cadre", "non cadre"))) {
    stop("Le statut doit être 'cadre' ou 'non cadre'.")
  }
  taux = ifelse(statut == "cadre", 0.75, 0.78)
  salaire_net_avant_impot = salaire_brut * taux * temps_travail
  return(salaire_net_avant_impot)
}

# Exemple d'utilisation de la fonction salaire_net
print(salaire_net(salaire_brut = 3000, temps_travail = 0.8, statut = "non cadre"))

# Exercice 2 - Création des boucles

# Boucle for pour parcourir un vecteur et calculer la somme cumulative
vecteur <- 1:5
somme_cumulative <- 0
for (i in vecteur) {
  somme_cumulative <- somme_cumulative + i
  print(somme_cumulative)
}

# Boucle while pour simuler un jeu simple
continuer <- TRUE
while (continuer) {
  reponse <- as.integer(readline(prompt = "Devinez un nombre entre 1 et 10: "))
  if (reponse == sample(1:10, 1)) {
    print("Bravo, vous avez trouvé le bon nombre !")
    continuer <- FALSE
  } else {
    print("Essaie encore !")
  }
}

# Exercice 3 - GOAT : Cas pratiques

# Fonction shifumi pour jouer contre l'ordinateur
shifumi <- function() {
  choix <- c("pierre", "papier", "ciseaux")
  choix_joueur <- tolower(readline(prompt = "Votre choix (pierre, papier, ciseaux): "))
  choix_ordi <- sample(choix, 1)
  print(paste("L'ordinateur choisit:", choix_ordi))
  if (choix_joueur == choix_ordi) {
    return("Égalité!")
  } else if ((choix_joueur == "pierre" && choix_ordi == "ciseaux") ||
             (choix_joueur == "papier" && choix_ordi == "pierre") ||
             (choix_joueur == "ciseaux" && choix_ordi == "papier")) {
    return("Vous gagnez!")
  } else {
    return("L'ordinateur gagne!")
  }
}

# Exemple d'utilisation de la fonction shifumi
shifumi()
