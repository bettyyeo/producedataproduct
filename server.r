# Load the shiny library
library(shiny)

# Download the mtcars dataset
data(mtcars)

model <- lm(mpg ~ hp + cyl + wt +am, data=mtcars)

calculateMpg <- function(hp, cyl, wt, am) {
  model$coefficients[1] + model$coefficients[2] * hp +
    model$coefficients[3] * cyl + model$coefficients[4] * wt 
  #+ model$coefficients[5] * am
  
}

shinyServer(
  function(input, output) {
    
    prediction <- reactive({calculateMpg(input$hp, as.numeric(input$cyl), input$wt/1000, as.numeric(input$am))})
   
    output$inputParams <- renderPrint({paste(input$cyl, "cylinders, ",
                                             input$hp, "horsepower, ",
                                             input$wt, "lbs, ",
                                             input$am,"transmission type" )
    })
    
    
    output$prediction <- renderPrint({paste(round(prediction(), 2), "miles per gallon")})
    
    output$plots <- renderPlot({
      par(mfrow = c(1, 4))
      # (1, 1)
      with(mtcars, plot(hp, mpg,
                        xlab='Gross horsepower',
                        ylab='MPG',
                        main='MPG vs horsepower'))
      points(input$hp, prediction(), col='blue', cex=4)
      # (1, 2)
      with(mtcars, plot(cyl, mpg,
                        xlab='Number of cylinders',
                        ylab='MPG',
                        main='MPG vs cylinders'))
      points(as.numeric(input$cyl), prediction(), col='blue', cex=4)
      # (1, 3)
      with(mtcars, plot(wt, mpg,
                        xlab='Weight (lb/1000)',
                        ylab='MPG',
                        main='MPG vs weight'))
      points(input$wt/1000, prediction(), col='blue', cex=4)
    
      # (1, 4)
      with(mtcars, plot(am, mpg,
                        xlab='Transmission',
                        ylab='MPG',
                        main='MPG vs transmission'))
    
      points(input$am, prediction(), col='blue', cex=4)
      
      
    })
  }
)