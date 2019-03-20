#' Fonction pour calculer le prix unitaire quand des coefs sont impliqués
#'
#' @param svar string. Partie du nom du produit
#' @param prix_sauc prix d'une saucisse fraiche
#'
#' @return un tableau avec le prix unitaire en focntion du conditionnement
#' @export
#'
#' @importFrom dplyr filter pull select group_by summarise left_join mutate contains rename '%>%'
#' @importFrom stringr str_detect
#' @importFrom tidyr gather
#'
#' @examples
#' get_unitaire("pate_foie")
get_unitaire <- function(svar,prix_sauc = 0) {
  prix_tout <- recettes %>%
    filter(recettes == svar) %>%
    pull(prix_total)

  tab <- repartition %>%
    filter(str_detect(recettes, svar)) %>%
    select(-recettes) %>%
    gather("key", "value", -produit) %>%
    group_by(produit) %>%
    summarise(quantite = sum(value)) %>%
      left_join(.,
                coefs %>% filter(str_detect(recettes, svar)) %>% select(-recettes),
                by = "produit")

  tab <- tab %>%
    mutate(prix_viande = coef_viande*prix_tout/sum(quantite*coef_viande),
           prix_saucisse = qtite_saucisse*prix_sauc) %>%
    mutate(prix_unitaire = prix_viande + prix_saucisse)

  if (prix_sauc == 0) {
    tab <- select(tab, -contains("saucisse"), -prix_viande) %>%
      rename(coef = coef_viande)
  }
  tab
}





