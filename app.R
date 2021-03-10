# Set up ------------------------------------------------------------------
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(lintr)
library(styler)


# Loading Data  -----------------------------------------------------------
vax_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/country_vaccinations.csv")
us_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us-counties.csv")
state_daily <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us_states_covid19_daily.csv")


# sourcing files  ---------------------------------------------------------


source("app_server.R")
source("app_ui.R")


# Running App -------------------------------------------------------------

shinyApp(ui, server)


