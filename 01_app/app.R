library(shiny)

# Define UI ---
ui <- fluidPage(
    titlePanel("01 app title"),
    
    sidebarLayout(
        # sidebarPanel(
        #     h1("Installation"),
        #     p("Shiny is avaialbe ....:"),
        #     code("this is code"),
        #     h3("test on side", align = "center")
        #     ),
        # sidebarPanel("sidebar panel2 is xxxx"),
        # mainPanel(
        #     h1("main panel XXXX"),
        #     p("paragraph 1"),
        #     a("this is link"),
        #     # png should  be in www/png
        #     p(img(src = "rstudio.png", height = 140, width = 400)),
        #     br(),
        #     br(),
        #     h2("title h2"),
        #     p("- real dash printed"),
        #     p("- real hyphen printed")
        #     ),
        
        # try fluidrow ----
        fluidRow(
            column(
                3,
                h3("ada"),
                selectInput(
                    "sss",
                    h3("select inpu bottons"),
                    choices = list(
                        "c1" = 1,
                        "c2" = 2,
                        "c3" = 3,
                        selected = 1)
                    )
                ),
            column(
                3,
                sliderInput(
                    "slider_input", h3("slider input bottons"),
                    min=0, max=100, value=c(0,100))
                   ),
            column(
                3,
                textInput("text", h3("Text input"),
                          value = "Enter text..."))
        ),
        # 
        mainPanel(
            textOutput("selected_abc")
        ),
    ),
    
    fluidRow(
        column(
            3,
            h3("ada"),
            selectInput(
                "selectinput",
                h3("select inpu bottons"),
                choices = c(
                    "c1", "c2", "c3")
            )
        ),
        column(
            3,
            sliderInput(
                "slider_input", h3("slider input bottons"),
                min=0, max=100, value=c(0,100))
        ),
        column(
            3,
            wellPanel(
                textInput("text", h3("Text input"),
                      value = "Enter text...")))
    )
    

)

# Define server logic ----
server <- function(input, output) {
    output$selected_abc <- renderText({
        paste("You have selected this", input$sss)
    })
}

# Run the app ----
shinyApp(ui = ui, server = server)