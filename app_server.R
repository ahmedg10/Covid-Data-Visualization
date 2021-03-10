# Set up  -----------------------------------------------------------------
library(ggplot2)
library(plotly)
library(shiny)
library(dplyr)


# Loading Data  -----------------------------------------------------------
vax_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/country_vaccinations.csv")
us_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us-counties.csv")
state_daily <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us_states_covid19_daily.csv")

server <- function(input, output) {
}
