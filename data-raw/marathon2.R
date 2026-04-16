# URL du jeu de données

url_jeu_de_donnees <- "https://www.kaggle.com/datasets/emmanuelleai/world-marathons-majors"


# ajout d'une colonne time_seconds

library(tidyverse)
library(lubridate)
marathon2 <- marathon |>
  mutate(time_seconds = as.numeric(time))


# code to prepare `marathon2` dataset goes here

usethis::use_data(marathon2, overwrite = TRUE)
