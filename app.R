library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Simple Linear Regression on the Iris dataset"),
  sidebarLayout(
    
    sidebarPanel(
      selectInput(
        "y",
        "Dependent/response variable",
        choices = names(iris)[1:4]
      ),
      selectInput(
        "x",
        "Inependent/explanatory variable",
        choices = names(iris),
        selected = "Sepal.Width"
      )
    ),
    
    mainPanel(
      plotOutput("scatter"),
      textOutput("summary")
    )
    
  )
)

server <- function(input, output) {
  
  output$scatter <- renderPlot({
    ggplot()
  })
  
  output$summary <- renderText({
    "Hello, friend."
  })
  
}

shinyApp(ui, server)