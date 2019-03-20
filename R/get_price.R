#' get price by person
#'
#' @param svar recette
#' @param unit soit un tableau avec le prix unitaire, soit le prix total de la recette
#'
#' @return un tableau avec le prix que doit payer chaque entité
#' @export
#'
#' @importFrom dplyr filter select left_join mutate group_by summarise '%>%'
#' @importFrom stringr str_detect
#' @importFrom tidyr gather
#'
#' @examples
#' library(dplyr)
#' get_price("chipolatas", unit = recettes %>% filter(recettes == "chipolatas") %>% pull(prix_total))
get_price <- function(svar, unit) {
  tab <- repartition %>%
    filter(recettes == svar) %>%
    select(-recettes) %>%
    gather("qui", "quantite", -produit)

  if ("data.frame" %in% class(unit)) {
    tab <- left_join(tab, select(unit, produit, prix_unitaire), by = "produit") %>%
      mutate(prix = quantite*prix_unitaire)
  }
  if (is.numeric(unit)) {
    tab <- mutate(tab, prix = quantite*unit/sum(quantite))
  }

  tab  %>%
    group_by(qui) %>%
    summarise(doit_payer  = sum(prix))
}
