port = 3838
output_dir = "output/"

## debugging the MIRACUM stuff (JM):
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
utils_path = DQAstats::clean_path_name(system.file("application/_utilities",
                                                   package = "miRacumDQA"))
mdr_filename = "mdr.csv"
config_file = system.file("application/_settings/demo_settings_INTERNAL.yml",
                          package = "DQAgui")
logfile_dir = "~/share/logfiles/"
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑


## debugging the MIRACUM stuff (LK):
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# utils_path = DQAstats::clean_path_name(system.file("application/_utilities",
#                                                    package = "miRacumDQA"))
# mdr_filename = "mdr.csv"
# config_file <- "/home/rstudio/development/Rpackages/dqa/demo_settings_INTERNAL.yml"
# logfile_dir <- tempdir()
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑


## debugging testdata:
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# utils_path = system.file("demo_data/utilities",
#                          package = "DQAstats")
# mdr_filename = "mdr_example_data.csv"
# config_file = system.file("demo_data/utilities/settings/demo_settings.yml",
#                           package = "DQAstats")
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑


launch_app(
  port = port,
  utils_path = utils_path,
  mdr_filename = mdr_filename,
  config_file = config_file,
  logfile_dir = logfile_dir
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
#   mdr_filename = mdr_filename,
#   config_file = config_file,
#   use_env_credentials = TRUE
# )
