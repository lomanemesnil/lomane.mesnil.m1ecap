test_that("plot_marathon_box genere un graphique ggplot", {
  p <- plot_marathon_box(marathon2)
  expect_s3_class(p, "ggplot")
})
