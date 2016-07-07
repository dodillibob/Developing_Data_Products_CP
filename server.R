
mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("automatic", "manual")
fit <- lm(formula = mpg ~ cyl + wt + am, data = mtcars)

server <- shinyServer(function(input, output) {
        # create a plot   
        createPlot <- reactive({
                var1 <- input$var1
                var2 <- input$var2
                ggplot(mtcars, aes_string(var1, var2, color= "am")) +
                        geom_point() + geom_smooth(method="lm", se=FALSE)
        })
        
        lInput <- reactive({
                cylInput <- input$cylin
                wtInput <- input$weight/1000
                amInput <- input$trans
                new <- data.frame(cyl = cylInput, wt = wtInput, am = amInput)
                predict(fit, newdata = new)
        })
        
        # just plot the plot
        output$plotIt <- renderPlot({
                createPlot()
        })
        
        output$prediction <- renderPrint({
                lInput()
        })
})