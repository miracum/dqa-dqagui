# DQAgui shiny app / launch_app() works

    {
      "sitename": "DEMO",
      "keys_source": "dqa_example_data_01.csv",
      "datamap": {
        "source_data": [
          {
            "variable": "Person ID",
            "n": "23",
            "valids": "23",
            "missings": "0",
            "distinct": "16"
          },
          {
            "variable": "Credit worthy?",
            "n": "23",
            "valids": "23",
            "missings": "0",
            "distinct": "2"
          }
        ],
        "target_data": [
          {
            "variable": "Person ID",
            "n": "23",
            "valids": "23",
            "missings": "0",
            "distinct": "16"
          },
          {
            "variable": "Credit worthy?",
            "n": "23",
            "valids": "23",
            "missings": "0",
            "distinct": "2"
          }
        ]
      },
      "finished_onstart": true,
      "affectedids_exported": true,
      "ncores": 2,
      "aggregated_exported": true,
      "pl": {
        "atemp_vars": [
          {
            "designation": "Credit worthy?",
            "variable_name": "dqa_credit_worthy",
            "variable_type": "enumerated",
            "plausibility_relation": "{\"atemporal\": {\"dqa_bank_balance\": {\"name\": \"Pl.atemporal.Item01\", \"description\": \"Persons with a negative bank balance cannot be credit worthy\", \"filter\": {\"exampleCSV_source\": \"^(-)\", \"exampleCSV_target\": \"^(-)\"}, \"join_crit\": \"dqa_person_id\", \"constraints\": {\"value_set\": {\"exampleCSV_source\": [\"no\"], \"exampleCSV_target\": [\"no\"]}}}}}"
          }
        ],
        "uniq_vars": [
          {
            "designation": "Person ID",
            "variable_name": "dqa_person_id",
            "variable_type": "string",
            "plausibility_relation": "{\"uniqueness\": {\"dqa_name\": {\"name\": \"Pl.uniqueness.Item01\",\"description\": \"The last name of a person must be identical in all entries for one person ID.\"}}}"
          }
        ],
        "atemp_helper_vars": "dqa_bank_balance",
        "atemp_possible": true,
        "uniq_helper_vars": "dqa_name",
        "uniq_possible": true
      },
      "datamap_email": "your.name@mail.company.org",
      "headless": false,
      "keys_target": "dqa_example_data_02.csv",
      "dqa_assessment": [
        {
          "designation": "Person ID",
          "source_variable_name": "PERSON_ID",
          "variable_name": "dqa_person_id",
          "variable_type": "string",
          "key": "dqa.person_id",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Forename",
          "source_variable_name": "FORENAME",
          "variable_name": "dqa_forename",
          "variable_type": "string",
          "key": "dqa.forename",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Name",
          "source_variable_name": "NAME",
          "variable_name": "dqa_name",
          "variable_type": "string",
          "key": "dqa.name",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Age in years",
          "source_variable_name": "AGE",
          "variable_name": "dqa_age_years",
          "variable_type": "integer",
          "key": "dqa.age_years",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Birthdate",
          "source_variable_name": "BIRTHDATE",
          "variable_name": "dqa_birthdate",
          "variable_type": "datetime",
          "key": "dqa.birthdate",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Sex",
          "source_variable_name": "SEX",
          "variable_name": "dqa_sex",
          "variable_type": "enumerated",
          "key": "dqa.sex",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Income",
          "source_variable_name": "INCOME",
          "variable_name": "dqa_income",
          "variable_type": "integer",
          "key": "dqa.income",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Job",
          "source_variable_name": "JOB",
          "variable_name": "dqa_job",
          "variable_type": "string",
          "key": "dqa.job",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Current bank balance",
          "source_variable_name": "BANK-BALANCE",
          "variable_name": "dqa_bank_balance",
          "variable_type": "integer",
          "key": "dqa.bank_balance",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Credit worthy?",
          "source_variable_name": "CREDIT-WORTHY",
          "variable_name": "dqa_credit_worthy",
          "variable_type": "enumerated",
          "key": "dqa.credit_worthy",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Amount of credit",
          "source_variable_name": "CREDIT-AMOUNT",
          "variable_name": "dqa_credit_amount",
          "variable_type": "integer",
          "key": "dqa.credit_amount",
          "source_table_name": "dqa_example_data_01.csv"
        },
        {
          "designation": "Date of contact",
          "source_variable_name": "CONTACT-DATE",
          "variable_name": "dqa_contact_date",
          "variable_type": "datetime",
          "key": "dqa.contact_date",
          "source_table_name": "dqa_example_data_01.csv"
        }
      ],
      "results_descriptive": {
        "Age in years": {
          "description": {
            "source_data": {
              "name": "Age in years",
              "internal_variable_name": "dqa_age_years",
              "description": "The age of the person at the time of contact.",
              "var_name": "AGE",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} "
              }
            },
            "target_data": {
              "var_name": "AGE",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} "
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_age_years",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 21,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "integer"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_age_years",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 21,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "integer"
            }
          },
          "statistics": {
            "source_data": [
              {
                " ": "Mean",
                " .1": "63"
              },
              {
                " ": "Minimum",
                " .1": "22"
              },
              {
                " ": "Median",
                " .1": "64"
              },
              {
                " ": "Maximum",
                " .1": "94"
              },
              {
                " ": "SD",
                " .1": "22.56"
              },
              {
                " ": "Negativ",
                " .1": "0"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "23"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "0"
              },
              {
                " ": "Variance",
                " .1": "509"
              },
              {
                " ": "Range",
                " .1": "72"
              }
            ],
            "target_data": [
              {
                " ": "Mean",
                " .1": "67.35"
              },
              {
                " ": "Minimum",
                " .1": "22"
              },
              {
                " ": "Median",
                " .1": "64"
              },
              {
                " ": "Maximum",
                " .1": "175"
              },
              {
                " ": "SD",
                " .1": "32.45"
              },
              {
                " ": "Negativ",
                " .1": "0"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "23"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "1"
              },
              {
                " ": "Variance",
                " .1": "1052.87"
              },
              {
                " ": "Range",
                " .1": "153"
              }
            ]
          }
        },
        "Amount of credit": {
          "description": {
            "source_data": {
              "name": "Amount of credit",
              "internal_variable_name": "dqa_credit_amount",
              "description": "That's the amount of credit the person has used",
              "var_name": "CREDIT-AMOUNT",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
              }
            },
            "target_data": {
              "var_name": "CREDIT-AMOUNT",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_credit_amount",
                  "n": 23,
                  "valids": 10,
                  "missings": 13,
                  "distinct": 10,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "integer"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_credit_amount",
                  "n": 23,
                  "valids": 10,
                  "missings": 13,
                  "distinct": 10,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "integer"
            }
          },
          "statistics": {
            "source_data": [
              {
                " ": "Mean",
                " .1": "39220"
              },
              {
                " ": "Minimum",
                " .1": "12200"
              },
              {
                " ": "Median",
                " .1": "33350"
              },
              {
                " ": "Maximum",
                " .1": "72800"
              },
              {
                " ": "SD",
                " .1": "21447.19"
              },
              {
                " ": "Negativ",
                " .1": "0"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "10"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "0"
              },
              {
                " ": "Variance",
                " .1": "459981777.78"
              },
              {
                " ": "Range",
                " .1": "60600"
              }
            ],
            "target_data": [
              {
                " ": "Mean",
                " .1": "39220"
              },
              {
                " ": "Minimum",
                " .1": "12200"
              },
              {
                " ": "Median",
                " .1": "33350"
              },
              {
                " ": "Maximum",
                " .1": "72800"
              },
              {
                " ": "SD",
                " .1": "21447.19"
              },
              {
                " ": "Negativ",
                " .1": "0"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "10"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "0"
              },
              {
                " ": "Variance",
                " .1": "459981777.78"
              },
              {
                " ": "Range",
                " .1": "60600"
              }
            ]
          }
        },
        "Birthdate": {
          "description": {
            "source_data": {
              "name": "Birthdate",
              "internal_variable_name": "dqa_birthdate",
              "description": "The date of birth written as dd.mm.yyyy",
              "var_name": "BIRTHDATE",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "datetime",
                "constraints": "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}"
              }
            },
            "target_data": {
              "var_name": "BIRTHDATE",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "datetime",
                "constraints": "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}"
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_birthdate",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 16,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "datetime"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_birthdate",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 16,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "datetime"
            }
          },
          "statistics": {
            "source_data": [
              {
                " ": "Min.",
                " .1": "1921-02-19"
              },
              {
                " ": "1st Qu.",
                " .1": "1932-09-17"
              },
              {
                " ": "Median",
                " .1": "1951-07-03"
              },
              {
                " ": "Mean",
                " .1": "1950-09-25"
              },
              {
                " ": "3rd Qu.",
                " .1": "1965-05-10"
              },
              {
                " ": "Max.",
                " .1": "1990-05-26"
              }
            ],
            "target_data": [
              {
                " ": "Min.",
                " .1": "1921-02-19"
              },
              {
                " ": "1st Qu.",
                " .1": "1932-09-17"
              },
              {
                " ": "Median",
                " .1": "1951-07-03"
              },
              {
                " ": "Mean",
                " .1": "1950-09-25"
              },
              {
                " ": "3rd Qu.",
                " .1": "1965-05-10"
              },
              {
                " ": "Max.",
                " .1": "1990-05-26"
              }
            ]
          }
        },
        "Credit worthy?": {
          "description": {
            "source_data": {
              "name": "Credit worthy?",
              "internal_variable_name": "dqa_credit_worthy",
              "description": "Indicates whether the person is creditworthy at the time of the contact",
              "var_name": "CREDIT-WORTHY",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "enumerated",
                "constraints": "{\"value_set\": [\"yes\", \"no\"]}"
              }
            },
            "target_data": {
              "var_name": "CREDIT-WORTHY",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "enumerated",
                "constraints": "{\"value_set\": [\"yes\", \"no\"]}"
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_credit_worthy",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 2,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "enumerated"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_credit_worthy",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 2,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "enumerated"
            }
          },
          "statistics": {
            "source_data": [
              {
                "dqa_credit_worthy": "no",
                "Freq": 13,
                "% Valid": 56.5217
              },
              {
                "dqa_credit_worthy": "yes",
                "Freq": 10,
                "% Valid": 43.4783
              }
            ],
            "target_data": [
              {
                "dqa_credit_worthy": "no",
                "Freq": 13,
                "% Valid": 56.5217
              },
              {
                "dqa_credit_worthy": "yes",
                "Freq": 10,
                "% Valid": 43.4783
              }
            ]
          }
        },
        "Current bank balance": {
          "description": {
            "source_data": {
              "name": "Current bank balance",
              "internal_variable_name": "dqa_bank_balance",
              "description": "The bank-balance at the time of contact",
              "var_name": "BANK-BALANCE",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} "
              }
            },
            "target_data": {
              "var_name": "BANK-BALANCE",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} "
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_bank_balance",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 22,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "integer"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_bank_balance",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 22,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "integer"
            }
          },
          "statistics": {
            "source_data": [
              {
                " ": "Mean",
                " .1": "35152.17"
              },
              {
                " ": "Minimum",
                " .1": "-34200"
              },
              {
                " ": "Median",
                " .1": "18800"
              },
              {
                " ": "Maximum",
                " .1": "124100"
              },
              {
                " ": "SD",
                " .1": "39516.63"
              },
              {
                " ": "Negativ",
                " .1": "2"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "21"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "0"
              },
              {
                " ": "Variance",
                " .1": "1561564426.88"
              },
              {
                " ": "Range",
                " .1": "158300"
              }
            ],
            "target_data": [
              {
                " ": "Mean",
                " .1": "26395.65"
              },
              {
                " ": "Minimum",
                " .1": "-64200"
              },
              {
                " ": "Median",
                " .1": "12800"
              },
              {
                " ": "Maximum",
                " .1": "124100"
              },
              {
                " ": "SD",
                " .1": "46097.8"
              },
              {
                " ": "Negativ",
                " .1": "4"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "19"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "0"
              },
              {
                " ": "Variance",
                " .1": "2125006798.42"
              },
              {
                " ": "Range",
                " .1": "188300"
              }
            ]
          }
        },
        "Date of contact": {
          "description": {
            "source_data": {
              "name": "Date of contact",
              "internal_variable_name": "dqa_contact_date",
              "description": "Date of contact",
              "var_name": "CONTACT-DATE",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "datetime",
                "constraints": "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}"
              }
            },
            "target_data": {
              "var_name": "CONTACT-DATE",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "datetime",
                "constraints": "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}"
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_contact_date",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 23,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "datetime"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_contact_date",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 23,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "datetime"
            }
          },
          "statistics": {
            "source_data": [
              {
                " ": "Min.",
                " .1": "2011-10-12"
              },
              {
                " ": "1st Qu.",
                " .1": "2012-08-11"
              },
              {
                " ": "Median",
                " .1": "2013-10-02"
              },
              {
                " ": "Mean",
                " .1": "2013-10-28"
              },
              {
                " ": "3rd Qu.",
                " .1": "2014-12-21"
              },
              {
                " ": "Max.",
                " .1": "2015-12-20"
              }
            ],
            "target_data": [
              {
                " ": "Min.",
                " .1": "2011-10-12"
              },
              {
                " ": "1st Qu.",
                " .1": "2012-08-11"
              },
              {
                " ": "Median",
                " .1": "2013-10-02"
              },
              {
                " ": "Mean",
                " .1": "2013-10-28"
              },
              {
                " ": "3rd Qu.",
                " .1": "2014-12-21"
              },
              {
                " ": "Max.",
                " .1": "2015-12-20"
              }
            ]
          }
        },
        "Forename": {
          "description": {
            "source_data": {
              "name": "Forename",
              "internal_variable_name": "dqa_forename",
              "description": "The Forename of the person.",
              "var_name": "FORENAME",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            },
            "target_data": {
              "var_name": "FORENAME",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_forename",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 17,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "string"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_forename",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 16,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "string"
            }
          },
          "statistics": {
            "source_data": [
              {
                "dqa_forename": "Zenaida",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_forename": "Geraldine",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_forename": "Williams",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_forename": "Wayne",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_forename": "Dorothy",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_forename": "Lawrence",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Janet",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Martin",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Georgina",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Elliott",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Gilberto",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Annie",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Karen",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "John",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Susan",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Elijah",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Miriam",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ],
            "target_data": [
              {
                "dqa_forename": "Geraldine",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_forename": "Zenaida",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_forename": "Williams",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_forename": "Wayne",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_forename": "Dorothy",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_forename": "Lawrence",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Janet",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Martin",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Georgina",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Elliott",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Gilberto",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Annie",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Karen",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "John",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Susan",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_forename": "Elijah",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ]
          }
        },
        "Income": {
          "description": {
            "source_data": {
              "name": "Income",
              "internal_variable_name": "dqa_income",
              "description": "The income of the person at the time of contact",
              "var_name": "INCOME",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
              }
            },
            "target_data": {
              "var_name": "INCOME",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "integer",
                "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_income",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 23,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "integer"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_income",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 23,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "integer"
            }
          },
          "statistics": {
            "source_data": [
              {
                " ": "Mean",
                " .1": "68826.09"
              },
              {
                " ": "Minimum",
                " .1": "3000"
              },
              {
                " ": "Median",
                " .1": "59000"
              },
              {
                " ": "Maximum",
                " .1": "145000"
              },
              {
                " ": "SD",
                " .1": "46841.76"
              },
              {
                " ": "Negativ",
                " .1": "0"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "23"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "0"
              },
              {
                " ": "Variance",
                " .1": "2194150197.63"
              },
              {
                " ": "Range",
                " .1": "142000"
              }
            ],
            "target_data": [
              {
                " ": "Mean",
                " .1": "68391.3"
              },
              {
                " ": "Minimum",
                " .1": "-5000"
              },
              {
                " ": "Median",
                " .1": "59000"
              },
              {
                " ": "Maximum",
                " .1": "145000"
              },
              {
                " ": "SD",
                " .1": "47502.86"
              },
              {
                " ": "Negativ",
                " .1": "1"
              },
              {
                " ": "Zero",
                " .1": "0"
              },
              {
                " ": "Positive",
                " .1": "22"
              },
              {
                " ": "OutLo",
                " .1": "0"
              },
              {
                " ": "OutHi",
                " .1": "0"
              },
              {
                " ": "Variance",
                " .1": "2256521739.13"
              },
              {
                " ": "Range",
                " .1": "150000"
              }
            ]
          }
        },
        "Job": {
          "description": {
            "source_data": {
              "name": "Job",
              "internal_variable_name": "dqa_job",
              "description": "The job of the person at the time of contact",
              "var_name": "JOB",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            },
            "target_data": {
              "var_name": "JOB",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_job",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 15,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "string"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_job",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 15,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "string"
            }
          },
          "statistics": {
            "source_data": [
              {
                "dqa_job": "Bank manager",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_job": "Magician",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_job": "Student",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Pilot",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Lawyer",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Singer",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Photographer",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Farmer",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Professor",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Engineer",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Researcher",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Chemist",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Gardener",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Psychologist",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Comedian",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ],
            "target_data": [
              {
                "dqa_job": "Bank manager",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_job": "Magician",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_job": "Student",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Pilot",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Lawyer",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Singer",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_job": "Photographer",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Farmer",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Professor",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Engineer",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Researcher",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Chemist",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Gardener",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Psychologist",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_job": "Comedian",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ]
          }
        },
        "Name": {
          "description": {
            "source_data": {
              "name": "Name",
              "internal_variable_name": "dqa_name",
              "description": "The Surname of the person.",
              "var_name": "NAME",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            },
            "target_data": {
              "var_name": "NAME",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_name",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 16,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "string"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_name",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 16,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "string"
            }
          },
          "statistics": {
            "source_data": [
              {
                "dqa_name": "Jackson",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_name": "Staggs",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_name": "Rodriguez",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_name": "Burdett",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_name": "Simpson",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_name": "Daniels",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Dardar",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Jones",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Cook",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Eatmon",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Kenney",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Stock",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Shuck",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Malloy",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Kirkland",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Sutton",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ],
            "target_data": [
              {
                "dqa_name": "Jackson",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_name": "Staggs",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_name": "Rodriguez",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_name": "Burdett",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_name": "Simpson",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_name": "Daniels",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Dardar",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Jones",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Cook",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Eatmon",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Kenney",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Stock",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Shuck",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Malloy",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Kirkland",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_name": "Sutton",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ]
          }
        },
        "Person ID": {
          "description": {
            "source_data": {
              "name": "Person ID",
              "internal_variable_name": "dqa_person_id",
              "description": "Each person has its own person-id. It stays the same over the whole live of the person and does not change.",
              "var_name": "PERSON_ID",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            },
            "target_data": {
              "var_name": "PERSON_ID",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "string",
                "constraints": null
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_person_id",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 16,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "string"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_person_id",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 16,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "string"
            }
          },
          "statistics": {
            "source_data": [
              {
                "dqa_person_id": "1",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_person_id": "7",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_person_id": "5",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_person_id": "11",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_person_id": "15",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_person_id": "2",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "3",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "4",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "6",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "8",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "9",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "10",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "12",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "13",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "14",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "16",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ],
            "target_data": [
              {
                "dqa_person_id": "1",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_person_id": "7",
                "Freq": 3,
                "% Valid": 13.0435
              },
              {
                "dqa_person_id": "5",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_person_id": "11",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_person_id": "15",
                "Freq": 2,
                "% Valid": 8.6957
              },
              {
                "dqa_person_id": "2",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "3",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "4",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "6",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "8",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "9",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "10",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "12",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "13",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "14",
                "Freq": 1,
                "% Valid": 4.3478
              },
              {
                "dqa_person_id": "16",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ]
          }
        },
        "Sex": {
          "description": {
            "source_data": {
              "name": "Sex",
              "internal_variable_name": "dqa_sex",
              "description": "The sex of the person in one letter: m, f or x for unknown.",
              "var_name": "SEX",
              "table_name": "dqa_example_data_01.csv",
              "checks": {
                "var_type": "enumerated",
                "constraints": "{\"value_set\":[\"m\", \"f\", \"x\"]} "
              }
            },
            "target_data": {
              "var_name": "SEX",
              "table_name": "dqa_example_data_02.csv",
              "checks": {
                "var_type": "enumerated",
                "constraints": "{\"value_set\":[\"male\", \"female\", \"unknown\"]} "
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_sex",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 2,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "enumerated"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_sex",
                  "n": 23,
                  "valids": 23,
                  "missings": 0,
                  "distinct": 3,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "enumerated"
            }
          },
          "statistics": {
            "source_data": [
              {
                "dqa_sex": "f",
                "Freq": 13,
                "% Valid": 56.5217
              },
              {
                "dqa_sex": "m",
                "Freq": 10,
                "% Valid": 43.4783
              }
            ],
            "target_data": [
              {
                "dqa_sex": "female",
                "Freq": 12,
                "% Valid": 52.1739
              },
              {
                "dqa_sex": "male",
                "Freq": 10,
                "% Valid": 43.4783
              },
              {
                "dqa_sex": "abc",
                "Freq": 1,
                "% Valid": 4.3478
              }
            ]
          }
        }
      },
      "data_plausibility": {
        "atemporal": {
          "pl.atemporal.item01": {
            "source_data": {
              "name": "Pl.atemporal.Item01",
              "description": "Persons with a negative bank balance cannot be credit worthy",
              "var_dependent": "dqa_credit_worthy",
              "var_independent": "dqa_bank_balance",
              "filter": "^(-)",
              "join_crit": "dqa_person_id",
              "checks": {
                "constraints": "{\"value_set\":[\"no\"]}"
              }
            },
            "target_data": {
              "name": "Pl.atemporal.Item01",
              "description": "Persons with a negative bank balance cannot be credit worthy",
              "var_dependent": "dqa_credit_worthy",
              "var_independent": "dqa_bank_balance",
              "filter": "^(-)",
              "join_crit": "dqa_person_id",
              "checks": {
                "constraints": "{\"value_set\":[\"no\"]}"
              }
            }
          }
        }
      },
      "results_plausibility_unique": {
        "dqa_name": {
          "description": "The last name of a person must be identical in all entries for one person ID.",
          "source_data": {
            "message": "No duplicate occurrences of dqa_person_id found in association with dqa_name.",
            "error": "FALSE"
          },
          "target_data": {
            "message": "No duplicate occurrences of dqa_person_id found in association with dqa_name.",
            "error": "FALSE"
          }
        }
      },
      "utilspath": "/usr/local/lib/R/site-library/DQAstats/demo_data/utilities/",
      "current_date": "20. June 2022",
      "checks": {
        "value_conformance": [
          {
            "Variable": "Age in years",
            "Check Source Data": "passed",
            "Check Target Data": "failed"
          },
          {
            "Variable": "Amount of credit",
            "Check Source Data": "passed",
            "Check Target Data": "passed"
          },
          {
            "Variable": "Birthdate",
            "Check Source Data": "failed",
            "Check Target Data": "failed"
          },
          {
            "Variable": "Credit worthy?",
            "Check Source Data": "passed",
            "Check Target Data": "passed"
          },
          {
            "Variable": "Current bank balance",
            "Check Source Data": "failed",
            "Check Target Data": "failed"
          },
          {
            "Variable": "Date of contact",
            "Check Source Data": "failed",
            "Check Target Data": "failed"
          },
          {
            "Variable": "Income",
            "Check Source Data": "passed",
            "Check Target Data": "failed"
          },
          {
            "Variable": "Sex",
            "Check Source Data": "passed",
            "Check Target Data": "failed"
          },
          {
            "Variable": "pl.atemporal.item01",
            "Check Source Data": "passed",
            "Check Target Data": "failed"
          }
        ],
        "etl": [
          {
            "Variable": "Age in years",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Amount of credit",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Birthdate",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Credit worthy?",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Current bank balance",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Date of contact",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Forename",
            "Check Distincts": "failed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Income",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Job",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Name",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Person ID",
            "Check Distincts": "passed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          },
          {
            "Variable": "Sex",
            "Check Distincts": "failed",
            "Check Valids": "passed",
            "Check Missings": "passed"
          }
        ]
      },
      "variable_list": {
        "Age in years": "dqa_age_years",
        "Amount of credit": "dqa_credit_amount",
        "Birthdate": "dqa_birthdate",
        "Credit worthy?": "dqa_credit_worthy",
        "Current bank balance": "dqa_bank_balance",
        "Date of contact": "dqa_contact_date",
        "Forename": "dqa_forename",
        "Income": "dqa_income",
        "Job": "dqa_job",
        "Name": "dqa_name",
        "Person ID": "dqa_person_id",
        "Sex": "dqa_sex"
      },
      "sitenames": {
        "undefined": "undefined"
      },
      "restricting_date": {
        "use_it": false
      },
      "data_target": {},
      "system_types": "csv",
      "settings": {
        "exampleCSV_source": {},
        "exampleCSV_target": {}
      },
      "mdr": [
        {
          "designation": "Person ID",
          "source_variable_name": "PERSON_ID",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.person_id",
          "variable_name": "dqa_person_id",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "Each person has its own person-id. It stays the same over the whole live of the person and does not change.",
          "data_map": 1,
          "plausibility_relation": "{\"uniqueness\": {\"dqa_name\": {\"name\": \"Pl.uniqueness.Item01\",\"description\": \"The last name of a person must be identical in all entries for one person ID.\"}}}"
        },
        {
          "designation": "Forename",
          "source_variable_name": "FORENAME",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.forename",
          "variable_name": "dqa_forename",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "The Forename of the person."
        },
        {
          "designation": "Name",
          "source_variable_name": "NAME",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.name",
          "variable_name": "dqa_name",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "The Surname of the person."
        },
        {
          "designation": "Age in years",
          "source_variable_name": "AGE",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.age_years",
          "variable_name": "dqa_age_years",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} ",
          "dqa_assessment": 1,
          "definition": "The age of the person at the time of contact."
        },
        {
          "designation": "Birthdate",
          "source_variable_name": "BIRTHDATE",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.birthdate",
          "variable_name": "dqa_birthdate",
          "variable_type": "datetime",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}",
          "dqa_assessment": 1,
          "definition": "The date of birth written as dd.mm.yyyy"
        },
        {
          "designation": "Sex",
          "source_variable_name": "SEX",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.sex",
          "variable_name": "dqa_sex",
          "variable_type": "enumerated",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"value_set\":[\"m\", \"f\", \"x\"]} ",
          "dqa_assessment": 1,
          "definition": "The sex of the person in one letter: m, f or x for unknown."
        },
        {
          "designation": "Income",
          "source_variable_name": "INCOME",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.income",
          "variable_name": "dqa_income",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ",
          "dqa_assessment": 1,
          "definition": "The income of the person at the time of contact"
        },
        {
          "designation": "Job",
          "source_variable_name": "JOB",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.job",
          "variable_name": "dqa_job",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "The job of the person at the time of contact"
        },
        {
          "designation": "Current bank balance",
          "source_variable_name": "BANK-BALANCE",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.bank_balance",
          "variable_name": "dqa_bank_balance",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} ",
          "dqa_assessment": 1,
          "definition": "The bank-balance at the time of contact"
        },
        {
          "designation": "Credit worthy?",
          "source_variable_name": "CREDIT-WORTHY",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.credit_worthy",
          "variable_name": "dqa_credit_worthy",
          "variable_type": "enumerated",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"value_set\": [\"yes\", \"no\"]}",
          "dqa_assessment": 1,
          "definition": "Indicates whether the person is creditworthy at the time of the contact",
          "data_map": 1,
          "plausibility_relation": "{\"atemporal\": {\"dqa_bank_balance\": {\"name\": \"Pl.atemporal.Item01\", \"description\": \"Persons with a negative bank balance cannot be credit worthy\", \"filter\": {\"exampleCSV_source\": \"^(-)\", \"exampleCSV_target\": \"^(-)\"}, \"join_crit\": \"dqa_person_id\", \"constraints\": {\"value_set\": {\"exampleCSV_source\": [\"no\"], \"exampleCSV_target\": [\"no\"]}}}}}"
        },
        {
          "designation": "Amount of credit",
          "source_variable_name": "CREDIT-AMOUNT",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.credit_amount",
          "variable_name": "dqa_credit_amount",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ",
          "dqa_assessment": 1,
          "definition": "That's the amount of credit the person has used"
        },
        {
          "designation": "Date of contact",
          "source_variable_name": "CONTACT-DATE",
          "source_table_name": "dqa_example_data_01.csv",
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv",
          "key": "dqa.contact_date",
          "variable_name": "dqa_contact_date",
          "variable_type": "datetime",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}",
          "dqa_assessment": 1,
          "definition": "Date of contact"
        },
        {
          "designation": "Person ID",
          "source_variable_name": "PERSON_ID",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.person_id",
          "variable_name": "dqa_person_id",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)",
          "data_map": 1
        },
        {
          "designation": "Forename",
          "source_variable_name": "FORENAME",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.forename",
          "variable_name": "dqa_forename",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Name",
          "source_variable_name": "NAME",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.name",
          "variable_name": "dqa_name",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Age in years",
          "source_variable_name": "AGE",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.age_years",
          "variable_name": "dqa_age_years",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} ",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Birthdate",
          "source_variable_name": "BIRTHDATE",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.birthdate",
          "variable_name": "dqa_birthdate",
          "variable_type": "datetime",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Sex",
          "source_variable_name": "SEX",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.sex",
          "variable_name": "dqa_sex",
          "variable_type": "enumerated",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"value_set\":[\"male\", \"female\", \"unknown\"]} ",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Income",
          "source_variable_name": "INCOME",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.income",
          "variable_name": "dqa_income",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Job",
          "source_variable_name": "JOB",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.job",
          "variable_name": "dqa_job",
          "variable_type": "string",
          "restricting_date_var": "CONTACT-DATE",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Current bank balance",
          "source_variable_name": "BANK-BALANCE",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.bank_balance",
          "variable_name": "dqa_bank_balance",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} ",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Credit worthy?",
          "source_variable_name": "CREDIT-WORTHY",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.credit_worthy",
          "variable_name": "dqa_credit_worthy",
          "variable_type": "enumerated",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"value_set\": [\"yes\", \"no\"]}",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)",
          "data_map": 1
        },
        {
          "designation": "Amount of credit",
          "source_variable_name": "CREDIT-AMOUNT",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.credit_amount",
          "variable_name": "dqa_credit_amount",
          "variable_type": "integer",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} ",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        },
        {
          "designation": "Date of contact",
          "source_variable_name": "CONTACT-DATE",
          "source_table_name": "dqa_example_data_02.csv",
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv",
          "key": "dqa.contact_date",
          "variable_name": "dqa_contact_date",
          "variable_type": "datetime",
          "restricting_date_var": "CONTACT-DATE",
          "constraints": "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}",
          "dqa_assessment": 1,
          "definition": "(The definition is missing in the MDR.)"
        }
      ],
      "report_created": true,
      "mdr_filename": "mdr_example_data.csv",
      "getdata_source": false,
      "conformance": {
        "value_conformance": {
          "Age in years": {
            "source_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            },
            "target_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints."
            }
          },
          "Amount of credit": {
            "source_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            },
            "target_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            }
          },
          "Birthdate": {
            "source_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints.",
              "rule": {
                "min": "1950-01-01",
                "max": "1989-12-31",
                "format": "%d.%m.%Y"
              }
            },
            "target_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints.",
              "rule": {
                "min": "1950-01-01",
                "max": "1989-12-31",
                "format": "%d.%m.%Y"
              }
            }
          },
          "Credit worthy?": {
            "source_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            },
            "target_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            }
          },
          "Current bank balance": {
            "source_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints."
            },
            "target_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints."
            }
          },
          "Date of contact": {
            "source_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints.",
              "rule": {
                "min": "2012-01-01",
                "max": "2015-12-31",
                "format": "%d.%m.%Y"
              }
            },
            "target_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints.",
              "rule": {
                "min": "2012-01-01",
                "max": "2015-12-31",
                "format": "%d.%m.%Y"
              }
            }
          },
          "Income": {
            "source_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            },
            "target_data": {
              "conformance_error": true,
              "conformance_results": "Extrem values are not conform with constraints."
            }
          },
          "Sex": {
            "source_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            },
            "target_data": {
              "conformance_error": true,
              "conformance_results": "Levels that are not conform with the value set:  \nabc"
            }
          },
          "pl.atemporal.item01": {
            "source_data": {
              "conformance_error": false,
              "conformance_results": "No 'value conformance' issues found."
            },
            "target_data": {
              "conformance_error": true,
              "conformance_results": "Levels that are not conform with the value set:  \nyes",
              "affected_ids": [
                {
                  "dqa_bank_balance": -36500
                },
                {
                  "dqa_bank_balance": -64200
                }
              ]
            }
          }
        }
      },
      "displaynames": [
        {
          "source_system_name": "exampleCSV_source",
          "displayname": "exampleCSV_source"
        },
        {
          "source_system_name": "exampleCSV_target",
          "displayname": "exampleCSV_target"
        }
      ],
      "source": {
        "system_name": "exampleCSV_source",
        "system_type": "csv",
        "settings": {
          "path": "/usr/local/lib/R/site-library/DQAstats/demo_data"
        },
        "sql": null
      },
      "target": {
        "system_name": "exampleCSV_target",
        "system_type": "csv",
        "settings": {
          "path": "/usr/local/lib/R/site-library/DQAstats/demo_data"
        },
        "sql": null
      },
      "target_is_source": false,
      "data_source": {},
      "results_plausibility_atemporal": {
        "pl.atemporal.item01": {
          "description": {
            "source_data": {
              "name": "Pl.atemporal.Item01",
              "description": "Persons with a negative bank balance cannot be credit worthy",
              "var_dependent": "dqa_credit_worthy",
              "var_independent": "dqa_bank_balance",
              "filter": "^(-)",
              "join_crit": "dqa_person_id",
              "checks": {
                "constraints": "{\"value_set\":[\"no\"]}",
                "var_type": "enumerated"
              }
            },
            "target_data": {
              "name": "Pl.atemporal.Item01",
              "var_dependent": "dqa_credit_worthy",
              "var_independent": "dqa_bank_balance",
              "filter": "^(-)",
              "join_crit": "dqa_person_id",
              "checks": {
                "constraints": "{\"value_set\":[\"no\"]}",
                "var_type": "enumerated"
              }
            }
          },
          "counts": {
            "source_data": {
              "cnt": [
                {
                  "variable": "dqa_credit_worthy",
                  "n": 2,
                  "valids": 2,
                  "missings": 0,
                  "distinct": 1,
                  "sourcesystem": "exampleCSV_source"
                }
              ],
              "type": "enumerated"
            },
            "target_data": {
              "cnt": [
                {
                  "variable": "dqa_credit_worthy",
                  "n": 4,
                  "valids": 4,
                  "missings": 0,
                  "distinct": 2,
                  "sourcesystem": "exampleCSV_target"
                }
              ],
              "type": "enumerated"
            }
          },
          "statistics": {
            "source_data": [
              {
                "dqa_credit_worthy": "no",
                "Freq": 2,
                "% Valid": 100
              }
            ],
            "target_data": [
              {
                "dqa_credit_worthy": "no",
                "Freq": 2,
                "% Valid": 50
              },
              {
                "dqa_credit_worthy": "yes",
                "Freq": 2,
                "% Valid": 50
              }
            ]
          }
        }
      },
      "systems": [
        {
          "source_system_name": "exampleCSV_source",
          "source_system_type": "csv"
        },
        {
          "source_system_name": "exampleCSV_target",
          "source_system_type": "csv"
        }
      ],
      "demo_usage": false,
      "start": true,
      "log": {
        "logfile_dir": "/tmp/Rtmp3dMouL/",
        "populated_old_logfiles_list": true
      },
      "completeness": [
        {
          "Variable": "Age in years",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Amount of credit",
          "Missings (source)": "13",
          "Missings [%] (source)": "56.52",
          "Missings (target)": "13",
          "Missings [%] (target)": "56.52"
        },
        {
          "Variable": "Birthdate",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Credit worthy?",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Current bank balance",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Date of contact",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Forename",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Income",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Job",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Name",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Person ID",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        },
        {
          "Variable": "Sex",
          "Missings (source)": "0",
          "Missings [%] (source)": "0",
          "Missings (target)": "0",
          "Missings [%] (target)": "0"
        }
      ],
      "parallel": false,
      "create_report": true,
      "pl_uniq_vars_filter": {
        "dqa_name": "dqa_name"
      },
      "getdata_target": false,
      "pl_atemp_vars_filter": {
        "Pl.atemporal.Item01": "pl.atemporal.item01"
      }
    }

