read.data <- function(){
  read.table("database.txt", sep = ";", header = TRUE, encoding = "UTF-8")
}

data <- read.data()

draw_ <- function(year, length){
  index <- 0
  
  for(i in 1:nrow(data)){
    if(data[i, 1] == year){
      index <- i
    }
  }
  
  if(index == 0){
    return()
  }
  
  plot(2:13, data[index, 2:13], type = "o", xaxt = "n", xlab = "Months", ylab = "Temperature")
  title(data[index, 1])
  axis(1, at = 1:length(data),  labels = names(data))
}

draw <- function(year){
  if(is.null(year)){
    return()
  }
  
  par(mfrow = c(length(year), 1))
  
  for(i in 1:length(year)){
    draw_(year[i], length(year))
  }
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$year)
    })
  }
)