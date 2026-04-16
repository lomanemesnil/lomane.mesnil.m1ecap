test_that("records_par_pays renvoie un tableau correct", {
  stats <- records_par_pays(marathon2)

  # verif que c'est un dataframe
  expect_s3_class(stats, "data.frame")

  # verif que les colonnes attendues sont la
  expect_true(all(c("country", "meilleur_temps", "nombre_victoires") %in% colnames(stats)))

  # verif qu'il n'y a pas de valeurs negatives dans le temps
  expect_true(all(stats$meilleur_temps > 0))
})

test_that("records_par_pays gere les NA", {
  df_na <- marathon2
  df_na$time_seconds[1] <- NA
  stats <- records_par_pays(df_na)
  expect_false(any(is.na(stats$meilleur_temps)))
})
