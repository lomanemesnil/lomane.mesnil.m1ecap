#' Filtrer les données par genre
#'
#' @param data Le dataframe marathon2
#' @param g Le genre à filtrer ("Male" ou "Female")
#' @return Un dataframe filtré
#' @export
filtrer_par_genre <- function(data, g) {
  return(data[data$gender == g, ])
}

#' Trouver les records par pays
#'
#' @param data Le dataframe marathon2
#' @importFrom dplyr group_by summarise n
#' @export
records_par_pays <- function(data) {
  # On cherche le temps minimum (le record) pour chaque pays
  res <- dplyr::summarise(dplyr::group_by(data, country),
                          meilleur_temps = min(time_seconds, na.rm = TRUE),
                          nombre_victoires = dplyr::n())
  return(res)
}

#' Graphique de repartition des temps par genre (Boxplot)
#'
#' @param data Le dataframe marathon2
#' @import ggplot2
#' @export
plot_marathon_box <- function(data) {

  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Le package ggplot2 est nécessaire.")
  }

  ggplot2::ggplot(data) +
    ggplot2::aes(x = gender, y = time_seconds, fill = gender) +
    ggplot2::geom_boxplot(alpha = 0.7) +
    ggplot2::labs(
      title = "Repartition des temps de course par genre",
      x = "Genre",
      y = "Temps (en secondes)"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::scale_fill_manual(values = c("Female" = "#f8766d", "Male" = "#00bfc4"))
}
