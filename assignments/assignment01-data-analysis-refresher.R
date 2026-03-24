#' ---
#' title: "Assignment 1, Social Science Inquiry III (SOSC13300-S26)"
#' author: "<your name here>"
#' date: "Friday 3/27/26 at 3:00pm"
#' ---
#'
#' Set up your class working directory.
#'
#' Sparkman, Gregg, Nathan Geiger, and Elke U. Weber. 2022.
#' "Americans experience a false social reality by underestimating popular climate
#' policy support by nearly half." *Nature Communications* 13(1): 4779.
#'
#' Article PDF:
#' https://www.dropbox.com/s/74bsybppl7uv4n3/nature_communications_pluralistic_ignorance_2022.pdf?dl=0
#'
#' Article page and supplementary materials:
#' https://www.nature.com/articles/s41467-022-32412-y
#'
#' Data:
#' https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-022-32412-y/MediaObjects/41467_2022_32412_MOESM4_ESM.csv
#'
#' Codebook:
#' https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-022-32412-y/MediaObjects/41467_2022_32412_MOESM5_ESM.xlsx
#'
#'
#' ## Setup
#' 1. Download the data and codebook.
#' 2. Set `data_path` below to point to the dataset on your machine.
#' 3. Load the data and inspect the variable names before starting.
#'
library(ggplot2)

data_path <- "replace/with/path/to/41467_2022_32412_MOESM4_ESM.csv"
# dat <- read.csv(data_path, as.is = TRUE)

#' ## 1. Plot perceived climate concern by party
#' Sparkman et al. asked respondents to estimate the proportion of Americans who are
#' at least somewhat concerned about climate change. This variable is
#' `GRID_GTS1_1_GTS1` in the dataset.
#'
#' Make a plot showing the average response separately for respondents who are:
#' - Republicans
#' - Democrats
#' - Independents
#'
#' Your plot should have readable labels and a clear title.

# your code here

#' ## 2. Estimate a single regression
#' 
#' Report the results of one regression in which the dependent variable is the
#' response to `GRID_GTS1_1_GTS1` and the explanatory variables are:
#' 
#' - indicator for female
#' - indicator for college graduate
#' - indicator for watches CNN or MSNBC at least weekly
#' - indicator for watches Fox News at least weekly
#' - indicators for age below 30, age 30--39, age 40--49, age 50--59,
#'   age 60--69, and age 70+
#' - indicators for income in the bottom tercile, middle tercile, and top tercile
#'
#' Report the results in a table.

# your code here
