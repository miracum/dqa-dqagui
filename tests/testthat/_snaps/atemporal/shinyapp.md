# DQAgui shiny app / launch_app() works

    Code
      rv$results_plausibility_atemporal
    Output
      $pl.atemporal.item01
      $pl.atemporal.item01$description
      $pl.atemporal.item01$description$source_data
      $pl.atemporal.item01$description$source_data$name
      [1] "Pl.atemporal.Item01"
      
      $pl.atemporal.item01$description$source_data$description
      [1] "Persons with a negative bank balance cannot be credit worthy"
      
      $pl.atemporal.item01$description$source_data$var_dependent
      [1] "dqa_credit_worthy"
      
      $pl.atemporal.item01$description$source_data$var_independent
      [1] "dqa_bank_balance"
      
      $pl.atemporal.item01$description$source_data$filter
      [1] "^(-)"
      
      $pl.atemporal.item01$description$source_data$join_crit
      [1] "dqa_person_id"
      
      $pl.atemporal.item01$description$source_data$checks
      $pl.atemporal.item01$description$source_data$checks$constraints
      [1] "{\"value_set\":\"no\"}"
      
      $pl.atemporal.item01$description$source_data$checks$var_type
      [1] "enumerated"
      
      
      
      $pl.atemporal.item01$description$target_data
      $pl.atemporal.item01$description$target_data$name
      [1] "Pl.atemporal.Item01"
      
      $pl.atemporal.item01$description$target_data$var_dependent
      [1] "dqa_credit_worthy"
      
      $pl.atemporal.item01$description$target_data$var_independent
      [1] "dqa_bank_balance"
      
      $pl.atemporal.item01$description$target_data$filter
      [1] "^(-)"
      
      $pl.atemporal.item01$description$target_data$join_crit
      [1] "dqa_person_id"
      
      $pl.atemporal.item01$description$target_data$checks
      $pl.atemporal.item01$description$target_data$checks$constraints
      [1] "{\"value_set\":\"no\"}"
      
      $pl.atemporal.item01$description$target_data$checks$var_type
      [1] "enumerated"
      
      
      
      
      $pl.atemporal.item01$counts
      $pl.atemporal.item01$counts$source_data
      $pl.atemporal.item01$counts$source_data$cnt
                  variable n valids missings distinct      sourcesystem
      1: dqa_credit_worthy 2      2        0        1 exampleCSV_source
      
      $pl.atemporal.item01$counts$source_data$type
      [1] "enumerated"
      
      
      $pl.atemporal.item01$counts$target_data
      $pl.atemporal.item01$counts$target_data$cnt
                  variable n valids missings distinct      sourcesystem
      1: dqa_credit_worthy 4      4        0        2 exampleCSV_target
      
      $pl.atemporal.item01$counts$target_data$type
      [1] "enumerated"
      
      
      
      $pl.atemporal.item01$statistics
      $pl.atemporal.item01$statistics$source_data
         dqa_credit_worthy Freq % Valid
      1:                no    2     100
      
      $pl.atemporal.item01$statistics$target_data
         dqa_credit_worthy Freq % Valid
      1:                no    2      50
      2:               yes    2      50
      
      
      

