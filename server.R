library(UsingR)
library(shiny)
library(ggplot2)
library(dplyr)
data(Loblolly)

shinyServer(
    function(input, output) {
        output$inputValue <- renderPrint({input$seed})
        
        output$newBarplot <- renderPlot({
            data_filtered <- filter(Loblolly, Loblolly$Seed %in% input$seed)
            
            ggplot(data=data_filtered, aes(x=age,y=height,colour=Seed)) + 
                geom_line() + scale_fill_brewer(palette="Spectral") +
                xlab("Years") + ylab("Tree Heights (ft)")          
        })
        
        output$meanValue <- renderPrint({
            data_filtered <- filter(Loblolly, Loblolly$age==25, Loblolly$Seed %in% input$seed)
            mean(data_filtered$height)
            
        })
        
    }
)