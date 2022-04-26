# remotes::install_git(url = "https://gitlab.miracum.org/miracum/misc/diztools", ref = "dev")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/misc/dizutils", ref = "development")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/dqa/dqastats", ref = "development")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/dqa/dqagui", ref = "development")

# install.packages("DIZtools")
# install.packages("DIZutils")
# install.packages("DQAstats")
# install.packages("DQAgui")

port = 3838


# Sys.setenv("CSV_SOURCE_BASEPATH" = system.file("demo_data", package = "DQAstats"))
# Sys.setenv("CSV_TARGET_BASEPATH" = system.file("demo_data", package = "DQAstats"))


# debugging default for Lorenz
Sys.setenv("CSV_SOURCE_BASEPATH" = "~/development/Rpackages")
Sys.setenv("CSV_TARGET_BASEPATH" = "~/development/Rpackages")

## debugging testdata:
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
utils_path = system.file("demo_data/utilities",
                         package = "DQAstats")
mdr_filename = "mdr_example_data.csv"
logfile_dir <- tempdir()
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑

devtools::load_all()
logfile_dir = tempdir()
parallel = FALSE
ncores = 4

launch_app(
  port = port,
  utils_path = utils_path,
  mdr_filename = mdr_filename,
  logfile_dir = logfile_dir
)
