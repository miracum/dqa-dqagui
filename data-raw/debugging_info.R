port = 3838
utils_path = system.file("demo_data/utilities",
                         package = "DQAstats")
mdr_filename = "mdr.csv"
config_file = system.file("application/_settings/demo_settings_INTERNAL.yml",
                          package = "DQAgui")


# debugging
launch_app(
  port = port,
  utils_path = DQAstats::clean_path_name(system.file("application/_utilities",
                                                     package = "miRacumDQA")),
  mdr_filename = mdr_filename,
  config_file = config_file
)
