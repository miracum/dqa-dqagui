# nolint start
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/misc/diztools", ref = "dev")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/misc/dizutils", ref = "development")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/dqa/dqastats", ref = "development")
# remotes::install_git(url = "https://gitlab.miracum.org/miracum/dqa/dqagui", ref = "development")

# install.packages("DIZtools")
# install.packages("DIZutils")
# install.packages("DQAstats")
# install.packages("DQAgui")

options(shiny.trace = TRUE)
options(shiny.fullstacktrace = TRUE)


port = 3838
output_dir = "output/"

## debugging the MIRACUM stuff (JM):
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
utils_path = DIZtools::clean_path_name(system.file("application/_utilities",
                                                   package = "miRacumDQA"))
mdr_filename = "mdr.csv"
logfile_dir = "~/share/logfiles/"
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑


## debugging the MIRACUM stuff (LK):
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# utils_path = DIZtools::clean_path_name(system.file("application/_utilities",
#                                                    package = "miRacumDQA"))
# mdr_filename = "mdr.csv"
# logfile_dir <- tempdir()
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑


## debugging testdata:
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# utils_path = system.file("demo_data/utilities",
#                          package = "DQAstats")
# mdr_filename = "mdr_example_data.csv"
# logfile_dir <- tempdir()
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑
##
##
devtools::load_all()
logfile_dir = tempdir()
parallel = TRUE
ncores = 8
## Lorenz:
# utils_path = "/home/user/development/Rpackages/dqa/miracumdqa/inst/application/_utilities/"
## Jonathan:
# utils_path = DIZtools::clean_path_name(system.file("application/_utilities",
#                                                    package = "miRacumDQA"))
# utils_path = DIZtools::clean_path_name(system.file("application/_utilities",
#                                                    package = "ume_dqatool"))
# utils_path = "~/git-local/miracum/ume_dqatool/inst/application/_utilities/"

# mdr_filename = "mdr_combined.csv"

DIZtools::setenv_file(
  paste0(
    "../",
    list.files(path = "../", pattern = "^env_INTERNAL.*")
    #list.files(path = "../", pattern = "dev.env")
  )
)
# shiny::shinyAppDir("inst/application/")

launch_app(
  port = port,
  utils_path = utils_path,
  mdr_filename = mdr_filename,
  logfile_dir = logfile_dir,
  parallel = parallel,
  ncores = ncores
)

# with environment variables
# Sys.setenv(
#   I2B2_PASSWORD = "i2b2",
#   OMOP_PASSWORD = "admin1"
# )
#
# launch_app(
#   port = port,
#   utils_path = utils_path,
#   mdr_filename = mdr_filename
# )

# nolint end
