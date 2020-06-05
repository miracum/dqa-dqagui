# DQAgui (!!! currently under development !!!)

<!-- badges: start -->
[![R CMD Check via {tic}](https://github.com/miracum/dqa-dqagui/workflows/R%20CMD%20Check%20via%20{tic}/badge.svg?branch=master)](https://github.com/miracum/dqa-dqagui/actions)
[![linting](https://github.com/miracum/dqa-dqagui/workflows/lint/badge.svg?branch=master)](https://github.com/miracum/dqa-dqagui/actions)
[![test-coverage](https://github.com/miracum/dqa-dqagui/workflows/test-coverage/badge.svg?branch=master)](https://github.com/miracum/dqa-dqagui/actions)
[![codecov](https://codecov.io/gh/miracum/dqa-dqagui/branch/master/graph/badge.svg)](https://codecov.io/gh/miracum/dqa-dqagui)
[![pipeline status](https://gitlab.miracum.org/miracum/dqa/dqagui/badges/master/pipeline.svg)](https://gitlab.miracum.org/miracum/dqa/dqagui/commits/master)
[![coverage report](https://gitlab.miracum.org/miracum/dqa/dqagui/badges/master/coverage.svg)](https://gitlab.miracum.org/miracum/dqa/dqagui/commits/master)
<!-- badges: end -->

This is the repository of the R package 'DQAgui'. It provides a graphical user interface to the functionalities implemented in 'DQAstats'. 

Currently, this packages is to be used together with the R packages `DQAstat` and `miRacumDQA` in order to work properly.
Future work aims to make `DQAgui` and `DQAstats` applicable to other EHR data sources than those used within the MIRACUM consortium.

Currently supported data formats / databases:  
* CSV files
* PostgreSQL (via `RPostgres`)

## Installation

You can install `DQAgui` with:

``` r
install.packages("devtools")
devtools::install_github("miracum/dqa-dqagui")
```

# Configuration 

The database connection can be configured using environment variables. These can be set using the base R command `Sys.setenv()`.

A detailed description, which environment variables need to be set for the specific databases can be found [here](https://github.com/miracum/misc-dizutils/blob/master/README.md).

## Example

This is a basic example to demonstrate how to perform the data quality assessment with DQAgui:

``` r
library(DQAgui)
launch_app()
```
To open the shiny application in your webbrowser, go to http://localhost:3838.

# More Infos:

- about MIRACUM: [https://www.miracum.org/](https://www.miracum.org/)
- about the Medical Informatics Initiative: [https://www.medizininformatik-initiative.de/index.php/de](https://www.medizininformatik-initiative.de/index.php/de)
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc. 
