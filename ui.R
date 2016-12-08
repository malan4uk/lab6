library(shiny)

checkbox <- function(){
  data <- read.table("database.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  result <- as.vector(data[,1])
  names(result) <- result
  return (result)
}

shinyUI(pageWithSidebar(
  headerPanel("Temperature in Kiev"),
  
  sidebarPanel(
    checkboxGroupInput("year", "Select year:", checkbox())
  ),
  
  mainPanel(
    plotOutput("plot")
  )
)
)