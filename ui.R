library(shiny)
library(ggplot2)
# UI with plot and widget
ui <- shinyUI(fluidPage(
        titlePanel("Difference between automatic and manual transmissions"),
        sidebarLayout(
                sidebarPanel(
                        h4("Difference between automatic and manual transmissions"),
                        
                        selectInput("var1", "Variable on OX:", 
                                    c("Cylinders" = "cyl",
                                      "Transmission" = "am",
                                      "Gears" = "gear",
                                      "Miles per gallon" = "mpg",
                                      "Horsepower" = "hp",
                                      "Weight (1000 lbs)" = "wt",
                                      "1/4 mile time" = "qsec"), "hp"),
                        selectInput("var2", "Variable on OY:", 
                                    c("Cylinders" = "cyl",
                                      "Transmission" = "am",
                                      "Gears" = "gear",
                                      "Miles per gallon" = "mpg",
                                      "Horsepower" = "hp",
                                      "Weight (1000 lbs)" = "wt",
                                      "1/4 mile time" = "qsec"), "mpg"),
                        
                        h4("Relationship between a set of variables 
                           and miles per gallon (MPG)"),
                        
                        selectInput("trans", "Choose a transmission:", 
                                    choices = c("automatic", "manual")),
                        numericInput("cylin", "Number of cylinders:", 
                                     value = 6, min = 2, max = 12, step = 2),
                        sliderInput("weight", "Weight (lbs):", 
                                    value =  3500, min = 1000, 
                                    max = 6000, step = 100)
                ),
                
                mainPanel(
                        plotOutput("plotIt"),
                        h3("Results of Prediction (MPG)"),
                        verbatimTextOutput("prediction")

                )
        )
))