test_that("le filtrage par genre fonctionne", {
  res <- filtrer_par_genre(marathon2, "Female")
  expect_equal(unique(res$gender), "Female")
})

test_that("filtrer_par_genre renvoie vide pour un mauvais genre", {
  res <- filtrer_par_genre(marathon2, "Alien")
  expect_equal(nrow(res), 0)
})
