#### Pre-run base Sirene

##--- Import du jeu de données
library(tidyverse)

    # UL de 10k salariés et plus
plus_10k <- read_delim("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/economicref-france-sirene-v3/exports/csv?lang=fr&qv1=(trancheeffectifsunitelegaletriable%3D%3D53)&timezone=Europe%2FBerlin&use_labels=true&delimiter=%3B", ";",
                   col_select = c(SIREN:SIRET,`Tranche de l'effectif de l'établissement`,`Tranche de l'effectif de l'établissement triable`,`Année de la tranche d'effectif de l'établissement`,`Tranche de l'effectif de l'unité légale`,`Tranche de l'effectif de l'unité légale triable`,`Année de la tranche de l'effectif de l'unité légale`,`Date du dernier traitement de l'unité légale`,`Catégorie juridique de l'unité légale`,`Nature juridique de l'unité légale`))

    # UL de 5k ) 10k salariés
entre_5k_10k <- read_delim("https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/economicref-france-sirene-v3/exports/csv?lang=fr&qv1=(trancheeffectifsunitelegaletriable%3D%3D52)&timezone=Europe%2FBerlin&use_labels=true&delimiter=%3B", ";",
                   col_select = c(SIREN:SIRET,`Tranche de l'effectif de l'établissement`,`Tranche de l'effectif de l'établissement triable`,`Année de la tranche d'effectif de l'établissement`,`Tranche de l'effectif de l'unité légale`,`Tranche de l'effectif de l'unité légale triable`,`Année de la tranche de l'effectif de l'unité légale`,`Date du dernier traitement de l'unité légale`,`Catégorie juridique de l'unité légale`,`Nature juridique de l'unité légale`))

    # Merge des deux bases
sirene <- rbind(plus_10k, entre_5k_10k)



##--- Filtres

# Filtre sur la forme juridique
forme_juri <- sirene |> 
    filter(naturejuridiqueunitelegale == "SAS, société par actions simplifiée" | naturejuridiqueunitelegale == "Société européenne" |
               naturejuridiqueunitelegale == "Société en commandite par actions")

# Filtre sur le nombre de salariés
nb_salaries <- sirene |> 
    filter(trancheeffectifsunitelegale == "5 000 à 9 999 salariés" | trancheeffectifsunitelegale == "10 000 salariés et plus" |
               trancheeffectifsetablissement == "5 000 à 9 999 salariés" | trancheeffectifsetablissement == "10 000 salariés et plus")
