#' ---
#' title: "Assignment 3, Social Science Inquiry III (SOSC13300-W26)"
#' author: "<your name here>"
#' date: "Friday 4/10/26 at 3:00pm"
#' ---
#'
#' Analyze data from the Qualtrics survey generated last week. 
#' I have created some test observations, stored here: 
#' https://github.com/UChicago-pol-methods/SOSC13300-W26/blob/main/data/SOSC%2013300_March%2027%2C%202024_15.06.csv
#'
#' Complete the analysis below and compile it using an R script, an R Markdown
#' file, or a Quarto file.
#' You can either read in the data in from the raw link, or download the data and read it in locally. 
#'
#'
#' ## 1. Read in data
#' Read in data: To get the data variable names in, but skipping some extraneous information in the second and third rows of the Qualtrics .csv file, use something like the below in R:
#' 
# file_name <- "../data/SOSC 13300_March 27, 2024_15.06.csv"
# df_names <- readr::read_csv(file_name, n_max = 0) |>  names() |> tolower()
# data <- readr::read_csv(file_name, col_names = df_names, skip = 3)
#' 
# your code here
#' 
#' ## 2. Cleaning
#'
#' a. Filter observations: Remove observations where the age category is "U18".
#' b. Generate new variable (party_id): Create party_id to categorize political party identification from -3 (strong Democrat) to 3 (strong Republican), with 0 for no preference or other, using the party_id* variables. The variable names end with r, d, or i, based on whether the questions were asked of Republicans, Democrats, or Independents, respectively. Refer back to how the summary variable has been coded in the ANES reference file: https://electionstudies.org/wp-content/uploads/2018/03/20091208PartyID.pdf
#' The exact numbers are different but the ordering should be consistent. 
#' c. Convert variables to numeric: change: `envpolicy_priority` and `treatment_positive` to numeric if they are
#'    not already coded that way.
#' d. Select key variables and save: Keep only `envpolicy_priority`, `party_id`, and `treatment_positive`.
#' e. Save the cleaned data as a new file.
#'
# your code here

#' ## 3. Regression analysis
#' 
#' a. Regress `envpolicy_priority` on `treatment_positive`, using robust
#'    standard errors.
#' b. Generate a de-meaned `party_id` variable.
#' c. Regress `envpolicy_priority` on `treatment_positive`, `party_id`, and the
#'    interaction between de-meaned `party_id` and `treatment_positive`, using
#'    robust standard errors. In R, you can use `lm_lin()` from `estimatr`.
#' 
# your code here

#' 
#' Save your file and include the regression output in the compiled document.
