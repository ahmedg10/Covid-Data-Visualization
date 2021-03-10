# Set up ------------------------------------------------------------------
library(shiny)
library(markdown)
library(dplyr)
library(ggplot2)
# Loading Data  -----------------------------------------------------------
vax_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/country_vaccinations.csv")
us_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us-counties.csv")
state_daily <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us_states_covid19_daily.csv")


# Creating UI -------------------------------------------------------------

ui <- navbarPage(
  "Final Deliverable",
  tabPanel(
    titlePanel("Introduction"),
    h1("Introduction"),
    mainPanel(p("hiii")),
    
  ),
  tabPanel(
    titlePanel("Vaccine Plot"),
    y_input,
    color_input,
    size_input,
    mainPanel(
      plotlyOutput(outputId = "scatter"),
      p("hiii")
    ),
  ),
  tabPanel(
    titlePanel("Plot 2"),
    mainPanel( 
      plotlyOutput(outputId = "scatter"),
      p("plot 2 template"))
  ),
  tabPanel(
    titlePanel("Plot 3"),
    mainPanel(
      plotlyOutput(outputId = "scatter"),
      p("plot 3 template"))
    ),
  tabPanel(
    titlePanel("Conclusion"),
    mainPanel(
      plotlyOutput(outputID = "scatter"),
      p("plot 3 template")
      
    )
  )
)
  
