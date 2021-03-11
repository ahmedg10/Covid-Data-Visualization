# Set up ------------------------------------------------------------------
library(shiny)
library(markdown)
library(dplyr)
library(ggplot2)
# Loading Data  -----------------------------------------------------------
vax_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/country_vaccinations.csv")
#us_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us-counties.csv")
#state_daily <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us_states_covid19_daily.csv")


# State Daily Data Sliders  ----------------------------------------------------
states <- unique(state_daily$state)

state_input <- selectInput(
  inputId = "x_state",
  choices = c("Hospitalized Currently", "Hospitalized Cumulative"),
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
    titlePanel("Covid-19 Project Introduction"),
    setBackgroundImage(
      src = "https://wou.edu/westernhowl/files/2020/04/world-map.png"
    ,shinydashboard = TRUE),
    h1("Introduction"),
    mainPanel(p("Due to the prevalence of the pandemic in all of our lives, our group decided to focus on Covid-19 and examine various datasets that allowed us to dive into some of the trends of the pandemic. We began our project by focusing on two overarching questions. The first question we wanted to answer was how well did the United States do in responding to the Covid-19 Pandemic. All of our group members live in Washington, so we first wanted to analyze how our own country has done during these trying times. Second, we wanted to answer the question of how well has the world acted upon the arrival of Covid-19 vaccines. We were curious to see if there were certain countries that were outperforming others in giving out the vaccine, or if there was more of an equilibrium across the world. In order to answer these questions we used three different datasets, each adding their own value. The first dataset we used specifically looked at the number of positive cases and the number of deaths from January 2020 to the current date in each state. This dataset allowed us to look at how Covid has affected each state over time. The second dataset we used still focused on the United States, but it added a wider variety of data such as hospitalizations, the amount of people on ventilators, and even the amount of people who tested positive for antibodies. We incorporated this dataset because it allowed us to look at the impact of Covid-19 in the United States in greater depth. And finally the last dataset we used examined Covid-19 vaccination data across the world. Since it was sorted by country and date, we believed it could be used to create timelines of vaccination data in each country in order to analyze each country's vaccination progress. We feel extremely confident in the datasets we chose and the next few pages will illustrate what we were able to discover using these datasets.")),
    
  ),
  tabPanel(
    titlePanel("Vaccination Plot"),
    country_input,
    y_vax,
    color_input,
    size_input,
    mainPanel(
      plotlyOutput(outputId = "scatter"),
      p("This Graph was created in order to look into the vaccinations
        distrubited from December 2020 - March 2021 in various countries around 
        the world. There are some Null variables with some of the smaller countries 
        as they recieved vaccine resources later than first world coutnries such
        as the US.")
    ),
  ),
  tabPanel(
    titlePanel("Hospitlizations Plot"),
    state_input,
    plotlyOutput(outputId = "bar"),
    p("This Graph was created in order to view the hospitlizations 
      in US Hotspot states to this current day. ")
  )
)

