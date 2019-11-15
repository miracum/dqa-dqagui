# debugging
launch_app(
  utilspath = DQAstats::clean_path_name(
    system.file(
      "application/_utilities",
      package = "miRacumDQA"
    )
  ),
  db_source = "p21csv"
)
