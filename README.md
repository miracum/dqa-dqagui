# DQAgui (!!! currently under development !!!)

This is the repository of the R package 'DQAgui'. It provides a graphical user interface to the functionalities implemented in 'DQAstats'. 

## Installation

You can install the development version of *DQAgui* with:

``` r
install.packages("devtools")
devtools::install_git("https://gitlab.miracum.org/miracum-dqa/dqastats.git", credentials = git2r::cred_user_pass(rstudioapi::askForPassword(prompt = "Username"), rstudioapi::askForPassword()))
devtools::install_git("https://gitlab.miracum.org/miracum-dqa/dqagui.git", credentials = git2r::cred_user_pass(rstudioapi::askForPassword(prompt = "Username"), rstudioapi::askForPassword()))
```

## Example

This is a basic example to demonstrate how to perform the data quality assessment with DQAgui:

``` r
library(DQAgui)
launchApp()
```
To open the shiny application in your webbrowser, go to http://localhost:3838

# More Infos:
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc. 
