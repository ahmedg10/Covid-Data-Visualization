# Set up ------------------------------------------------------------------
library(shiny)
library(shinyWidgets)
library(dplyr)
library(ggplot2)
library(plotly)


# sourcing files  ---------------------------------------------------------


source("app_server.R")
source("app_ui.R")


# Running App -------------------------------------------------------------

shinyApp(ui, server)
