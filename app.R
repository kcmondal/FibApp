


ui <- fluidPage(
  titlePanel("Fibonacci"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Print the Fibonacci Number and it's inverse."),
      
      sliderInput("n", label = "Number n for fibonacci:", min = 0, max = 100, value = 4)
    ),
    
    mainPanel(
      textOutput("fib_num"),
      
      textOutput("fib_num_inv")
      
    ) 
  )
)



fib <- function(n){
  ifelse(n<3, 1, fib(n-1)+fib(n-2))
}


server <- function(input, output) {
  output$fib_num <- renderText({
    paste("Fibonacci number for the selected number ", input$n, " is = ", fib(as.numeric(input$n)))
  })
  
  output$fib_num_inv <- renderText({
    #1 / fib(as.numeric(input$n))
    #paste(1 / fib(as.numeric(input$n)))
    paste("Inverse of the fibonacci number of ", input$n, " is = ", 1/fib(as.numeric(input$n)))
  })
}


shinyApp(ui=ui, server=server)
