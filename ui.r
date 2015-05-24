library(shiny)
shinyUI(pageWithSidebar(
  titlePanel('Developing Data Products Using mtCar dataset in R'),
  sidebarPanel(
    h4('Enter the below parameter'),
    radioButtons("am", "Transmission Type", c('Automatic - 0' =0 ,'Manual - 1' = 1),selected=0),
    radioButtons('cyl', 'No. of cylinders:', c('4' = 4, '6' = 6, '8' = 8), selected = '4'), # example of radio button input
    numericInput('wt', 'Weight (lbs):', 3000, min = 1000, max = 5000, step = 100),
    sliderInput('hp', 'Horsepower',100,
                min=50, max=500, 
                step=10, round=0)
  ),
  mainPanel(
    plotOutput('plots'),
    h5('Prediction of MPG based on selected parameters'),
    verbatimTextOutput("prediction")
  )
))