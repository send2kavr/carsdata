#
# This is the server logic of a Shiny web application. 
#


library(shiny)
library(datasets)

# Getting Cars Data and storing it into a variable called cars_data

cars_data <- mtcars

# filtering manual and automatic transmission

cars_data$am <- factor(cars_data$am, labels = c("Automatic","Manual"))

# 
shinyServer(function(input, output) {
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=cars_data)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = cars_data,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(cars_data, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })  
 
})
