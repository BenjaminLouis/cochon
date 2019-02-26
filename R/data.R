#' Tableau de répartition des produits par entité
#'
#' Un dataset contenant la répartition des produits par entité
#'
#'
#' @format A data frame with 38 rows and 12 variables:
#' \describe{
#'   \item{recettes}{}
#'   \item{produit}{}
#'   \item{steph_luc}{}
#'   \item{estelle_marian}{}
#'   \item{anaelle_matthieu}{}
#'   \item{laura_thomas}{}
#'   \item{marion_judicael}{}
#'   \item{tiffany}{}
#'   \item{suk_ben}{}
#'   \item{commun}{}
#'   \item{dons}{}
#'   \item{casse}{}
#' }
"repartition"


#' Tableau de généralités
#'
#' Un dataset contenant des généralités
#'
#'
#' @format A data frame with 1 rows and 10 variables:
#' \describe{
#'   \item{Nombre de cochons}{}
#'   \item{Poids total (kg)}{}
#'   \item{Prix au kilo (€/kg)}{}
#'   \item{Prix total (€)}{}
#'   \item{Poids de viandes (kg)}{}
#'   \item{Poids de chair (kg)}{}
#'   \item{Poids des foies (kg)}{}
#'   \item{Poids de gras (kg)}{}
#'   \item{'Rendement sans foie (%)'}{}
#'   \item{'Rendement avec foie (%)'}{}
#'   \item{Poids viandes + chair + foies (kg)}{}
#'   \item{Prix viandes + chair + foies au kilo (€/kg)}{}
#' }
"gener"


#' Tableau des recettes
#'
#' Un dataset contenant la répartition de la viande dans les recettes
#'
#'
#' @format A data frame with 25 rows and 6 variables:
#' \describe{
#'   \item{recettes}{}
#'   \item{poids_viandes}{}
#'   \item{poids_foie}{}
#'   \item{poids_chair}{}
#'   \item{poids_total}{}
#'   \item{prix_total}{}
#' }
"recettes"

#' coefs pour conditionnement
#'
#' Un dataset contenant les coefs de quantité pour chaque conditionnement quand requis
#'
#'
#' @format A data frame with 9 rows and 4 variables:
#' \describe{
#'   \item{recettes}{}
#'   \item{produit}{}
#'   \item{coef_viande}{}
#'   \item{qtite_saucisse}{}
#' }
"coefs"


#' Depense
#'
#' Un dataset contenant les dépenses commune
#'
#'
#' @format A data frame with 19 rows and 3 variables:
#' \describe{
#'   \item{achat}{}
#'   \item{acheteur}{}
#'   \item{prix}{}
#' }
"depenses"
