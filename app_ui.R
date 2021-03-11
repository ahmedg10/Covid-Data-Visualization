# Set up ------------------------------------------------------------------
library(shiny)
library(markdown)
library(dplyr)
library(ggplot2)
# Loading Data  -----------------------------------------------------------
#vax_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/country_vaccinations.csv")
#us_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us-counties.csv")
#state_daily <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us_states_covid19_daily.csv")


# State Daily Data Sliders  ----------------------------------------------------
states <- unique(state_daily$state)

state_input <- selectInput(
  inputId = "x_state",
  choices = c("hospitalizedCurrently", "hospitalizedCumulative"),
  label = "Choose a X Variable"

)
# Creating Sliders and Interactive Portion of UI --------------------------

# # country input
countries <- unique(vax_data$country)
country_input <- selectInput(
  inputId = "country_vax",
  choices = countries
  ,
  label = "Choose a Country",
)

# Y input (Vaccination Data)
y_vax <- selectInput(
  inputId = "y_vax",
  choices = c("daily vaccinations",
             "people vaccinated"),
  label = "Choose a Y variable"
)
# color input
color_input <- selectInput(
  inputId = "color",
  choices = c("red", "green", "grey", "blue"),
  label = "Choose a Color"
)

#  size input
size_input <- sliderInput(
  inputId = "size",
  label = "Set the point size",
  min = .05,
  max = 10,
  value = 1
)


# Creating UI -------------------------------------------------------------

ui <- navbarPage(
  "Final Deliverable",
  tabPanel(
    titlePanel("Introduction"),
    h1("Introduction"),
    mainPanel(p("main paragraph to write the intro")),
    
  ),
  tabPanel(
    titlePanel("AFK"),
    country_input,
    y_vax,
    color_input,
    size_input,
    mainPanel(
      plotlyOutput(outputId = "scatter")
    ),
  ),
  tabPanel(
    titlePanel("Hospitlizations Plot"),
    state_input,
    color_input,
    plotlyOutput(outputId = "bar")
  )


)

