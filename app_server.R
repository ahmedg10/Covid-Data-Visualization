# Set up  -----------------------------------------------------------------
library(ggplot2)
library(plotly)
library(shiny)
library(dplyr)

# Loading Data  -----------------------------------------------------------
# vax_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/country_vaccinations.csv")
# us_data <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us-counties.csv")
# state_daily <- read.csv("https://raw.githubusercontent.com/ahmedg10/Final/main/us_states_covid19_daily.csv")

server <- function(input, output) {
  output$scatter <- renderPlotly({
    # Filtering vax_data in order to get the specific columns for my plot
    # filtered data to be able to choose different states
    country_df <- vax_data%>%
<<<<<<< HEAD
      distinct(iso_code, country)
    choices <- setNames(country_df$iso_code, country_df$country)
    
    new_vax <- vax_data %>%
      select(
        "date", "country", "daily_vaccinations", "people_vaccinated")
    
    country_name <-input$country_vax
    
    filter_vax <- new_vax %>%
      filter(country == input$country_vax)
    
    # Changing the column names to be more readible to the user rather than
    # Variable names
    colnames(filter_vax) <- c(
      "date", "country", "daily vaccinations", "people vaccinated"
    )
    levels(filter_vax$date) <- gsub("\\(.+,|]", "", levels(filter_vax$date))
    
=======
    distinct(iso_code, country)
    choices <- setNames(country_df$iso_code, country_df$country)

  new_vax <- vax_data %>%
      select(
        "date", "country", "daily_vaccinations", "people_vaccinated")

  country_name <-input$country_vax

  filter_vax <- new_vax %>%
        filter(country == input$country_vax)

# Changing the column names to be more readible to the user rather than
# Variable names
colnames(filter_vax) <- c(
  "date", "country", "daily vaccinations", "people vaccinated"
)
 levels(filter_vax$date) <- gsub("\\(.+,|]", "", levels(filter_vax$date))

>>>>>>> 0a3024145ea2aa655d589035ec18e60d2f4b32af
    filter_vax <- as.data.frame(filter_vax)
    # Creating the Interactive plot using plotly
    
    my_plot <- ggplot(filter_vax) +
      geom_point(
        mapping = aes(x = date, y = filter_vax[[input$y_vax]]),
        color = input$color, size = input$size
      ) +
      scale_x_discrete(breaks = c("2020-12-01", "2021-01-01", "2021-02-01", 
                                  "2021-03-01")) +
      labs(
        title = "Amount of Vaccination By Country",
        x = "Date (December 2020 - March 2021)",
        y = input$y_vax
      ) 
    ggplotly(my_plot)
<<<<<<< HEAD
=======

>>>>>>> 0a3024145ea2aa655d589035ec18e60d2f4b32af
    
    
    
    
<<<<<<< HEAD
    
    
  })
  
  output$bar <- renderPlotly({
    target <- c("WA","OR","FL","NY","NJ")
    filtered_states <- state_daily%>%
      filter(date == max(date)) %>%
      filter(state %in% target) %>%
      select( "date", "state", "hospitalizedCurrently", "hospitalizedCumulative")
    
    colnames(filtered_states) <- c(
      "date", "state", "Hospitalized Currently", "Hospitalized Cumulative"
    )   
    
    
    my_bar <- ggplot(data = filtered_states, aes(x= .data[[input$x_state]], y = state)) +
      geom_bar(
        stat = "identity",
      ) +
      labs(
        title = "Covid Hot Spot Hospitlization",
        x = input$x_state,
        y = "Hot Spot States"
      )
    ggplotly(my_bar)  
  })
  
  output$line <- renderPlotly({
    line_plot_data <- us_data %>%
      filter (state == "Washington") %>%
      filter (county == input$counties)
    
    line_plot_data <- as.data.frame(line_plot_data)
    
    my_line <- ggplot(line_plot_data)  +
      geom_point(mapping = aes(x = date, y = .data[[input$us_y]])) +
      scale_x_discrete(breaks = c("2020-02-01", "2020-04-01", "2020-06-01",
                                  "2020-08-01", "2020-10-01", "2020-12-01", 
                                  "2021-02-01")) +
      labs(
        title = "New Cases per County in Washington State",
        x = "Date",
        y = input$us_y
      )
    ggplotly(my_line)
  })
  
}
=======
   
  })
  
output$bar <- renderPlotly({
  target <- c("WA","OR","FL","NY","NJ")
  filtered_states <- state_daily%>%
    filter(date == max(date)) %>%
    filter(state %in% target) %>%
    select( "date", "state", "hospitalizedCurrently", "hospitalizedCumulative")
    
colnames(filtered_states) <- c(
      "date", "state", "Hospitalized Currently", "Hospitalized Cumulative"
    )   

  
 my_bar <- ggplot(data = filtered_states, aes(x= .data[[input$x_state]], y = state)) +
    geom_bar(
     stat = "identity",
    ) +
    labs(
      title = "Covid Hot Spot Hospitlization",
      x = input$x_state,
      y = "Hot Spot States"
    )
  ggplotly(my_bar)  
})

output$line <- renderPlotly({
  line_plot_data <- us_data %>%
    filter (state == "Washington") %>%
    filter (county == input$counties)
  
  line_plot_data <- as.data.frame(line_plot_data)

  my_line <- ggplot(line_plot_data)  +
    geom_point(mapping = aes(x = date, y = .data[[input$us_y]])) +
    scale_x_discrete(breaks = c("2020-02-01", "2020-04-01", "2020-06-01",
                                "2020-08-01", "2020-10-01", "2020-12-01", 
                                "2021-02-01")) +
    labs(
      title = "New Cases per County in Washington State",
      x = "Date",
      y = input$us_y
    )
    ggplotly(my_line)
})

}



>>>>>>> 0a3024145ea2aa655d589035ec18e60d2f4b32af
