# DQAgui shiny app / launch_app() works

    Code
      output
    Output
      $sitename
      [1] "DEMO"
      
      $keys_source
      [1] "dqa_example_data_01.csv"
      
      $end_time
      [1] "2022-06-20 13:46:59 CEST"
      
      $datamap
      $datamap$source_data
               variable  n valids missings distinct
      1:      Person ID 23     23        0       16
      2: Credit worthy? 23     23        0        2
      
      $datamap$target_data
               variable  n valids missings distinct
      1:      Person ID 23     23        0       16
      2: Credit worthy? 23     23        0        2
      
      
      $finished_onstart
      [1] TRUE
      
      $affectedids_exported
      [1] TRUE
      
      $ncores
      [1] 2
      
      $aggregated_exported
      [1] TRUE
      
      $pl
      $pl$atemp_vars
            designation     variable_name variable_type
      1: Credit worthy? dqa_credit_worthy    enumerated
                                                                                                                                                                                                                                                                                                                                     plausibility_relation
      1: {"atemporal": {"dqa_bank_balance": {"name": "Pl.atemporal.Item01", "description": "Persons with a negative bank balance cannot be credit worthy", "filter": {"exampleCSV_source": "^(-)", "exampleCSV_target": "^(-)"}, "join_crit": "dqa_person_id", "constraints": {"value_set": {"exampleCSV_source": ["no"], "exampleCSV_target": ["no"]}}}}}
      
      $pl$uniq_vars
         designation variable_name variable_type
      1:   Person ID dqa_person_id        string
                                                                                                                                                 plausibility_relation
      1: {"uniqueness": {"dqa_name": {"name": "Pl.uniqueness.Item01","description": "The last name of a person must be identical in all entries for one person ID."}}}
      
      $pl$atemp_helper_vars
      [1] "dqa_credit_worthy" "dqa_bank_balance"  "dqa_person_id"    
      
      $pl$atemp_possible
      [1] TRUE
      
      $pl$uniq_helper_vars
      [1] "dqa_person_id" "dqa_name"     
      
      $pl$uniq_possible
      [1] TRUE
      
      
      $datamap_email
      [1] "your.name@mail.company.org"
      
      $headless
      [1] FALSE
      
      $keys_target
      [1] "dqa_example_data_02.csv"
      
      $dqa_assessment
                   designation source_variable_name     variable_name variable_type               key       source_table_name
       1:            Person ID            PERSON_ID     dqa_person_id        string     dqa.person_id dqa_example_data_01.csv
       2:             Forename             FORENAME      dqa_forename        string      dqa.forename dqa_example_data_01.csv
       3:                 Name                 NAME          dqa_name        string          dqa.name dqa_example_data_01.csv
       4:         Age in years                  AGE     dqa_age_years       integer     dqa.age_years dqa_example_data_01.csv
       5:            Birthdate            BIRTHDATE     dqa_birthdate      datetime     dqa.birthdate dqa_example_data_01.csv
       6:                  Sex                  SEX           dqa_sex    enumerated           dqa.sex dqa_example_data_01.csv
       7:               Income               INCOME        dqa_income       integer        dqa.income dqa_example_data_01.csv
       8:                  Job                  JOB           dqa_job        string           dqa.job dqa_example_data_01.csv
       9: Current bank balance         BANK-BALANCE  dqa_bank_balance       integer  dqa.bank_balance dqa_example_data_01.csv
      10:       Credit worthy?        CREDIT-WORTHY dqa_credit_worthy    enumerated dqa.credit_worthy dqa_example_data_01.csv
      11:     Amount of credit        CREDIT-AMOUNT dqa_credit_amount       integer dqa.credit_amount dqa_example_data_01.csv
      12:      Date of contact         CONTACT-DATE  dqa_contact_date      datetime  dqa.contact_date dqa_example_data_01.csv
      
      $results_descriptive
      $results_descriptive$`Age in years`
      $results_descriptive$`Age in years`$description
      $results_descriptive$`Age in years`$description$source_data
      $results_descriptive$`Age in years`$description$source_data$name
      [1] "Age in years"
      
      $results_descriptive$`Age in years`$description$source_data$internal_variable_name
      [1] "dqa_age_years"
      
      $results_descriptive$`Age in years`$description$source_data$description
      [1] "The age of the person at the time of contact."
      
      $results_descriptive$`Age in years`$description$source_data$var_name
      [1] "AGE"
      
      $results_descriptive$`Age in years`$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$`Age in years`$description$source_data$checks
      $results_descriptive$`Age in years`$description$source_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$`Age in years`$description$source_data$checks$constraints
      [1] "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} "
      
      
      
      $results_descriptive$`Age in years`$description$target_data
      $results_descriptive$`Age in years`$description$target_data$var_name
      [1] "AGE"
      
      $results_descriptive$`Age in years`$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$`Age in years`$description$target_data$checks
      $results_descriptive$`Age in years`$description$target_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$`Age in years`$description$target_data$checks$constraints
      [1] "{\"range\":{\"min\":0,\"max\":110,\"unit\":\"a\"}} "
      
      
      
      
      $results_descriptive$`Age in years`$counts
      $results_descriptive$`Age in years`$counts$source_data
      $results_descriptive$`Age in years`$counts$source_data$cnt
              variable  n valids missings distinct      sourcesystem
      1: dqa_age_years 23     23        0       21 exampleCSV_source
      
      $results_descriptive$`Age in years`$counts$source_data$type
      [1] "integer"
      
      
      $results_descriptive$`Age in years`$counts$target_data
      $results_descriptive$`Age in years`$counts$target_data$cnt
              variable  n valids missings distinct      sourcesystem
      1: dqa_age_years 23     23        0       21 exampleCSV_target
      
      $results_descriptive$`Age in years`$counts$target_data$type
      [1] "integer"
      
      
      
      $results_descriptive$`Age in years`$statistics
      $results_descriptive$`Age in years`$statistics$source_data
                        
       1:     Mean    63
       2:  Minimum    22
       3:   Median    64
       4:  Maximum    94
       5:       SD 22.56
       6:  Negativ     0
       7:     Zero     0
       8: Positive    23
       9:    OutLo     0
      10:    OutHi     0
      11: Variance   509
      12:    Range    72
      
      $results_descriptive$`Age in years`$statistics$target_data
                          
       1:     Mean   67.35
       2:  Minimum      22
       3:   Median      64
       4:  Maximum     175
       5:       SD   32.45
       6:  Negativ       0
       7:     Zero       0
       8: Positive      23
       9:    OutLo       0
      10:    OutHi       1
      11: Variance 1052.87
      12:    Range     153
      
      
      
      $results_descriptive$`Amount of credit`
      $results_descriptive$`Amount of credit`$description
      $results_descriptive$`Amount of credit`$description$source_data
      $results_descriptive$`Amount of credit`$description$source_data$name
      [1] "Amount of credit"
      
      $results_descriptive$`Amount of credit`$description$source_data$internal_variable_name
      [1] "dqa_credit_amount"
      
      $results_descriptive$`Amount of credit`$description$source_data$description
      [1] "That's the amount of credit the person has used"
      
      $results_descriptive$`Amount of credit`$description$source_data$var_name
      [1] "CREDIT-AMOUNT"
      
      $results_descriptive$`Amount of credit`$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$`Amount of credit`$description$source_data$checks
      $results_descriptive$`Amount of credit`$description$source_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$`Amount of credit`$description$source_data$checks$constraints
      [1] "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
      
      
      
      $results_descriptive$`Amount of credit`$description$target_data
      $results_descriptive$`Amount of credit`$description$target_data$var_name
      [1] "CREDIT-AMOUNT"
      
      $results_descriptive$`Amount of credit`$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$`Amount of credit`$description$target_data$checks
      $results_descriptive$`Amount of credit`$description$target_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$`Amount of credit`$description$target_data$checks$constraints
      [1] "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
      
      
      
      
      $results_descriptive$`Amount of credit`$counts
      $results_descriptive$`Amount of credit`$counts$source_data
      $results_descriptive$`Amount of credit`$counts$source_data$cnt
                  variable  n valids missings distinct      sourcesystem
      1: dqa_credit_amount 23     10       13       10 exampleCSV_source
      
      $results_descriptive$`Amount of credit`$counts$source_data$type
      [1] "integer"
      
      
      $results_descriptive$`Amount of credit`$counts$target_data
      $results_descriptive$`Amount of credit`$counts$target_data$cnt
                  variable  n valids missings distinct      sourcesystem
      1: dqa_credit_amount 23     10       13       10 exampleCSV_target
      
      $results_descriptive$`Amount of credit`$counts$target_data$type
      [1] "integer"
      
      
      
      $results_descriptive$`Amount of credit`$statistics
      $results_descriptive$`Amount of credit`$statistics$source_data
                               
       1:     Mean        39220
       2:  Minimum        12200
       3:   Median        33350
       4:  Maximum        72800
       5:       SD     21447.19
       6:  Negativ            0
       7:     Zero            0
       8: Positive           10
       9:    OutLo            0
      10:    OutHi            0
      11: Variance 459981777.78
      12:    Range        60600
      
      $results_descriptive$`Amount of credit`$statistics$target_data
                               
       1:     Mean        39220
       2:  Minimum        12200
       3:   Median        33350
       4:  Maximum        72800
       5:       SD     21447.19
       6:  Negativ            0
       7:     Zero            0
       8: Positive           10
       9:    OutLo            0
      10:    OutHi            0
      11: Variance 459981777.78
      12:    Range        60600
      
      
      
      $results_descriptive$Birthdate
      $results_descriptive$Birthdate$description
      $results_descriptive$Birthdate$description$source_data
      $results_descriptive$Birthdate$description$source_data$name
      [1] "Birthdate"
      
      $results_descriptive$Birthdate$description$source_data$internal_variable_name
      [1] "dqa_birthdate"
      
      $results_descriptive$Birthdate$description$source_data$description
      [1] "The date of birth written as dd.mm.yyyy"
      
      $results_descriptive$Birthdate$description$source_data$var_name
      [1] "BIRTHDATE"
      
      $results_descriptive$Birthdate$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$Birthdate$description$source_data$checks
      $results_descriptive$Birthdate$description$source_data$checks$var_type
      [1] "datetime"
      
      $results_descriptive$Birthdate$description$source_data$checks$constraints
      [1] "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}"
      
      
      
      $results_descriptive$Birthdate$description$target_data
      $results_descriptive$Birthdate$description$target_data$var_name
      [1] "BIRTHDATE"
      
      $results_descriptive$Birthdate$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$Birthdate$description$target_data$checks
      $results_descriptive$Birthdate$description$target_data$checks$var_type
      [1] "datetime"
      
      $results_descriptive$Birthdate$description$target_data$checks$constraints
      [1] "{\"datetime\": {\"min\": \"1950-01-01\",\"max\": \"1989-12-31\", \"format\": \"%d.%m.%Y\"}}"
      
      
      
      
      $results_descriptive$Birthdate$counts
      $results_descriptive$Birthdate$counts$source_data
      $results_descriptive$Birthdate$counts$source_data$cnt
              variable  n valids missings distinct      sourcesystem
      1: dqa_birthdate 23     23        0       16 exampleCSV_source
      
      $results_descriptive$Birthdate$counts$source_data$type
      [1] "datetime"
      
      
      $results_descriptive$Birthdate$counts$target_data
      $results_descriptive$Birthdate$counts$target_data$cnt
              variable  n valids missings distinct      sourcesystem
      1: dqa_birthdate 23     23        0       16 exampleCSV_target
      
      $results_descriptive$Birthdate$counts$target_data$type
      [1] "datetime"
      
      
      
      $results_descriptive$Birthdate$statistics
      $results_descriptive$Birthdate$statistics$source_data
                          
      1    Min. 1921-02-19
      2 1st Qu. 1932-09-17
      3  Median 1951-07-03
      4    Mean 1950-09-25
      5 3rd Qu. 1965-05-10
      6    Max. 1990-05-26
      
      $results_descriptive$Birthdate$statistics$target_data
                          
      1    Min. 1921-02-19
      2 1st Qu. 1932-09-17
      3  Median 1951-07-03
      4    Mean 1950-09-25
      5 3rd Qu. 1965-05-10
      6    Max. 1990-05-26
      
      
      
      $results_descriptive$`Credit worthy?`
      $results_descriptive$`Credit worthy?`$description
      $results_descriptive$`Credit worthy?`$description$source_data
      $results_descriptive$`Credit worthy?`$description$source_data$name
      [1] "Credit worthy?"
      
      $results_descriptive$`Credit worthy?`$description$source_data$internal_variable_name
      [1] "dqa_credit_worthy"
      
      $results_descriptive$`Credit worthy?`$description$source_data$description
      [1] "Indicates whether the person is creditworthy at the time of the contact"
      
      $results_descriptive$`Credit worthy?`$description$source_data$var_name
      [1] "CREDIT-WORTHY"
      
      $results_descriptive$`Credit worthy?`$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$`Credit worthy?`$description$source_data$checks
      $results_descriptive$`Credit worthy?`$description$source_data$checks$var_type
      [1] "enumerated"
      
      $results_descriptive$`Credit worthy?`$description$source_data$checks$constraints
      [1] "{\"value_set\": [\"yes\", \"no\"]}"
      
      
      
      $results_descriptive$`Credit worthy?`$description$target_data
      $results_descriptive$`Credit worthy?`$description$target_data$var_name
      [1] "CREDIT-WORTHY"
      
      $results_descriptive$`Credit worthy?`$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$`Credit worthy?`$description$target_data$checks
      $results_descriptive$`Credit worthy?`$description$target_data$checks$var_type
      [1] "enumerated"
      
      $results_descriptive$`Credit worthy?`$description$target_data$checks$constraints
      [1] "{\"value_set\": [\"yes\", \"no\"]}"
      
      
      
      
      $results_descriptive$`Credit worthy?`$counts
      $results_descriptive$`Credit worthy?`$counts$source_data
      $results_descriptive$`Credit worthy?`$counts$source_data$cnt
                  variable  n valids missings distinct      sourcesystem
      1: dqa_credit_worthy 23     23        0        2 exampleCSV_source
      
      $results_descriptive$`Credit worthy?`$counts$source_data$type
      [1] "enumerated"
      
      
      $results_descriptive$`Credit worthy?`$counts$target_data
      $results_descriptive$`Credit worthy?`$counts$target_data$cnt
                  variable  n valids missings distinct      sourcesystem
      1: dqa_credit_worthy 23     23        0        2 exampleCSV_target
      
      $results_descriptive$`Credit worthy?`$counts$target_data$type
      [1] "enumerated"
      
      
      
      $results_descriptive$`Credit worthy?`$statistics
      $results_descriptive$`Credit worthy?`$statistics$source_data
         dqa_credit_worthy Freq  % Valid
      1:                no   13 56.52174
      2:               yes   10 43.47826
      
      $results_descriptive$`Credit worthy?`$statistics$target_data
         dqa_credit_worthy Freq  % Valid
      1:                no   13 56.52174
      2:               yes   10 43.47826
      
      
      
      $results_descriptive$`Current bank balance`
      $results_descriptive$`Current bank balance`$description
      $results_descriptive$`Current bank balance`$description$source_data
      $results_descriptive$`Current bank balance`$description$source_data$name
      [1] "Current bank balance"
      
      $results_descriptive$`Current bank balance`$description$source_data$internal_variable_name
      [1] "dqa_bank_balance"
      
      $results_descriptive$`Current bank balance`$description$source_data$description
      [1] "The bank-balance at the time of contact"
      
      $results_descriptive$`Current bank balance`$description$source_data$var_name
      [1] "BANK-BALANCE"
      
      $results_descriptive$`Current bank balance`$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$`Current bank balance`$description$source_data$checks
      $results_descriptive$`Current bank balance`$description$source_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$`Current bank balance`$description$source_data$checks$constraints
      [1] "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} "
      
      
      
      $results_descriptive$`Current bank balance`$description$target_data
      $results_descriptive$`Current bank balance`$description$target_data$var_name
      [1] "BANK-BALANCE"
      
      $results_descriptive$`Current bank balance`$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$`Current bank balance`$description$target_data$checks
      $results_descriptive$`Current bank balance`$description$target_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$`Current bank balance`$description$target_data$checks$constraints
      [1] "{\"range\":{\"min\":\"-Inf\",\"max\":\"Inf\",\"unit\":\"money\"}} "
      
      
      
      
      $results_descriptive$`Current bank balance`$counts
      $results_descriptive$`Current bank balance`$counts$source_data
      $results_descriptive$`Current bank balance`$counts$source_data$cnt
                 variable  n valids missings distinct      sourcesystem
      1: dqa_bank_balance 23     23        0       22 exampleCSV_source
      
      $results_descriptive$`Current bank balance`$counts$source_data$type
      [1] "integer"
      
      
      $results_descriptive$`Current bank balance`$counts$target_data
      $results_descriptive$`Current bank balance`$counts$target_data$cnt
                 variable  n valids missings distinct      sourcesystem
      1: dqa_bank_balance 23     23        0       22 exampleCSV_target
      
      $results_descriptive$`Current bank balance`$counts$target_data$type
      [1] "integer"
      
      
      
      $results_descriptive$`Current bank balance`$statistics
      $results_descriptive$`Current bank balance`$statistics$source_data
                                
       1:     Mean      35152.17
       2:  Minimum        -34200
       3:   Median         18800
       4:  Maximum        124100
       5:       SD      39516.63
       6:  Negativ             2
       7:     Zero             0
       8: Positive            21
       9:    OutLo             0
      10:    OutHi             0
      11: Variance 1561564426.88
      12:    Range        158300
      
      $results_descriptive$`Current bank balance`$statistics$target_data
                                
       1:     Mean      26395.65
       2:  Minimum        -64200
       3:   Median         12800
       4:  Maximum        124100
       5:       SD       46097.8
       6:  Negativ             4
       7:     Zero             0
       8: Positive            19
       9:    OutLo             0
      10:    OutHi             0
      11: Variance 2125006798.42
      12:    Range        188300
      
      
      
      $results_descriptive$`Date of contact`
      $results_descriptive$`Date of contact`$description
      $results_descriptive$`Date of contact`$description$source_data
      $results_descriptive$`Date of contact`$description$source_data$name
      [1] "Date of contact"
      
      $results_descriptive$`Date of contact`$description$source_data$internal_variable_name
      [1] "dqa_contact_date"
      
      $results_descriptive$`Date of contact`$description$source_data$description
      [1] "Date of contact"
      
      $results_descriptive$`Date of contact`$description$source_data$var_name
      [1] "CONTACT-DATE"
      
      $results_descriptive$`Date of contact`$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$`Date of contact`$description$source_data$checks
      $results_descriptive$`Date of contact`$description$source_data$checks$var_type
      [1] "datetime"
      
      $results_descriptive$`Date of contact`$description$source_data$checks$constraints
      [1] "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}"
      
      
      
      $results_descriptive$`Date of contact`$description$target_data
      $results_descriptive$`Date of contact`$description$target_data$var_name
      [1] "CONTACT-DATE"
      
      $results_descriptive$`Date of contact`$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$`Date of contact`$description$target_data$checks
      $results_descriptive$`Date of contact`$description$target_data$checks$var_type
      [1] "datetime"
      
      $results_descriptive$`Date of contact`$description$target_data$checks$constraints
      [1] "{\"datetime\": {\"min\": \"2012-01-01\",\"max\": \"2015-12-31\", \"format\": \"%d.%m.%Y\"}}"
      
      
      
      
      $results_descriptive$`Date of contact`$counts
      $results_descriptive$`Date of contact`$counts$source_data
      $results_descriptive$`Date of contact`$counts$source_data$cnt
                 variable  n valids missings distinct      sourcesystem
      1: dqa_contact_date 23     23        0       23 exampleCSV_source
      
      $results_descriptive$`Date of contact`$counts$source_data$type
      [1] "datetime"
      
      
      $results_descriptive$`Date of contact`$counts$target_data
      $results_descriptive$`Date of contact`$counts$target_data$cnt
                 variable  n valids missings distinct      sourcesystem
      1: dqa_contact_date 23     23        0       23 exampleCSV_target
      
      $results_descriptive$`Date of contact`$counts$target_data$type
      [1] "datetime"
      
      
      
      $results_descriptive$`Date of contact`$statistics
      $results_descriptive$`Date of contact`$statistics$source_data
                          
      1    Min. 2011-10-12
      2 1st Qu. 2012-08-11
      3  Median 2013-10-02
      4    Mean 2013-10-28
      5 3rd Qu. 2014-12-21
      6    Max. 2015-12-20
      
      $results_descriptive$`Date of contact`$statistics$target_data
                          
      1    Min. 2011-10-12
      2 1st Qu. 2012-08-11
      3  Median 2013-10-02
      4    Mean 2013-10-28
      5 3rd Qu. 2014-12-21
      6    Max. 2015-12-20
      
      
      
      $results_descriptive$Forename
      $results_descriptive$Forename$description
      $results_descriptive$Forename$description$source_data
      $results_descriptive$Forename$description$source_data$name
      [1] "Forename"
      
      $results_descriptive$Forename$description$source_data$internal_variable_name
      [1] "dqa_forename"
      
      $results_descriptive$Forename$description$source_data$description
      [1] "The Forename of the person."
      
      $results_descriptive$Forename$description$source_data$var_name
      [1] "FORENAME"
      
      $results_descriptive$Forename$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$Forename$description$source_data$checks
      $results_descriptive$Forename$description$source_data$checks$var_type
      [1] "string"
      
      $results_descriptive$Forename$description$source_data$checks$constraints
      [1] NA
      
      
      
      $results_descriptive$Forename$description$target_data
      $results_descriptive$Forename$description$target_data$var_name
      [1] "FORENAME"
      
      $results_descriptive$Forename$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$Forename$description$target_data$checks
      $results_descriptive$Forename$description$target_data$checks$var_type
      [1] "string"
      
      $results_descriptive$Forename$description$target_data$checks$constraints
      [1] NA
      
      
      
      
      $results_descriptive$Forename$counts
      $results_descriptive$Forename$counts$source_data
      $results_descriptive$Forename$counts$source_data$cnt
             variable  n valids missings distinct      sourcesystem
      1: dqa_forename 23     23        0       17 exampleCSV_source
      
      $results_descriptive$Forename$counts$source_data$type
      [1] "string"
      
      
      $results_descriptive$Forename$counts$target_data
      $results_descriptive$Forename$counts$target_data$cnt
             variable  n valids missings distinct      sourcesystem
      1: dqa_forename 23     23        0       16 exampleCSV_target
      
      $results_descriptive$Forename$counts$target_data$type
      [1] "string"
      
      
      
      $results_descriptive$Forename$statistics
      $results_descriptive$Forename$statistics$source_data
          dqa_forename Freq   % Valid
       1:      Zenaida    3 13.043478
       2:    Geraldine    2  8.695652
       3:     Williams    2  8.695652
       4:        Wayne    2  8.695652
       5:      Dorothy    2  8.695652
       6:     Lawrence    1  4.347826
       7:        Janet    1  4.347826
       8:       Martin    1  4.347826
       9:     Georgina    1  4.347826
      10:      Elliott    1  4.347826
      11:     Gilberto    1  4.347826
      12:        Annie    1  4.347826
      13:        Karen    1  4.347826
      14:         John    1  4.347826
      15:        Susan    1  4.347826
      16:       Elijah    1  4.347826
      17:       Miriam    1  4.347826
      
      $results_descriptive$Forename$statistics$target_data
          dqa_forename Freq   % Valid
       1:    Geraldine    3 13.043478
       2:      Zenaida    3 13.043478
       3:     Williams    2  8.695652
       4:        Wayne    2  8.695652
       5:      Dorothy    2  8.695652
       6:     Lawrence    1  4.347826
       7:        Janet    1  4.347826
       8:       Martin    1  4.347826
       9:     Georgina    1  4.347826
      10:      Elliott    1  4.347826
      11:     Gilberto    1  4.347826
      12:        Annie    1  4.347826
      13:        Karen    1  4.347826
      14:         John    1  4.347826
      15:        Susan    1  4.347826
      16:       Elijah    1  4.347826
      
      
      
      $results_descriptive$Income
      $results_descriptive$Income$description
      $results_descriptive$Income$description$source_data
      $results_descriptive$Income$description$source_data$name
      [1] "Income"
      
      $results_descriptive$Income$description$source_data$internal_variable_name
      [1] "dqa_income"
      
      $results_descriptive$Income$description$source_data$description
      [1] "The income of the person at the time of contact"
      
      $results_descriptive$Income$description$source_data$var_name
      [1] "INCOME"
      
      $results_descriptive$Income$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$Income$description$source_data$checks
      $results_descriptive$Income$description$source_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$Income$description$source_data$checks$constraints
      [1] "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
      
      
      
      $results_descriptive$Income$description$target_data
      $results_descriptive$Income$description$target_data$var_name
      [1] "INCOME"
      
      $results_descriptive$Income$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$Income$description$target_data$checks
      $results_descriptive$Income$description$target_data$checks$var_type
      [1] "integer"
      
      $results_descriptive$Income$description$target_data$checks$constraints
      [1] "{\"range\":{\"min\":0,\"max\":\"Inf\",\"unit\":\"money\"}} "
      
      
      
      
      $results_descriptive$Income$counts
      $results_descriptive$Income$counts$source_data
      $results_descriptive$Income$counts$source_data$cnt
           variable  n valids missings distinct      sourcesystem
      1: dqa_income 23     23        0       23 exampleCSV_source
      
      $results_descriptive$Income$counts$source_data$type
      [1] "integer"
      
      
      $results_descriptive$Income$counts$target_data
      $results_descriptive$Income$counts$target_data$cnt
           variable  n valids missings distinct      sourcesystem
      1: dqa_income 23     23        0       23 exampleCSV_target
      
      $results_descriptive$Income$counts$target_data$type
      [1] "integer"
      
      
      
      $results_descriptive$Income$statistics
      $results_descriptive$Income$statistics$source_data
                                
       1:     Mean      68826.09
       2:  Minimum          3000
       3:   Median         59000
       4:  Maximum        145000
       5:       SD      46841.76
       6:  Negativ             0
       7:     Zero             0
       8: Positive            23
       9:    OutLo             0
      10:    OutHi             0
      11: Variance 2194150197.63
      12:    Range        142000
      
      $results_descriptive$Income$statistics$target_data
                                
       1:     Mean       68391.3
       2:  Minimum         -5000
       3:   Median         59000
       4:  Maximum        145000
       5:       SD      47502.86
       6:  Negativ             1
       7:     Zero             0
       8: Positive            22
       9:    OutLo             0
      10:    OutHi             0
      11: Variance 2256521739.13
      12:    Range        150000
      
      
      
      $results_descriptive$Job
      $results_descriptive$Job$description
      $results_descriptive$Job$description$source_data
      $results_descriptive$Job$description$source_data$name
      [1] "Job"
      
      $results_descriptive$Job$description$source_data$internal_variable_name
      [1] "dqa_job"
      
      $results_descriptive$Job$description$source_data$description
      [1] "The job of the person at the time of contact"
      
      $results_descriptive$Job$description$source_data$var_name
      [1] "JOB"
      
      $results_descriptive$Job$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$Job$description$source_data$checks
      $results_descriptive$Job$description$source_data$checks$var_type
      [1] "string"
      
      $results_descriptive$Job$description$source_data$checks$constraints
      [1] NA
      
      
      
      $results_descriptive$Job$description$target_data
      $results_descriptive$Job$description$target_data$var_name
      [1] "JOB"
      
      $results_descriptive$Job$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$Job$description$target_data$checks
      $results_descriptive$Job$description$target_data$checks$var_type
      [1] "string"
      
      $results_descriptive$Job$description$target_data$checks$constraints
      [1] NA
      
      
      
      
      $results_descriptive$Job$counts
      $results_descriptive$Job$counts$source_data
      $results_descriptive$Job$counts$source_data$cnt
         variable  n valids missings distinct      sourcesystem
      1:  dqa_job 23     23        0       15 exampleCSV_source
      
      $results_descriptive$Job$counts$source_data$type
      [1] "string"
      
      
      $results_descriptive$Job$counts$target_data
      $results_descriptive$Job$counts$target_data$cnt
         variable  n valids missings distinct      sourcesystem
      1:  dqa_job 23     23        0       15 exampleCSV_target
      
      $results_descriptive$Job$counts$target_data$type
      [1] "string"
      
      
      
      $results_descriptive$Job$statistics
      $results_descriptive$Job$statistics$source_data
               dqa_job Freq   % Valid
       1: Bank manager    3 13.043478
       2:     Magician    3 13.043478
       3:      Student    2  8.695652
       4:        Pilot    2  8.695652
       5:       Lawyer    2  8.695652
       6:       Singer    2  8.695652
       7: Photographer    1  4.347826
       8:       Farmer    1  4.347826
       9:    Professor    1  4.347826
      10:     Engineer    1  4.347826
      11:   Researcher    1  4.347826
      12:      Chemist    1  4.347826
      13:     Gardener    1  4.347826
      14: Psychologist    1  4.347826
      15:     Comedian    1  4.347826
      
      $results_descriptive$Job$statistics$target_data
               dqa_job Freq   % Valid
       1: Bank manager    3 13.043478
       2:     Magician    3 13.043478
       3:      Student    2  8.695652
       4:        Pilot    2  8.695652
       5:       Lawyer    2  8.695652
       6:       Singer    2  8.695652
       7: Photographer    1  4.347826
       8:       Farmer    1  4.347826
       9:    Professor    1  4.347826
      10:     Engineer    1  4.347826
      11:   Researcher    1  4.347826
      12:      Chemist    1  4.347826
      13:     Gardener    1  4.347826
      14: Psychologist    1  4.347826
      15:     Comedian    1  4.347826
      
      
      
      $results_descriptive$Name
      $results_descriptive$Name$description
      $results_descriptive$Name$description$source_data
      $results_descriptive$Name$description$source_data$name
      [1] "Name"
      
      $results_descriptive$Name$description$source_data$internal_variable_name
      [1] "dqa_name"
      
      $results_descriptive$Name$description$source_data$description
      [1] "The Surname of the person."
      
      $results_descriptive$Name$description$source_data$var_name
      [1] "NAME"
      
      $results_descriptive$Name$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$Name$description$source_data$checks
      $results_descriptive$Name$description$source_data$checks$var_type
      [1] "string"
      
      $results_descriptive$Name$description$source_data$checks$constraints
      [1] NA
      
      
      
      $results_descriptive$Name$description$target_data
      $results_descriptive$Name$description$target_data$var_name
      [1] "NAME"
      
      $results_descriptive$Name$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$Name$description$target_data$checks
      $results_descriptive$Name$description$target_data$checks$var_type
      [1] "string"
      
      $results_descriptive$Name$description$target_data$checks$constraints
      [1] NA
      
      
      
      
      $results_descriptive$Name$counts
      $results_descriptive$Name$counts$source_data
      $results_descriptive$Name$counts$source_data$cnt
         variable  n valids missings distinct      sourcesystem
      1: dqa_name 23     23        0       16 exampleCSV_source
      
      $results_descriptive$Name$counts$source_data$type
      [1] "string"
      
      
      $results_descriptive$Name$counts$target_data
      $results_descriptive$Name$counts$target_data$cnt
         variable  n valids missings distinct      sourcesystem
      1: dqa_name 23     23        0       16 exampleCSV_target
      
      $results_descriptive$Name$counts$target_data$type
      [1] "string"
      
      
      
      $results_descriptive$Name$statistics
      $results_descriptive$Name$statistics$source_data
           dqa_name Freq   % Valid
       1:   Jackson    3 13.043478
       2:    Staggs    3 13.043478
       3: Rodriguez    2  8.695652
       4:   Burdett    2  8.695652
       5:   Simpson    2  8.695652
       6:   Daniels    1  4.347826
       7:    Dardar    1  4.347826
       8:     Jones    1  4.347826
       9:      Cook    1  4.347826
      10:    Eatmon    1  4.347826
      11:    Kenney    1  4.347826
      12:     Stock    1  4.347826
      13:     Shuck    1  4.347826
      14:    Malloy    1  4.347826
      15:  Kirkland    1  4.347826
      16:    Sutton    1  4.347826
      
      $results_descriptive$Name$statistics$target_data
           dqa_name Freq   % Valid
       1:   Jackson    3 13.043478
       2:    Staggs    3 13.043478
       3: Rodriguez    2  8.695652
       4:   Burdett    2  8.695652
       5:   Simpson    2  8.695652
       6:   Daniels    1  4.347826
       7:    Dardar    1  4.347826
       8:     Jones    1  4.347826
       9:      Cook    1  4.347826
      10:    Eatmon    1  4.347826
      11:    Kenney    1  4.347826
      12:     Stock    1  4.347826
      13:     Shuck    1  4.347826
      14:    Malloy    1  4.347826
      15:  Kirkland    1  4.347826
      16:    Sutton    1  4.347826
      
      
      
      $results_descriptive$`Person ID`
      $results_descriptive$`Person ID`$description
      $results_descriptive$`Person ID`$description$source_data
      $results_descriptive$`Person ID`$description$source_data$name
      [1] "Person ID"
      
      $results_descriptive$`Person ID`$description$source_data$internal_variable_name
      [1] "dqa_person_id"
      
      $results_descriptive$`Person ID`$description$source_data$description
      [1] "Each person has its own person-id. It stays the same over the whole live of the person and does not change."
      
      $results_descriptive$`Person ID`$description$source_data$var_name
      [1] "PERSON_ID"
      
      $results_descriptive$`Person ID`$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$`Person ID`$description$source_data$checks
      $results_descriptive$`Person ID`$description$source_data$checks$var_type
      [1] "string"
      
      $results_descriptive$`Person ID`$description$source_data$checks$constraints
      [1] NA
      
      
      
      $results_descriptive$`Person ID`$description$target_data
      $results_descriptive$`Person ID`$description$target_data$var_name
      [1] "PERSON_ID"
      
      $results_descriptive$`Person ID`$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$`Person ID`$description$target_data$checks
      $results_descriptive$`Person ID`$description$target_data$checks$var_type
      [1] "string"
      
      $results_descriptive$`Person ID`$description$target_data$checks$constraints
      [1] NA
      
      
      
      
      $results_descriptive$`Person ID`$counts
      $results_descriptive$`Person ID`$counts$source_data
      $results_descriptive$`Person ID`$counts$source_data$cnt
              variable  n valids missings distinct      sourcesystem
      1: dqa_person_id 23     23        0       16 exampleCSV_source
      
      $results_descriptive$`Person ID`$counts$source_data$type
      [1] "string"
      
      
      $results_descriptive$`Person ID`$counts$target_data
      $results_descriptive$`Person ID`$counts$target_data$cnt
              variable  n valids missings distinct      sourcesystem
      1: dqa_person_id 23     23        0       16 exampleCSV_target
      
      $results_descriptive$`Person ID`$counts$target_data$type
      [1] "string"
      
      
      
      $results_descriptive$`Person ID`$statistics
      $results_descriptive$`Person ID`$statistics$source_data
          dqa_person_id Freq   % Valid
       1:             1    3 13.043478
       2:             7    3 13.043478
       3:             5    2  8.695652
       4:            11    2  8.695652
       5:            15    2  8.695652
       6:             2    1  4.347826
       7:             3    1  4.347826
       8:             4    1  4.347826
       9:             6    1  4.347826
      10:             8    1  4.347826
      11:             9    1  4.347826
      12:            10    1  4.347826
      13:            12    1  4.347826
      14:            13    1  4.347826
      15:            14    1  4.347826
      16:            16    1  4.347826
      
      $results_descriptive$`Person ID`$statistics$target_data
          dqa_person_id Freq   % Valid
       1:             1    3 13.043478
       2:             7    3 13.043478
       3:             5    2  8.695652
       4:            11    2  8.695652
       5:            15    2  8.695652
       6:             2    1  4.347826
       7:             3    1  4.347826
       8:             4    1  4.347826
       9:             6    1  4.347826
      10:             8    1  4.347826
      11:             9    1  4.347826
      12:            10    1  4.347826
      13:            12    1  4.347826
      14:            13    1  4.347826
      15:            14    1  4.347826
      16:            16    1  4.347826
      
      
      
      $results_descriptive$Sex
      $results_descriptive$Sex$description
      $results_descriptive$Sex$description$source_data
      $results_descriptive$Sex$description$source_data$name
      [1] "Sex"
      
      $results_descriptive$Sex$description$source_data$internal_variable_name
      [1] "dqa_sex"
      
      $results_descriptive$Sex$description$source_data$description
      [1] "The sex of the person in one letter: m, f or x for unknown."
      
      $results_descriptive$Sex$description$source_data$var_name
      [1] "SEX"
      
      $results_descriptive$Sex$description$source_data$table_name
      [1] "dqa_example_data_01.csv"
      
      $results_descriptive$Sex$description$source_data$checks
      $results_descriptive$Sex$description$source_data$checks$var_type
      [1] "enumerated"
      
      $results_descriptive$Sex$description$source_data$checks$constraints
      [1] "{\"value_set\":[\"m\", \"f\", \"x\"]} "
      
      
      
      $results_descriptive$Sex$description$target_data
      $results_descriptive$Sex$description$target_data$var_name
      [1] "SEX"
      
      $results_descriptive$Sex$description$target_data$table_name
      [1] "dqa_example_data_02.csv"
      
      $results_descriptive$Sex$description$target_data$checks
      $results_descriptive$Sex$description$target_data$checks$var_type
      [1] "enumerated"
      
      $results_descriptive$Sex$description$target_data$checks$constraints
      [1] "{\"value_set\":[\"male\", \"female\", \"unknown\"]} "
      
      
      
      
      $results_descriptive$Sex$counts
      $results_descriptive$Sex$counts$source_data
      $results_descriptive$Sex$counts$source_data$cnt
         variable  n valids missings distinct      sourcesystem
      1:  dqa_sex 23     23        0        2 exampleCSV_source
      
      $results_descriptive$Sex$counts$source_data$type
      [1] "enumerated"
      
      
      $results_descriptive$Sex$counts$target_data
      $results_descriptive$Sex$counts$target_data$cnt
         variable  n valids missings distinct      sourcesystem
      1:  dqa_sex 23     23        0        3 exampleCSV_target
      
      $results_descriptive$Sex$counts$target_data$type
      [1] "enumerated"
      
      
      
      $results_descriptive$Sex$statistics
      $results_descriptive$Sex$statistics$source_data
         dqa_sex Freq  % Valid
      1:       f   13 56.52174
      2:       m   10 43.47826
      
      $results_descriptive$Sex$statistics$target_data
         dqa_sex Freq   % Valid
      1:  female   12 52.173913
      2:    male   10 43.478261
      3:     abc    1  4.347826
      
      
      
      
      $data_plausibility
      $data_plausibility$atemporal
      $data_plausibility$atemporal$pl.atemporal.item01
      $data_plausibility$atemporal$pl.atemporal.item01$source_data
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$name
      [1] "Pl.atemporal.Item01"
      
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$description
      [1] "Persons with a negative bank balance cannot be credit worthy"
      
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$var_dependent
      [1] "dqa_credit_worthy"
      
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$var_independent
      [1] "dqa_bank_balance"
      
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$filter
      [1] "^(-)"
      
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$join_crit
      [1] "dqa_person_id"
      
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$checks
      $data_plausibility$atemporal$pl.atemporal.item01$source_data$checks$constraints
      [1] "{\"value_set\":\"no\"}"
      
      
      
      $data_plausibility$atemporal$pl.atemporal.item01$target_data
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$name
      [1] "Pl.atemporal.Item01"
      
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$description
      [1] "Persons with a negative bank balance cannot be credit worthy"
      
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$var_dependent
      [1] "dqa_credit_worthy"
      
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$var_independent
      [1] "dqa_bank_balance"
      
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$filter
      [1] "^(-)"
      
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$join_crit
      [1] "dqa_person_id"
      
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$checks
      $data_plausibility$atemporal$pl.atemporal.item01$target_data$checks$constraints
      [1] "{\"value_set\":\"no\"}"
      
      
      
      
      
      
      $results_plausibility_unique
      $results_plausibility_unique$dqa_name
      $results_plausibility_unique$dqa_name$description
      [1] "The last name of a person must be identical in all entries for one person ID."
      
      $results_plausibility_unique$dqa_name$source_data
      $results_plausibility_unique$dqa_name$source_data$message
      [1] "No duplicate occurrences of dqa_person_id found in association with dqa_name."
      
      $results_plausibility_unique$dqa_name$source_data$error
      [1] "FALSE"
      
      
      $results_plausibility_unique$dqa_name$target_data
      $results_plausibility_unique$dqa_name$target_data$message
      [1] "No duplicate occurrences of dqa_person_id found in association with dqa_name."
      
      $results_plausibility_unique$dqa_name$target_data$error
      [1] "FALSE"
      
      
      
      
      $utilspath
      [1] "/usr/local/lib/R/site-library/DQAstats/demo_data/utilities/"
      
      $current_date
      [1] "20. June 2022"
      
      $checks
      $checks$value_conformance
                     Variable Check Source Data Check Target Data
      1:         Age in years            passed            failed
      2:     Amount of credit            passed            passed
      3:            Birthdate            failed            failed
      4:       Credit worthy?            passed            passed
      5: Current bank balance            failed            failed
      6:      Date of contact            failed            failed
      7:               Income            passed            failed
      8:                  Sex            passed            failed
      9:  pl.atemporal.item01            passed            failed
      
      $checks$etl
                      Variable Check Distincts Check Valids Check Missings
       1:         Age in years          passed       passed         passed
       2:     Amount of credit          passed       passed         passed
       3:            Birthdate          passed       passed         passed
       4:       Credit worthy?          passed       passed         passed
       5: Current bank balance          passed       passed         passed
       6:      Date of contact          passed       passed         passed
       7:             Forename          failed       passed         passed
       8:               Income          passed       passed         passed
       9:                  Job          passed       passed         passed
      10:                 Name          passed       passed         passed
      11:            Person ID          passed       passed         passed
      12:                  Sex          failed       passed         passed
      
      
      $variable_list
      $variable_list$`Age in years`
      [1] "dqa_age_years"
      
      $variable_list$`Amount of credit`
      [1] "dqa_credit_amount"
      
      $variable_list$Birthdate
      [1] "dqa_birthdate"
      
      $variable_list$`Credit worthy?`
      [1] "dqa_credit_worthy"
      
      $variable_list$`Current bank balance`
      [1] "dqa_bank_balance"
      
      $variable_list$`Date of contact`
      [1] "dqa_contact_date"
      
      $variable_list$Forename
      [1] "dqa_forename"
      
      $variable_list$Income
      [1] "dqa_income"
      
      $variable_list$Job
      [1] "dqa_job"
      
      $variable_list$Name
      [1] "dqa_name"
      
      $variable_list$`Person ID`
      [1] "dqa_person_id"
      
      $variable_list$Sex
      [1] "dqa_sex"
      
      
      $sitenames
      $sitenames$`Demo sitename`
      [1] "DEMO"
      
      
      $restricting_date
      $restricting_date$use_it
      [1] FALSE
      
      
      $data_target
      NULL
      
      $system_types
      [1] "csv"
      
      $settings
      $settings$exampleCSV_source
      named list()
      
      $settings$exampleCSV_target
      named list()
      
      
      $mdr
                   designation source_variable_name filter       source_table_name source_system_name source_system_type
       1:            Person ID            PERSON_ID   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       2:             Forename             FORENAME   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       3:                 Name                 NAME   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       4:         Age in years                  AGE   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       5:            Birthdate            BIRTHDATE   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       6:                  Sex                  SEX   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       7:               Income               INCOME   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       8:                  Job                  JOB   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
       9: Current bank balance         BANK-BALANCE   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
      10:       Credit worthy?        CREDIT-WORTHY   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
      11:     Amount of credit        CREDIT-AMOUNT   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
      12:      Date of contact         CONTACT-DATE   <NA> dqa_example_data_01.csv  exampleCSV_source                csv
      13:            Person ID            PERSON_ID   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      14:             Forename             FORENAME   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      15:                 Name                 NAME   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      16:         Age in years                  AGE   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      17:            Birthdate            BIRTHDATE   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      18:                  Sex                  SEX   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      19:               Income               INCOME   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      20:                  Job                  JOB   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      21: Current bank balance         BANK-BALANCE   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      22:       Credit worthy?        CREDIT-WORTHY   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      23:     Amount of credit        CREDIT-AMOUNT   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
      24:      Date of contact         CONTACT-DATE   <NA> dqa_example_data_02.csv  exampleCSV_target                csv
                   designation source_variable_name filter       source_table_name source_system_name source_system_type
                        key     variable_name variable_type restricting_date_var
       1:     dqa.person_id     dqa_person_id        string         CONTACT-DATE
       2:      dqa.forename      dqa_forename        string         CONTACT-DATE
       3:          dqa.name          dqa_name        string         CONTACT-DATE
       4:     dqa.age_years     dqa_age_years       integer         CONTACT-DATE
       5:     dqa.birthdate     dqa_birthdate      datetime         CONTACT-DATE
       6:           dqa.sex           dqa_sex    enumerated         CONTACT-DATE
       7:        dqa.income        dqa_income       integer         CONTACT-DATE
       8:           dqa.job           dqa_job        string         CONTACT-DATE
       9:  dqa.bank_balance  dqa_bank_balance       integer         CONTACT-DATE
      10: dqa.credit_worthy dqa_credit_worthy    enumerated         CONTACT-DATE
      11: dqa.credit_amount dqa_credit_amount       integer         CONTACT-DATE
      12:  dqa.contact_date  dqa_contact_date      datetime         CONTACT-DATE
      13:     dqa.person_id     dqa_person_id        string         CONTACT-DATE
      14:      dqa.forename      dqa_forename        string         CONTACT-DATE
      15:          dqa.name          dqa_name        string         CONTACT-DATE
      16:     dqa.age_years     dqa_age_years       integer         CONTACT-DATE
      17:     dqa.birthdate     dqa_birthdate      datetime         CONTACT-DATE
      18:           dqa.sex           dqa_sex    enumerated         CONTACT-DATE
      19:        dqa.income        dqa_income       integer         CONTACT-DATE
      20:           dqa.job           dqa_job        string         CONTACT-DATE
      21:  dqa.bank_balance  dqa_bank_balance       integer         CONTACT-DATE
      22: dqa.credit_worthy dqa_credit_worthy    enumerated         CONTACT-DATE
      23: dqa.credit_amount dqa_credit_amount       integer         CONTACT-DATE
      24:  dqa.contact_date  dqa_contact_date      datetime         CONTACT-DATE
                        key     variable_name variable_type restricting_date_var
                                                                            constraints dqa_assessment
       1:                                                                          <NA>              1
       2:                                                                          <NA>              1
       3:                                                                          <NA>              1
       4:                                     {"range":{"min":0,"max":110,"unit":"a"}}               1
       5: {"datetime": {"min": "1950-01-01","max": "1989-12-31", "format": "%d.%m.%Y"}}              1
       6:                                                {"value_set":["m", "f", "x"]}               1
       7:                               {"range":{"min":0,"max":"Inf","unit":"money"}}               1
       8:                                                                          <NA>              1
       9:                          {"range":{"min":"-Inf","max":"Inf","unit":"money"}}               1
      10:                                                  {"value_set": ["yes", "no"]}              1
      11:                               {"range":{"min":0,"max":"Inf","unit":"money"}}               1
      12: {"datetime": {"min": "2012-01-01","max": "2015-12-31", "format": "%d.%m.%Y"}}              1
      13:                                                                          <NA>              1
      14:                                                                          <NA>              1
      15:                                                                          <NA>              1
      16:                                     {"range":{"min":0,"max":110,"unit":"a"}}               1
      17: {"datetime": {"min": "1950-01-01","max": "1989-12-31", "format": "%d.%m.%Y"}}              1
      18:                                  {"value_set":["male", "female", "unknown"]}               1
      19:                               {"range":{"min":0,"max":"Inf","unit":"money"}}               1
      20:                                                                          <NA>              1
      21:                          {"range":{"min":"-Inf","max":"Inf","unit":"money"}}               1
      22:                                                  {"value_set": ["yes", "no"]}              1
      23:                               {"range":{"min":0,"max":"Inf","unit":"money"}}               1
      24: {"datetime": {"min": "2012-01-01","max": "2015-12-31", "format": "%d.%m.%Y"}}              1
                                                                            constraints dqa_assessment
                                                                                                           definition data_map
       1: Each person has its own person-id. It stays the same over the whole live of the person and does not change.        1
       2:                                                                                 The Forename of the person.       NA
       3:                                                                                  The Surname of the person.       NA
       4:                                                               The age of the person at the time of contact.       NA
       5:                                                                     The date of birth written as dd.mm.yyyy       NA
       6:                                                 The sex of the person in one letter: m, f or x for unknown.       NA
       7:                                                             The income of the person at the time of contact       NA
       8:                                                                The job of the person at the time of contact       NA
       9:                                                                     The bank-balance at the time of contact       NA
      10:                                     Indicates whether the person is creditworthy at the time of the contact        1
      11:                                                             That's the amount of credit the person has used       NA
      12:                                                                                             Date of contact       NA
      13:                                                                     (The definition is missing in the MDR.)        1
      14:                                                                     (The definition is missing in the MDR.)       NA
      15:                                                                     (The definition is missing in the MDR.)       NA
      16:                                                                     (The definition is missing in the MDR.)       NA
      17:                                                                     (The definition is missing in the MDR.)       NA
      18:                                                                     (The definition is missing in the MDR.)       NA
      19:                                                                     (The definition is missing in the MDR.)       NA
      20:                                                                     (The definition is missing in the MDR.)       NA
      21:                                                                     (The definition is missing in the MDR.)       NA
      22:                                                                     (The definition is missing in the MDR.)        1
      23:                                                                     (The definition is missing in the MDR.)       NA
      24:                                                                     (The definition is missing in the MDR.)       NA
                                                                                                           definition data_map
                                                                                                                                                                                                                                                                                                                                      plausibility_relation
       1:                                                                                                                                                                                     {"uniqueness": {"dqa_name": {"name": "Pl.uniqueness.Item01","description": "The last name of a person must be identical in all entries for one person ID."}}}
       2:                                                                                                                                                                                                                                                                                                                                              <NA>
       3:                                                                                                                                                                                                                                                                                                                                              <NA>
       4:                                                                                                                                                                                                                                                                                                                                              <NA>
       5:                                                                                                                                                                                                                                                                                                                                              <NA>
       6:                                                                                                                                                                                                                                                                                                                                              <NA>
       7:                                                                                                                                                                                                                                                                                                                                              <NA>
       8:                                                                                                                                                                                                                                                                                                                                              <NA>
       9:                                                                                                                                                                                                                                                                                                                                              <NA>
      10: {"atemporal": {"dqa_bank_balance": {"name": "Pl.atemporal.Item01", "description": "Persons with a negative bank balance cannot be credit worthy", "filter": {"exampleCSV_source": "^(-)", "exampleCSV_target": "^(-)"}, "join_crit": "dqa_person_id", "constraints": {"value_set": {"exampleCSV_source": ["no"], "exampleCSV_target": ["no"]}}}}}
      11:                                                                                                                                                                                                                                                                                                                                              <NA>
      12:                                                                                                                                                                                                                                                                                                                                              <NA>
      13:                                                                                                                                                                                                                                                                                                                                              <NA>
      14:                                                                                                                                                                                                                                                                                                                                              <NA>
      15:                                                                                                                                                                                                                                                                                                                                              <NA>
      16:                                                                                                                                                                                                                                                                                                                                              <NA>
      17:                                                                                                                                                                                                                                                                                                                                              <NA>
      18:                                                                                                                                                                                                                                                                                                                                              <NA>
      19:                                                                                                                                                                                                                                                                                                                                              <NA>
      20:                                                                                                                                                                                                                                                                                                                                              <NA>
      21:                                                                                                                                                                                                                                                                                                                                              <NA>
      22:                                                                                                                                                                                                                                                                                                                                              <NA>
      23:                                                                                                                                                                                                                                                                                                                                              <NA>
      24:                                                                                                                                                                                                                                                                                                                                              <NA>
                                                                                                                                                                                                                                                                                                                                      plausibility_relation
      
      $report_created
      [1] TRUE
      
      $mdr_filename
      [1] "mdr_example_data.csv"
      
      $getdata_source
      [1] FALSE
      
      $conformance
      $conformance$value_conformance
      $conformance$value_conformance$`Age in years`
      $conformance$value_conformance$`Age in years`$source_data
      $conformance$value_conformance$`Age in years`$source_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$`Age in years`$source_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      $conformance$value_conformance$`Age in years`$target_data
      $conformance$value_conformance$`Age in years`$target_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$`Age in years`$target_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      
      
      $conformance$value_conformance$`Amount of credit`
      $conformance$value_conformance$`Amount of credit`$source_data
      $conformance$value_conformance$`Amount of credit`$source_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$`Amount of credit`$source_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      $conformance$value_conformance$`Amount of credit`$target_data
      $conformance$value_conformance$`Amount of credit`$target_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$`Amount of credit`$target_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      
      $conformance$value_conformance$Birthdate
      $conformance$value_conformance$Birthdate$source_data
      $conformance$value_conformance$Birthdate$source_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$Birthdate$source_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      $conformance$value_conformance$Birthdate$source_data$rule
      $conformance$value_conformance$Birthdate$source_data$rule$min
      [1] "1950-01-01"
      
      $conformance$value_conformance$Birthdate$source_data$rule$max
      [1] "1989-12-31"
      
      $conformance$value_conformance$Birthdate$source_data$rule$format
      [1] "%d.%m.%Y"
      
      
      
      $conformance$value_conformance$Birthdate$target_data
      $conformance$value_conformance$Birthdate$target_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$Birthdate$target_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      $conformance$value_conformance$Birthdate$target_data$rule
      $conformance$value_conformance$Birthdate$target_data$rule$min
      [1] "1950-01-01"
      
      $conformance$value_conformance$Birthdate$target_data$rule$max
      [1] "1989-12-31"
      
      $conformance$value_conformance$Birthdate$target_data$rule$format
      [1] "%d.%m.%Y"
      
      
      
      
      $conformance$value_conformance$`Credit worthy?`
      $conformance$value_conformance$`Credit worthy?`$source_data
      $conformance$value_conformance$`Credit worthy?`$source_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$`Credit worthy?`$source_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      $conformance$value_conformance$`Credit worthy?`$target_data
      $conformance$value_conformance$`Credit worthy?`$target_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$`Credit worthy?`$target_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      
      $conformance$value_conformance$`Current bank balance`
      $conformance$value_conformance$`Current bank balance`$source_data
      $conformance$value_conformance$`Current bank balance`$source_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$`Current bank balance`$source_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      
      $conformance$value_conformance$`Current bank balance`$target_data
      $conformance$value_conformance$`Current bank balance`$target_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$`Current bank balance`$target_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      
      
      $conformance$value_conformance$`Date of contact`
      $conformance$value_conformance$`Date of contact`$source_data
      $conformance$value_conformance$`Date of contact`$source_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$`Date of contact`$source_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      $conformance$value_conformance$`Date of contact`$source_data$rule
      $conformance$value_conformance$`Date of contact`$source_data$rule$min
      [1] "2012-01-01"
      
      $conformance$value_conformance$`Date of contact`$source_data$rule$max
      [1] "2015-12-31"
      
      $conformance$value_conformance$`Date of contact`$source_data$rule$format
      [1] "%d.%m.%Y"
      
      
      
      $conformance$value_conformance$`Date of contact`$target_data
      $conformance$value_conformance$`Date of contact`$target_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$`Date of contact`$target_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      $conformance$value_conformance$`Date of contact`$target_data$rule
      $conformance$value_conformance$`Date of contact`$target_data$rule$min
      [1] "2012-01-01"
      
      $conformance$value_conformance$`Date of contact`$target_data$rule$max
      [1] "2015-12-31"
      
      $conformance$value_conformance$`Date of contact`$target_data$rule$format
      [1] "%d.%m.%Y"
      
      
      
      
      $conformance$value_conformance$Income
      $conformance$value_conformance$Income$source_data
      $conformance$value_conformance$Income$source_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$Income$source_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      $conformance$value_conformance$Income$target_data
      $conformance$value_conformance$Income$target_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$Income$target_data$conformance_results
      [1] "Extrem values are not conform with constraints."
      
      
      
      $conformance$value_conformance$Sex
      $conformance$value_conformance$Sex$source_data
      $conformance$value_conformance$Sex$source_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$Sex$source_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      $conformance$value_conformance$Sex$target_data
      $conformance$value_conformance$Sex$target_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$Sex$target_data$conformance_results
      [1] "Levels that are not conform with the value set:  \nabc"
      
      
      
      $conformance$value_conformance$pl.atemporal.item01
      $conformance$value_conformance$pl.atemporal.item01$source_data
      $conformance$value_conformance$pl.atemporal.item01$source_data$conformance_error
      [1] FALSE
      
      $conformance$value_conformance$pl.atemporal.item01$source_data$conformance_results
      [1] "No 'value conformance' issues found."
      
      
      $conformance$value_conformance$pl.atemporal.item01$target_data
      $conformance$value_conformance$pl.atemporal.item01$target_data$conformance_error
      [1] TRUE
      
      $conformance$value_conformance$pl.atemporal.item01$target_data$conformance_results
      [1] "Levels that are not conform with the value set:  \nyes"
      
      $conformance$value_conformance$pl.atemporal.item01$target_data$affected_ids
         dqa_bank_balance
      1:           -36500
      2:           -64200
      
      
      
      
      
      $displaynames
         source_system_name       displayname
      1:  exampleCSV_source exampleCSV_source
      2:  exampleCSV_target exampleCSV_target
      
      $source
      $source$system_name
      [1] "exampleCSV_source"
      
      $source$system_type
      [1] "csv"
      
      $source$settings
      $source$settings$path
      [1] "/usr/local/lib/R/site-library/DQAstats/demo_data"
      
      
      $source$sql
      [1] NA
      
      
      $target
      $target$system_name
      [1] "exampleCSV_target"
      
      $target$system_type
      [1] "csv"
      
      $target$settings
      $target$settings$path
      [1] "/usr/local/lib/R/site-library/DQAstats/demo_data"
      
      
      $target$sql
      [1] NA
      
      
      $target_is_source
      [1] FALSE
      
      $data_source
      NULL
      
      $results_plausibility_atemporal
      $results_plausibility_atemporal$pl.atemporal.item01
      $results_plausibility_atemporal$pl.atemporal.item01$description
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$name
      [1] "Pl.atemporal.Item01"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$description
      [1] "Persons with a negative bank balance cannot be credit worthy"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$var_dependent
      [1] "dqa_credit_worthy"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$var_independent
      [1] "dqa_bank_balance"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$filter
      [1] "^(-)"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$join_crit
      [1] "dqa_person_id"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$checks
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$checks$constraints
      [1] "{\"value_set\":\"no\"}"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$source_data$checks$var_type
      [1] "enumerated"
      
      
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$name
      [1] "Pl.atemporal.Item01"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$var_dependent
      [1] "dqa_credit_worthy"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$var_independent
      [1] "dqa_bank_balance"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$filter
      [1] "^(-)"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$join_crit
      [1] "dqa_person_id"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$checks
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$checks$constraints
      [1] "{\"value_set\":\"no\"}"
      
      $results_plausibility_atemporal$pl.atemporal.item01$description$target_data$checks$var_type
      [1] "enumerated"
      
      
      
      
      $results_plausibility_atemporal$pl.atemporal.item01$counts
      $results_plausibility_atemporal$pl.atemporal.item01$counts$source_data
      $results_plausibility_atemporal$pl.atemporal.item01$counts$source_data$cnt
                  variable n valids missings distinct      sourcesystem
      1: dqa_credit_worthy 2      2        0        1 exampleCSV_source
      
      $results_plausibility_atemporal$pl.atemporal.item01$counts$source_data$type
      [1] "enumerated"
      
      
      $results_plausibility_atemporal$pl.atemporal.item01$counts$target_data
      $results_plausibility_atemporal$pl.atemporal.item01$counts$target_data$cnt
                  variable n valids missings distinct      sourcesystem
      1: dqa_credit_worthy 4      4        0        2 exampleCSV_target
      
      $results_plausibility_atemporal$pl.atemporal.item01$counts$target_data$type
      [1] "enumerated"
      
      
      
      $results_plausibility_atemporal$pl.atemporal.item01$statistics
      $results_plausibility_atemporal$pl.atemporal.item01$statistics$source_data
         dqa_credit_worthy Freq % Valid
      1:                no    2     100
      
      $results_plausibility_atemporal$pl.atemporal.item01$statistics$target_data
         dqa_credit_worthy Freq % Valid
      1:                no    2      50
      2:               yes    2      50
      
      
      
      
      $systems
         source_system_name source_system_type
      1:  exampleCSV_source                csv
      2:  exampleCSV_target                csv
      
      $demo_usage
      [1] FALSE
      
      $start
      [1] TRUE
      
      $log
      $log$logfile_dir
      [1] "/tmp/Rtmp34oS8t/"
      
      $log$populated_old_logfiles_list
      [1] TRUE
      
      
      $completeness
                      Variable Missings (source) Missings [%] (source) Missings (target) Missings [%] (target)
       1:         Age in years                 0                     0                 0                     0
       2:     Amount of credit                13                 56.52                13                 56.52
       3:            Birthdate                 0                     0                 0                     0
       4:       Credit worthy?                 0                     0                 0                     0
       5: Current bank balance                 0                     0                 0                     0
       6:      Date of contact                 0                     0                 0                     0
       7:             Forename                 0                     0                 0                     0
       8:               Income                 0                     0                 0                     0
       9:                  Job                 0                     0                 0                     0
      10:                 Name                 0                     0                 0                     0
      11:            Person ID                 0                     0                 0                     0
      12:                  Sex                 0                     0                 0                     0
      
      $parallel
      [1] FALSE
      
      $create_report
      [1] TRUE
      
      $pl_uniq_vars_filter
      $pl_uniq_vars_filter$dqa_name
      [1] "dqa_name"
      
      
      $getdata_target
      [1] FALSE
      
      $pl_atemp_vars_filter
      $pl_atemp_vars_filter$Pl.atemporal.Item01
      [1] "pl.atemporal.item01"
      
      

