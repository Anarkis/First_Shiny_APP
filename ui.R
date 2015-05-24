library(shiny)
shinyUI(navbarPage("Loblolly trees",
        tabPanel("Plot",
            pageWithSidebar(
                
                headerPanel("Growth of Loblolly pine trees"),
                sidebarPanel(
                    checkboxGroupInput("seed","Number of Seed",
                                       c("325"=325,"307"=307,
                                         "331"=331,"321"=321,
                                         "319"=319,"305"=305)
                    ),
                    submitButton('Submit')        
                ),
                     
                mainPanel(
                    h3('Input:'),
                    h4('You have selected the seed numbers:'),
                    verbatimTextOutput("inputValue"),
                    h3('Output:'),
                    h4('Tree Height developed in time'),
                    plotOutput('newBarplot'),
                    h4('Mean Tree height (fts)'),
                    verbatimTextOutput("meanValue")
                )
            )
        ),
        tabPanel("About",
            includeMarkdown("about.md")
        )
)
)