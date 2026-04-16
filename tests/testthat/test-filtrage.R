test_that("le filtrage par genre fonctionne", {
  res <- filtrer_par_genre(marathon2, "Female")
  expect_equal(unique(res$gender), "Female")
})
