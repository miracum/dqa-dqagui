context("lints")

if (dir.exists("../../00_pkg_src")) {
  prefix <- "../../00_pkg_src/DQAgui/"
} else if (dir.exists("../../R")) {
  prefix <- "../../"
} else if (dir.exists("./R")) {
  prefix <- "./"
}

test_that(
  desc = "test lints",
  code = {
    lintlist <- list(
      "R" = list(
        "app_utils.R" = NULL,
        "launch_app.R" = NULL,
        "moduleAtempPlausibility.R" = NULL,
        "moduleCompleteness.R" = NULL,
        "moduleConfig.R" = NULL,
        "moduleDashboard.R" = "cyclomatic complexity",
        "moduleDescriptive.R" = NULL,
        "moduleMDR.R" = NULL,
        "moduleUniquePlausibility.R" = NULL,
        "moduleVisualizations.R" = NULL
      ),
      "inst/application" = list(
        "server.R" = NULL,
        "ui.R" = NULL,
        "global.R" = NULL
      ),
      "tests/testthat" = list(
        "test-lints.R" = NULL
      )
    )

    for (directory in names(lintlist)) {
      print(directory)
      for (fname in names(lintlist[[directory]])) {
        print(fname)
        #% print(list.files(prefix))

        # skip on covr
        skip_on_covr()

        lintr::expect_lint(
          file = paste0(
            prefix,
            directory,
            "/",
            fname
          ),
          checks = lintlist[[directory]][[fname]]
        )
      }
    }
  }
)
