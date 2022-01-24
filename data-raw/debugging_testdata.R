# remotes::install_git(url = "https://gitlab.miracum.org/miracum/misc/dizutils", ref = "development")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/dqa/dqastats", ref = "feat_new_coreds")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/dqa/dqagui", ref = "feat_new_coreds")

port = 3838
output_dir = "output/"


Sys.setenv("DEMO_SOURCE_PATH" = system.file("demo_data", package = "DQAstats"))
Sys.setenv("DEMO_TARGET_PATH" = system.file("demo_data", package = "DQAstats"))


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
