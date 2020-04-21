port = 3838
output_dir = "output/"

## debugging the MIRACUM stuff (JM):
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# utils_path = DIZutils::clean_path_name(system.file("application/_utilities",
#                                                    package = "miRacumDQA"))
# mdr_filename = "mdr.csv"
# logfile_dir = "~/share/logfiles/"
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑


## debugging the MIRACUM stuff (LK):
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# utils_path = DIZutils::clean_path_name(system.file("application/_utilities",
#                                                    package = "miRacumDQA"))
# mdr_filename = "mdr.csv"
# logfile_dir <- tempdir()
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑


## debugging testdata:
## ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
utils_path = system.file("demo_data/utilities",
                         package = "DQAstats")
mdr_filename = "mdr_example_data.csv"
logfile_dir <- tempdir()
##	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑	↑

DIZutils::set_env_vars("../env_INTERNAL")

launch_app(
  port = port,
  utils_path = utils_path,
  mdr_filename = mdr_filename,
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
#   mdr_filename = mdr_filename
# )
