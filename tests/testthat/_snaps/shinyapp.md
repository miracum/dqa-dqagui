# DQAgui shiny app / launch_app() works

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["sitename", "keys_source", "end_time", "datamap", "finished_onstart", "affectedids_exported", "ncores", "aggregated_exported", "pl", "datamap_email", "headless", "keys_target", "dqa_assessment", "results_descriptive", "data_plausibility", "results_plausibility_unique", "utilspath", "current_date", "checks", "variable_list", "sitenames", "restricting_date", "data_target", "system_types", "settings", "mdr", "report_created", "mdr_filename", "getdata_source", "conformance", "displaynames", "source", "target", "target_is_source", "data_source", "results_plausibility_atemporal", "systems", "demo_usage", "start", "log", "completeness", "parallel", "create_report", "pl_uniq_vars_filter", "getdata_target", "pl_atemp_vars_filter"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["DEMO"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["dqa_example_data_01.csv"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["2022-06-20 13:31:15 CEST"]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["source_data", "target_data"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["variable", "n", "valids", "missings", "distinct"]
                },
                "row.names": {
                  "type": "integer",
                  "attributes": {},
                  "value": [1, 2]
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["data.table", "data.frame"]
                },
                ".internal.selfref": {
                  "type": "externalptr",
                  "attributes": {},
                  "value": {}
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Person ID", "Credit worthy?"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["23", "23"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["23", "23"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["0", "0"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["16", "2"]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["variable", "n", "valids", "missings", "distinct"]
                },
                "row.names": {
                  "type": "integer",
                  "attributes": {},
                  "value": [1, 2]
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["data.table", "data.frame"]
                },
                ".internal.selfref": {
                  "type": "externalptr",
                  "attributes": {},
                  "value": {}
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Person ID", "Credit worthy?"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["23", "23"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["23", "23"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["0", "0"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["16", "2"]
                }
              ]
            }
          ]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [true]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [true]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [true]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["atemp_vars", "uniq_vars", "atemp_helper_vars", "atemp_possible", "uniq_helper_vars", "uniq_possible"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "row.names": {
                  "type": "integer",
                  "attributes": {},
                  "value": [1]
                },
                ".internal.selfref": {
                  "type": "externalptr",
                  "attributes": {},
                  "value": {}
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["data.table", "data.frame"]
                },
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["designation", "variable_name", "variable_type", "plausibility_relation"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Credit worthy?"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["dqa_credit_worthy"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["enumerated"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["{\"atemporal\": {\"dqa_bank_balance\": {\"name\": \"Pl.atemporal.Item01\", \"description\": \"Persons with a negative bank balance cannot be credit worthy\", \"filter\": {\"exampleCSV_source\": \"^(-)\", \"exampleCSV_target\": \"^(-)\"}, \"join_crit\": \"dqa_person_id\", \"constraints\": {\"value_set\": {\"exampleCSV_source\": [\"no\"], \"exampleCSV_target\": [\"no\"]}}}}}"]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "row.names": {
                  "type": "integer",
                  "attributes": {},
                  "value": [1]
                },
                ".internal.selfref": {
                  "type": "externalptr",
                  "attributes": {},
                  "value": {}
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["data.table", "data.frame"]
                },
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["designation", "variable_name", "variable_type", "plausibility_relation"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Person ID"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["dqa_person_id"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["string"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["{\"uniqueness\": {\"dqa_name\": {\"name\": \"Pl.uniqueness.Item01\",\"description\": \"The last name of a person must be identical in all entries for one person ID.\"}}}"]
                }
              ]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_credit_worthy", "dqa_bank_balance", "dqa_person_id"]
            },
            {
              "type": "logical",
              "attributes": {},
              "value": [true]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_person_id", "dqa_name"]
            },
            {
              "type": "logical",
              "attributes": {},
              "value": [true]
            }
          ]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["your.name@mail.company.org"]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [false]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["dqa_example_data_02.csv"]
        },
        {
          "type": "list",
          "attributes": {
            "row.names": {
              "type": "integer",
              "attributes": {},
              "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
            },
            ".internal.selfref": {
              "type": "externalptr",
              "attributes": {},
              "value": {}
            },
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["data.table", "data.frame"]
            },
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["designation", "source_variable_name", "variable_name", "variable_type", "key", "source_table_name"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["Person ID", "Forename", "Name", "Age in years", "Birthdate", "Sex", "Income", "Job", "Current bank balance", "Credit worthy?", "Amount of credit", "Date of contact"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["PERSON_ID", "FORENAME", "NAME", "AGE", "BIRTHDATE", "SEX", "INCOME", "JOB", "BANK-BALANCE", "CREDIT-WORTHY", "CREDIT-AMOUNT", "CONTACT-DATE"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_person_id", "dqa_forename", "dqa_name", "dqa_age_years", "dqa_birthdate", "dqa_sex", "dqa_income", "dqa_job", "dqa_bank_balance", "dqa_credit_worthy", "dqa_credit_amount", "dqa_contact_date"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["string", "string", "string", "integer", "datetime", "enumerated", "integer", "string", "integer", "enumerated", "integer", "datetime"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa.person_id", "dqa.forename", "dqa.name", "dqa.age_years", "dqa.birthdate", "dqa.sex", "dqa.income", "dqa.job", "dqa.bank_balance", "dqa.credit_worthy", "dqa.credit_amount", "dqa.contact_date"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv"]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["Age in years", "Amount of credit", "Birthdate", "Credit worthy?", "Current bank balance", "Date of contact", "Forename", "Income", "Job", "Name", "Person ID", "Sex"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Age in years"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_age_years"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The age of the person at the time of contact."]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["AGE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} "]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["AGE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} "]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_age_years"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [21]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_age_years"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [21]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["63", "22", "64", "94", "22.56", "0", "0", "23", "0", "0", "509", "72"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["67.35", "22", "64", "175", "32.45", "0", "0", "23", "0", "1", "1052.87", "153"]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Amount of credit"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_amount"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["That's the amount of credit the person has used"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["CREDIT-AMOUNT"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["CREDIT-AMOUNT"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_credit_amount"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [10]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [13]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [10]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_credit_amount"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [10]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [13]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [10]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["39220", "12200", "33350", "72800", "21447.19", "0", "0", "10", "0", "0", "459981777.78", "60600"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["39220", "12200", "33350", "72800", "21447.19", "0", "0", "10", "0", "0", "459981777.78", "60600"]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Birthdate"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_birthdate"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The date of birth written as dd.mm.yyyy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["BIRTHDATE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["datetime"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}"]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["BIRTHDATE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["datetime"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}"]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_birthdate"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [16]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["datetime"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_birthdate"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [16]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["datetime"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.frame"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["1921-02-19", "1932-09-17", "1951-07-03", "1950-09-25", "1965-05-10", "1990-05-26"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.frame"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["1921-02-19", "1932-09-17", "1951-07-03", "1950-09-25", "1965-05-10", "1990-05-26"]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Credit worthy?"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Indicates whether the person is creditworthy at the time of the contact"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["CREDIT-WORTHY"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["enumerated"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\": [\"yes\", \"no\"]}"]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["CREDIT-WORTHY"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["enumerated"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\": [\"yes\", \"no\"]}"]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_credit_worthy"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [2]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["enumerated"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_credit_worthy"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [2]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["enumerated"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["no", "yes"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [13, 10]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [56.52173913, 43.47826087]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["no", "yes"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [13, 10]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [56.52173913, 43.47826087]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Current bank balance"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_bank_balance"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The bank-balance at the time of contact"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["BANK-BALANCE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} "]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["BANK-BALANCE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} "]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_bank_balance"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [22]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_bank_balance"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [22]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["35152.17", "-34200", "18800", "124100", "39516.63", "2", "0", "21", "0", "0", "1561564426.88", "158300"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["26395.65", "-64200", "12800", "124100", "46097.8", "4", "0", "19", "0", "0", "2125006798.42", "188300"]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Date of contact"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_contact_date"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Date of contact"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["CONTACT-DATE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["datetime"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}"]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["CONTACT-DATE"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["datetime"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}"]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_contact_date"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["datetime"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_contact_date"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["datetime"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.frame"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["2011-10-12", "2012-08-11", "2013-10-02", "2013-10-28", "2014-12-21", "2015-12-20"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.frame"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2, 3, 4, 5, 6]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["2011-10-12", "2012-08-11", "2013-10-02", "2013-10-28", "2014-12-21", "2015-12-20"]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Forename"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_forename"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The Forename of the person."]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["FORENAME"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["FORENAME"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_forename"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [17]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_forename"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [16]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_forename", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Annie", "Dorothy", "Elijah", "Elliott", "Georgina", "Geraldine", "Gilberto", "Janet", "John", "Karen", "Lawrence", "Martin", "Miriam", "Susan", "Wayne", "Williams", "Zenaida"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [17, 6, 16, 15, 2, 11, 8, 12, 5, 4, 7, 1, 10, 9, 14, 3, 13]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 8.69565217, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_forename", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Annie", "Dorothy", "Elijah", "Elliott", "Georgina", "Geraldine", "Gilberto", "Janet", "John", "Karen", "Lawrence", "Martin", "Susan", "Wayne", "Williams", "Zenaida"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [6, 16, 15, 14, 2, 11, 8, 12, 5, 4, 7, 1, 10, 9, 13, 3]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 13.04347826, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Income"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_income"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The income of the person at the time of contact"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["INCOME"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["INCOME"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["integer"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_income"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_income"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["integer"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["68826.09", "3000", "59000", "145000", "46841.76", "0", "0", "23", "0", "0", "2194150197.63", "142000"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": [" ", " "]
                        },
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Mean", "Minimum", "Median", "Maximum", "SD", "Negativ", "Zero", "Positive", "OutLo", "OutHi", "Variance", "Range"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["68391.3", "-5000", "59000", "145000", "47502.86", "1", "0", "22", "0", "0", "2256521739.13", "150000"]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Job"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_job"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The job of the person at the time of contact"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["JOB"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["JOB"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_job"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [15]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_job"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [15]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_job", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Bank manager", "Chemist", "Comedian", "Engineer", "Farmer", "Gardener", "Lawyer", "Magician", "Photographer", "Pilot", "Professor", "Psychologist", "Researcher", "Singer", "Student"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 8, 15, 10, 7, 14, 9, 5, 11, 4, 13, 2, 6, 12, 3]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 13.04347826, 8.69565217, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_job", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Bank manager", "Chemist", "Comedian", "Engineer", "Farmer", "Gardener", "Lawyer", "Magician", "Photographer", "Pilot", "Professor", "Psychologist", "Researcher", "Singer", "Student"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 8, 15, 10, 7, 14, 9, 5, 11, 4, 13, 2, 6, 12, 3]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 13.04347826, 8.69565217, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Name"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_name"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The Surname of the person."]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["NAME"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["NAME"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_name"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [16]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_name"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [16]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_name", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Burdett", "Cook", "Daniels", "Dardar", "Eatmon", "Jackson", "Jones", "Kenney", "Kirkland", "Malloy", "Rodriguez", "Shuck", "Simpson", "Staggs", "Stock", "Sutton"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [6, 14, 11, 1, 13, 3, 4, 7, 2, 5, 8, 15, 12, 10, 9, 16]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 13.04347826, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_name", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["Burdett", "Cook", "Daniels", "Dardar", "Eatmon", "Jackson", "Jones", "Kenney", "Kirkland", "Malloy", "Rodriguez", "Shuck", "Simpson", "Staggs", "Stock", "Sutton"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [6, 14, 11, 1, 13, 3, 4, 7, 2, 5, 8, 15, 12, 10, 9, 16]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 13.04347826, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Person ID"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_person_id"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Each person has its own person-id. It stays the same over the whole live of the person and does not change."]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["PERSON_ID"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["PERSON_ID"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["string"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": [null]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_person_id"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [16]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_person_id"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [16]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["string"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_person_id", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["1", "10", "11", "12", "13", "14", "15", "16", "2", "3", "4", "5", "6", "7", "8", "9"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 14, 12, 3, 7, 9, 10, 11, 13, 15, 16, 2, 4, 5, 6, 8]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 13.04347826, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_person_id", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["1", "10", "11", "12", "13", "14", "15", "16", "2", "3", "4", "5", "6", "7", "8", "9"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 14, 12, 3, 7, 9, 10, 11, 13, 15, 16, 2, 4, 5, 6, 8]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [13.04347826, 13.04347826, 8.69565217, 8.69565217, 8.69565217, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609, 4.34782609]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "internal_variable_name", "description", "var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Sex"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_sex"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["The sex of the person in one letter: m, f or x for unknown."]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["SEX"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_01.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["enumerated"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\":[\"m\", \"f\", \"x\"]} "]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["var_name", "table_name", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["SEX"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_example_data_02.csv"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["var_type", "constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["enumerated"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\":[\"male\", \"female\", \"unknown\"]} "]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_sex"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [2]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["enumerated"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_sex"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [23]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [3]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["enumerated"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_sex", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["f", "m"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [13, 10]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [56.52173913, 43.47826087]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2, 3]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_sex", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["abc", "female", "male"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [2, 3, 1]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [12, 10, 1]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [52.17391304, 43.47826087, 4.34782609]
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["atemporal"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["pl.atemporal.item01"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "description", "var_dependent", "var_independent", "filter", "join_crit", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Pl.atemporal.Item01"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Persons with a negative bank balance cannot be credit worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_bank_balance"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["^(-)"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_person_id"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\":\"no\"}"]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "description", "var_dependent", "var_independent", "filter", "join_crit", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Pl.atemporal.Item01"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Persons with a negative bank balance cannot be credit worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_bank_balance"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["^(-)"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_person_id"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["constraints"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\":\"no\"}"]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["dqa_name"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "source_data", "target_data"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["The last name of a person must be identical in all entries for one person ID."]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["message", "error"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["No duplicate occurrences of dqa_person_id found in association with dqa_name."]
                    },
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["FALSE"]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["message", "error"]
                    }
                  },
                  "value": [
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["No duplicate occurrences of dqa_person_id found in association with dqa_name."]
                    },
                    {
                      "type": "character",
                      "attributes": {},
                      "value": ["FALSE"]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["/usr/local/lib/R/site-library/DQAstats/demo_data/utilities/"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["20. June 2022"]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["value_conformance", "etl"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["Variable", "Check Source Data", "Check Target Data"]
                },
                "row.names": {
                  "type": "integer",
                  "attributes": {},
                  "value": [1, 2, 3, 4, 5, 6, 7, 8, 9]
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["data.table", "data.frame"]
                },
                ".internal.selfref": {
                  "type": "externalptr",
                  "attributes": {},
                  "value": {}
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Age in years", "Amount of credit", "Birthdate", "Credit worthy?", "Current bank balance", "Date of contact", "Income", "Sex", "pl.atemporal.item01"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["passed", "passed", "failed", "passed", "failed", "failed", "passed", "passed", "passed"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["failed", "passed", "failed", "passed", "failed", "failed", "failed", "failed", "failed"]
                }
              ]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["Variable", "Check Distincts", "Check Valids", "Check Missings"]
                },
                "row.names": {
                  "type": "integer",
                  "attributes": {},
                  "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["data.table", "data.frame"]
                },
                ".internal.selfref": {
                  "type": "externalptr",
                  "attributes": {},
                  "value": {}
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["Age in years", "Amount of credit", "Birthdate", "Credit worthy?", "Current bank balance", "Date of contact", "Forename", "Income", "Job", "Name", "Person ID", "Sex"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["passed", "passed", "passed", "passed", "passed", "passed", "failed", "passed", "passed", "passed", "passed", "failed"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed", "passed"]
                }
              ]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["Age in years", "Amount of credit", "Birthdate", "Credit worthy?", "Current bank balance", "Date of contact", "Forename", "Income", "Job", "Name", "Person ID", "Sex"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_age_years"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_credit_amount"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_birthdate"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_credit_worthy"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_bank_balance"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_contact_date"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_forename"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_income"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_job"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_name"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_person_id"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_sex"]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["Demo sitename"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["DEMO"]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["use_it"]
            }
          },
          "value": [
            {
              "type": "logical",
              "attributes": {},
              "value": [false]
            }
          ]
        },
        {
          "type": "NULL"
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["csv"]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["exampleCSV_source", "exampleCSV_target"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": []
                }
              },
              "value": []
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": []
                }
              },
              "value": []
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "row.names": {
              "type": "integer",
              "attributes": {},
              "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
            },
            ".internal.selfref": {
              "type": "externalptr",
              "attributes": {},
              "value": {}
            },
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["data.table", "data.frame"]
            },
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["designation", "source_variable_name", "filter", "source_table_name", "source_system_name", "source_system_type", "key", "variable_name", "variable_type", "restricting_date_var", "constraints", "dqa_assessment", "definition", "data_map", "plausibility_relation"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["Person ID", "Forename", "Name", "Age in years", "Birthdate", "Sex", "Income", "Job", "Current bank balance", "Credit worthy?", "Amount of credit", "Date of contact", "Person ID", "Forename", "Name", "Age in years", "Birthdate", "Sex", "Income", "Job", "Current bank balance", "Credit worthy?", "Amount of credit", "Date of contact"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["PERSON_ID", "FORENAME", "NAME", "AGE", "BIRTHDATE", "SEX", "INCOME", "JOB", "BANK-BALANCE", "CREDIT-WORTHY", "CREDIT-AMOUNT", "CONTACT-DATE", "PERSON_ID", "FORENAME", "NAME", "AGE", "BIRTHDATE", "SEX", "INCOME", "JOB", "BANK-BALANCE", "CREDIT-WORTHY", "CREDIT-AMOUNT", "CONTACT-DATE"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_01.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv", "dqa_example_data_02.csv"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_source", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target", "exampleCSV_target"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv", "csv"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa.person_id", "dqa.forename", "dqa.name", "dqa.age_years", "dqa.birthdate", "dqa.sex", "dqa.income", "dqa.job", "dqa.bank_balance", "dqa.credit_worthy", "dqa.credit_amount", "dqa.contact_date", "dqa.person_id", "dqa.forename", "dqa.name", "dqa.age_years", "dqa.birthdate", "dqa.sex", "dqa.income", "dqa.job", "dqa.bank_balance", "dqa.credit_worthy", "dqa.credit_amount", "dqa.contact_date"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_person_id", "dqa_forename", "dqa_name", "dqa_age_years", "dqa_birthdate", "dqa_sex", "dqa_income", "dqa_job", "dqa_bank_balance", "dqa_credit_worthy", "dqa_credit_amount", "dqa_contact_date", "dqa_person_id", "dqa_forename", "dqa_name", "dqa_age_years", "dqa_birthdate", "dqa_sex", "dqa_income", "dqa_job", "dqa_bank_balance", "dqa_credit_worthy", "dqa_credit_amount", "dqa_contact_date"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["string", "string", "string", "integer", "datetime", "enumerated", "integer", "string", "integer", "enumerated", "integer", "datetime", "string", "string", "string", "integer", "datetime", "enumerated", "integer", "string", "integer", "enumerated", "integer", "datetime"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE", "CONTACT-DATE"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": [null, null, null, "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} ", "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}", "{\"value_set\":[\"m\", \"f\", \"x\"]} ", "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ", null, "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} ", "{\"value_set\": [\"yes\", \"no\"]}", "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ", "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}", null, null, null, "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} ", "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}", "{\"value_set\":[\"male\", \"female\", \"unknown\"]} ", "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ", null, "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} ", "{\"value_set\": [\"yes\", \"no\"]}", "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ", "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}"]
            },
            {
              "type": "integer",
              "attributes": {},
              "value": [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["Each person has its own person-id. It stays the same over the whole live of the person and does not change.", "The Forename of the person.", "The Surname of the person.", "The age of the person at the time of contact.", "The date of birth written as dd.mm.yyyy", "The sex of the person in one letter: m, f or x for unknown.", "The income of the person at the time of contact", "The job of the person at the time of contact", "The bank-balance at the time of contact", "Indicates whether the person is creditworthy at the time of the contact", "That's the amount of credit the person has used", "Date of contact", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)", "(The definition is missing in the MDR.)"]
            },
            {
              "type": "integer",
              "attributes": {},
              "value": [1, "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", 1, "NA", "NA", 1, "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", 1, "NA", "NA"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["{\"uniqueness\": {\"dqa_name\": {\"name\": \"Pl.uniqueness.Item01\",\"description\": \"The last name of a person must be identical in all entries for one person ID.\"}}}", null, null, null, null, null, null, null, null, "{\"atemporal\": {\"dqa_bank_balance\": {\"name\": \"Pl.atemporal.Item01\", \"description\": \"Persons with a negative bank balance cannot be credit worthy\", \"filter\": {\"exampleCSV_source\": \"^(-)\", \"exampleCSV_target\": \"^(-)\"}, \"join_crit\": \"dqa_person_id\", \"constraints\": {\"value_set\": {\"exampleCSV_source\": [\"no\"], \"exampleCSV_target\": [\"no\"]}}}}}", null, null, null, null, null, null, null, null, null, null, null, null, null, null]
            }
          ]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [true]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["mdr_example_data.csv"]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [false]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["value_conformance"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["Age in years", "Amount of credit", "Birthdate", "Credit worthy?", "Current bank balance", "Date of contact", "Income", "Sex", "pl.atemporal.item01"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results", "rule"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["min", "max", "format"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["1950-01-01"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["1989-12-31"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["%d.%m.%Y"]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results", "rule"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["min", "max", "format"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["1950-01-01"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["1989-12-31"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["%d.%m.%Y"]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results", "rule"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["min", "max", "format"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["2012-01-01"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["2015-12-31"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["%d.%m.%Y"]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results", "rule"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["min", "max", "format"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["2012-01-01"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["2015-12-31"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["%d.%m.%Y"]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Extrem values are not conform with constraints."]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Levels that are not conform with the value set:  \nabc"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [false]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["No 'value conformance' issues found."]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["conformance_error", "conformance_results", "affected_ids"]
                        }
                      },
                      "value": [
                        {
                          "type": "logical",
                          "attributes": {},
                          "value": [true]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Levels that are not conform with the value set:  \nyes"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1, 2]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            },
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_bank_balance"]
                            }
                          },
                          "value": [
                            {
                              "type": "double",
                              "attributes": {},
                              "value": [-36500, -64200]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["source_system_name", "displayname"]
            },
            "row.names": {
              "type": "integer",
              "attributes": {},
              "value": [1, 2]
            },
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["data.table", "data.frame"]
            },
            ".internal.selfref": {
              "type": "externalptr",
              "attributes": {},
              "value": {}
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["exampleCSV_source", "exampleCSV_target"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["exampleCSV_source", "exampleCSV_target"]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["system_name", "system_type", "settings", "sql"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["exampleCSV_source"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["csv"]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["path"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["/usr/local/lib/R/site-library/DQAstats/demo_data"]
                }
              ]
            },
            {
              "type": "logical",
              "attributes": {},
              "value": [null]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["system_name", "system_type", "settings", "sql"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["exampleCSV_target"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["csv"]
            },
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["path"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["/usr/local/lib/R/site-library/DQAstats/demo_data"]
                }
              ]
            },
            {
              "type": "logical",
              "attributes": {},
              "value": [null]
            }
          ]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [false]
        },
        {
          "type": "NULL"
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["pl.atemporal.item01"]
            }
          },
          "value": [
            {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["description", "counts", "statistics"]
                }
              },
              "value": [
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "description", "var_dependent", "var_independent", "filter", "join_crit", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Pl.atemporal.Item01"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Persons with a negative bank balance cannot be credit worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_bank_balance"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["^(-)"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_person_id"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["constraints", "var_type"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\":\"no\"}"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["enumerated"]
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["name", "var_dependent", "var_independent", "filter", "join_crit", "checks"]
                        }
                      },
                      "value": [
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["Pl.atemporal.Item01"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_bank_balance"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["^(-)"]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_person_id"]
                        },
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["constraints", "var_type"]
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["{\"value_set\":\"no\"}"]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["enumerated"]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_credit_worthy"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [2]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [2]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_source"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["enumerated"]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["cnt", "type"]
                        }
                      },
                      "value": [
                        {
                          "type": "list",
                          "attributes": {
                            "names": {
                              "type": "character",
                              "attributes": {},
                              "value": ["variable", "n", "valids", "missings", "distinct", "sourcesystem"]
                            },
                            "row.names": {
                              "type": "integer",
                              "attributes": {},
                              "value": [1]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["data.table", "data.frame"]
                            },
                            ".internal.selfref": {
                              "type": "externalptr",
                              "attributes": {},
                              "value": {}
                            }
                          },
                          "value": [
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["dqa_credit_worthy"]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [4]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [4]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [0]
                            },
                            {
                              "type": "integer",
                              "attributes": {},
                              "value": [2]
                            },
                            {
                              "type": "character",
                              "attributes": {},
                              "value": ["exampleCSV_target"]
                            }
                          ]
                        },
                        {
                          "type": "character",
                          "attributes": {},
                          "value": ["enumerated"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "list",
                  "attributes": {
                    "names": {
                      "type": "character",
                      "attributes": {},
                      "value": ["source_data", "target_data"]
                    }
                  },
                  "value": [
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["no"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [2]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [100]
                        }
                      ]
                    },
                    {
                      "type": "list",
                      "attributes": {
                        "row.names": {
                          "type": "integer",
                          "attributes": {},
                          "value": [1, 2]
                        },
                        "class": {
                          "type": "character",
                          "attributes": {},
                          "value": ["data.table", "data.frame"]
                        },
                        ".internal.selfref": {
                          "type": "externalptr",
                          "attributes": {},
                          "value": {}
                        },
                        "names": {
                          "type": "character",
                          "attributes": {},
                          "value": ["dqa_credit_worthy", "Freq", "% Valid"]
                        }
                      },
                      "value": [
                        {
                          "type": "integer",
                          "attributes": {
                            "levels": {
                              "type": "character",
                              "attributes": {},
                              "value": ["no", "yes"]
                            },
                            "class": {
                              "type": "character",
                              "attributes": {},
                              "value": ["factor"]
                            }
                          },
                          "value": [1, 2]
                        },
                        {
                          "type": "integer",
                          "attributes": {},
                          "value": [2, 2]
                        },
                        {
                          "type": "double",
                          "attributes": {},
                          "value": [50, 50]
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "row.names": {
              "type": "integer",
              "attributes": {},
              "value": [1, 2]
            },
            ".internal.selfref": {
              "type": "externalptr",
              "attributes": {},
              "value": {}
            },
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["data.table", "data.frame"]
            },
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["source_system_name", "source_system_type"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["exampleCSV_source", "exampleCSV_target"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["csv", "csv"]
            }
          ]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [false]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [true]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["logfile_dir", "populated_old_logfiles_list"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["/tmp/Rtmp34oS8t/"]
            },
            {
              "type": "logical",
              "attributes": {},
              "value": [true]
            }
          ]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["Variable", "Missings (source)", "Missings [%] (source)", "Missings (target)", "Missings [%] (target)"]
            },
            "row.names": {
              "type": "integer",
              "attributes": {},
              "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
            },
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["data.table", "data.frame"]
            },
            ".internal.selfref": {
              "type": "externalptr",
              "attributes": {},
              "value": {}
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["Age in years", "Amount of credit", "Birthdate", "Credit worthy?", "Current bank balance", "Date of contact", "Forename", "Income", "Job", "Name", "Person ID", "Sex"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["0", "13", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["0", "56.52", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["0", "13", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["0", "56.52", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"]
            }
          ]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [false]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [true]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["dqa_name"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["dqa_name"]
            }
          ]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [false]
        },
        {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["Pl.atemporal.Item01"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["pl.atemporal.item01"]
            }
          ]
        }
      ]
    }

