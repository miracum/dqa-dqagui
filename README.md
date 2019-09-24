# DQAgui (!!! currently under development !!!)

This is the repository of the R package 'DQAgui'. It provides a graphical user interface to the functionalities implemented in 'DQAstats'. 

Currently, this packages is to be used together with the R packages `DQAstat` and `miRacumDQA` in order to work properly.
Future work aims to make `DQAgui` and `DQAstats` applicable to other EHR data sources than those used within the MIRACUM consortium.

## Installation

You can install `DQAgui` with:

``` r
install.packages("devtools")
devtools::install_git("https://gitlab.miracum.org/miracum-dqa/dqastats.git")
devtools::install_git("https://gitlab.miracum.org/miracum-dqa/dqagui.git")
```

## Example

This is a basic example to demonstrate how to perform the data quality assessment with DQAgui:

``` r
library(DQAgui)
launchApp(utilspath = "./_utilities/", db_source = "p21csv")
```
To open the shiny application in your webbrowser, go to http://localhost:3838.

# More Infos:

- about MIRACUM: [https://www.miracum.org/](https://www.miracum.org/)
- about the Medical Informatics Initiative: [https://www.medizininformatik-initiative.de/index.php/de](https://www.medizininformatik-initiative.de/index.php/de)
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc. 
