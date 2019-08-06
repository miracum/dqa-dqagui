# assign global variable here
headless <- FALSE
# TODO remove utils path (this is for debugging only and needs to be replaced by a user customization)
utils <- DQAstats::cleanPathName_("/home/user/development/Rpackages/DQAstats/tests/testthat/testdata/_utilities")
print(getwd())

# source external functions here
options(kableExtra.auto_format = FALSE)
options(knitr.table.format = "latex")
