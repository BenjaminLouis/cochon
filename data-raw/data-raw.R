library(tidyverse)

# Répartition des produits

repartition <- read_csv("data-raw/tableau_repartition.csv")

usethis::use_data(repartition, overwrite = TRUE)

# Dépenses

depenses <- read_csv("data-raw/depenses.csv")

usethis::use_data(depenses, overwrite = TRUE)

# Recettes

recettes <- read_csv("data-raw/recettes.csv") %>%
  mutate(poids_total = poids_viandes + poids_foie + poids_chair,
         prix_total = 1139.74*poids_total/sum(poids_total))

usethis::use_data(recettes, overwrite = TRUE)

# Généralites

poids_viandes <- recettes %>% pull(poids_viandes) %>% sum
poids_total <- recettes %>% pull(poids_total) %>% sum
prix <- 1139.74/poids_total

gener <- tibble(
  'Nombre de cochons' = 2,
  'Poids total (kg)' = 232.6,
  'Prix au kilo (€/kg)' = 4.9,
  'Prix total (€)' = 1139.74,
  'Poids de viande (kg)' = poids_viandes,
  'Poids de chair (kg)' = 48.17,
  'Poids des foies (kg)' = 3.4,
  'Poids de gras (kg)' = 32.6,
  'Rendement sans foie (%)' = round(100*(poids_viandes + 48.17)/232.6),
  'Rendement avec foie (%)' = round(100*poids_total/232.6),
  'Poids viandes + chair + foies (kg)' = poids_total,
  'Prix viandes + chair + foies au kilo (€/kg)' = prix
)

usethis::use_data(gener, overwrite = TRUE)

# Répartition des produits

coefs <- read_csv("data-raw/coefs.csv")

usethis::use_data(coefs, overwrite = TRUE)
