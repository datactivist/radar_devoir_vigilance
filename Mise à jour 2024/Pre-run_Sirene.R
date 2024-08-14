#### Pre-run base Sirene

##--- Import du jeu de données
library(tidyverse)

    # UL de 10k salariés et plus
plus_10k <- read_delim("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/economicref-france-sirene-v3/exports/csv?lang=fr&qv1=(trancheeffectifsunitelegaletriable%3D%3D53)&timezone=Europe%2FBerlin&use_labels=true&delimiter=%3B", ";",
                   col_select = c(SIREN:SIRET,`Dénomination de l'unité légale`,`Dénomination usuelle de l'établissement`,`Tranche de l'effectif de l'établissement`,`Tranche de l'effectif de l'établissement triable`,`Année de la tranche d'effectif de l'établissement`,`Tranche de l'effectif de l'unité légale`,`Tranche de l'effectif de l'unité légale triable`,`Année de la tranche de l'effectif de l'unité légale`,`Date du dernier traitement de l'unité légale`,`Catégorie juridique de l'unité légale`,`Nature juridique de l'unité légale`))

    # UL de 5k à 10k salariés
entre_5k_10k <- read_delim("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/economicref-france-sirene-v3/exports/csv?lang=fr&qv1=(trancheeffectifsunitelegaletriable%3D%3D52)&timezone=Europe%2FBerlin&use_labels=true&delimiter=%3B", ";",
                   col_select = c(SIREN:SIRET,`Dénomination de l'unité légale`,`Dénomination usuelle de l'établissement`,`Tranche de l'effectif de l'établissement`,`Tranche de l'effectif de l'établissement triable`,`Année de la tranche d'effectif de l'établissement`,`Tranche de l'effectif de l'unité légale`,`Tranche de l'effectif de l'unité légale triable`,`Année de la tranche de l'effectif de l'unité légale`,`Date du dernier traitement de l'unité légale`,`Catégorie juridique de l'unité légale`,`Nature juridique de l'unité légale`))

    # Merge des deux bases
sirene <- rbind(plus_10k, entre_5k_10k)
rio::export(sirene, "Mise à jour 2024/data/in/entreprises_plus5000-salaries_SIRENE.csv")

