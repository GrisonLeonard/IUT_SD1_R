
# TP5

# Objectifs
# - Construire des jointures
# - Utiliser SQLite
# - Interroger une base de données

library(DBI)
library(RSQLite)
library(tools)

# Exercice 1 - Importer les données

# Changer le répertoire de travail
setwd("C:/Users/Anthony/Documents/asardell/IUT_SD1/dataset/nba")

# Lister tous les fichiers CSV dans le dossier
fichiers <- list.files(pattern = "\.csv$", full.names = TRUE)

# Boucle pour importer tous les fichiers CSV et les affecter à des dataframes
for (fichier in fichiers) {
    nom_fichier_sans_extension <- file_path_sans_ext(basename(fichier))
    assign(nom_fichier_sans_extension, read.csv(fichier))
}

# Exercice 2 - Les jointures

# Jointure entre les tables team et game
df_team <- subset(team, city == "Los Angeles")
df_game <- subset(game, select = c("game_id", "team_id_home"))
df_jointure <- merge(df_team, df_game, by.x = "id", by.y = "team_id_home")

# Calcul de l'affluence moyenne des matchs joués à Los Angeles
df_game_info <- subset(game_info, select = c("game_id", "attendance"))
df_jointure_attendance <- merge(df_jointure, df_game_info, by = "game_id")
mean_attendance <- mean(df_jointure_attendance$attendance, na.rm = TRUE)

# Nombre d'arbitres différents ayant officié durant la saison 2020
df_game_summary_2020 <- subset(game_summary, season == 2020)
df_officials_2020 <- merge(df_game_summary_2020, officials, by = "game_id")
n_distinct_officials <- length(unique(df_officials_2020$official_id))

# Exercice 3 - GOAT : Connexion à une database SQLite

# Connexion à la base de données SQLite
conn <- dbConnect(RSQLite::SQLite(), dbname = "nbaDb.sqlite")

# Lister les tables de la base de données
tables <- dbListTables(conn)

# Sélectionner les 5 premières lignes de la table team
df_team_first5 <- dbGetQuery(conn, 'SELECT * FROM team LIMIT 5')

# Jointure en SQL
df_join_sql <- dbGetQuery(conn, 'SELECT * FROM team JOIN game ON team.id = game.team_id_home WHERE team.city = "Los Angeles"')

# Création d'une nouvelle table dans la base de données SQLite à partir d'un dataframe
dbWriteTable(conn, "new_table_from_join", df_join_sql, overwrite = TRUE)

# Fermeture de la connexion à la base de données SQLite
dbDisconnect(conn)
