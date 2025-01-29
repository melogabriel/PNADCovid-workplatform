# Load required libraries
library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(plotly)
library(DT)

# Load the dataset
trabalhadoresAPP_2020 <- read.csv("trabalhadoresAPP_2020.csv", header = FALSE)

# Remove the first line
trabalhadoresAPP_2020 <- trabalhadoresAPP_2020[-1, ]

# Process the dataset
trabalhadoresAPP_2020 <- trabalhadoresAPP_2020 %>%
  select(Year = V1, 
         Month = V2, 
         UF = V3, 
         Idade = V12, 
         Sexo = V13, 
         `Cor ou Raca` = V14, 
         Escolaridade = V15,
         `Tipo de Ocupacao` = V16,
         `Carteira Assinada` = V17,
         Funcao = V18,
         `Carga horaria semanal habitual` = V19,
         `Rendimentos habituais` = V22,
         `Contribui para o INSS` = V23) %>%
  mutate(
    Idade = as.numeric(Idade),
    `Faixa Etaria` = cut(
      Idade,
      breaks = c(-Inf, 17, 29, 39, 49, 59, 69, Inf),
      labels = c("Menor que 18", "18-29", "30-39", "40-49", "50-59", "60-69", "70+"),
      right = TRUE
    )
  )

# UI layout using shinydashboard
ui <- dashboardPage(
  skin = "blue",  # Choose a skin color (blue, black, purple, green, red, yellow)
  dashboardHeader(title = "Trabalhadores App 2020"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Tabela", tabName = "table", icon = icon("table")),
      menuItem("Gráficos", tabName = "graphs", icon = icon("chart-bar"))
    ),
    hr(),
    h4("Filtros", style = "padding-left: 15px;"),
    selectInput("year", "Ano:", choices = c("Todos", unique(trabalhadoresAPP_2020$Year))),
    selectInput("month", "Mês:", choices = c("Todos", 1:12)),
    uiOutput("state_filter"),
    uiOutput("occupation_filter"),
    selectInput("age_group", "Faixa Etária:", choices = c("Todos", levels(trabalhadoresAPP_2020$`Faixa Etaria`))),
    actionButton("reset", "Redefinir filtros", icon = icon("sync")),
    downloadButton("downloadData", "Baixar Dados Filtrados", style = "margin-left: 15px; margin-top: 10px;")
  ),
  
  dashboardBody(
    tabItems(
      # Table tab
      tabItem(
        tabName = "table",
        fluidRow(
          box(
            title = "Tabela de Dados", 
            width = 12, 
            solidHeader = TRUE, 
            status = "primary",
            DTOutput("data_table")
          )
        )
      ),
      
      # Graphs tab
      tabItem(
        tabName = "graphs",
        fluidRow(
          box(
            title = "Distribuição por Faixa Etária e Tipo de Ocupação", 
            width = 6, 
            solidHeader = TRUE, 
            status = "primary",
            plotlyOutput("bar_chart")
          ),
          box(
            title = "Distribuição por Sexo", 
            width = 6, 
            solidHeader = TRUE, 
            status = "primary",
            plotlyOutput("pie_gender")
          )
        ),
        fluidRow(
          box(
            title = "Distribuição por Raça", 
            width = 6, 
            solidHeader = TRUE, 
            status = "primary",
            plotlyOutput("pie_race")
          ),
          box(
            title = "Distribuição por Escolaridade", 
            width = 6, 
            solidHeader = TRUE, 
            status = "primary",
            plotlyOutput("pie_education")
          )
        ),
        fluidRow(
          box(
            title = "Distribuição por Unidade da Federação", 
            width = 12, 
            solidHeader = TRUE, 
            status = "primary",
            plotlyOutput("state_bar_chart")
          )
        )
      )
    )
  )
)

# Server logic
server <- function(input, output, session) {
  
  output$state_filter <- renderUI({
    states <- unique(trabalhadoresAPP_2020$UF)
    selectInput("state", "Unidade da Federação (UF):", choices = c("Todos", states))
  })
  
  output$occupation_filter <- renderUI({
    occupations <- unique(trabalhadoresAPP_2020$`Tipo de Ocupacao`)
    selectInput("occupation", "Tipo de Ocupação:", choices = c("Todos", occupations))
  })
  
  filtered_data <- reactive({
    data <- trabalhadoresAPP_2020
    if (input$year != "Todos") data <- data %>% filter(Year == as.numeric(input$year))
    if (input$month != "Todos") data <- data %>% filter(Month == as.numeric(input$month))
    if (input$state != "Todos") data <- data %>% filter(UF == input$state)
    if (input$occupation != "Todos") data <- data %>% filter(`Tipo de Ocupacao` == input$occupation)
    if (input$age_group != "Todos") data <- data %>% filter(`Faixa Etaria` == input$age_group)
    data
  })
  
  output$data_table <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 10), rownames = FALSE)
  })
  
  output$bar_chart <- renderPlotly({
    data <- filtered_data()
    gg <- ggplot(data, aes(x = `Faixa Etaria`, fill = `Tipo de Ocupacao`)) +
      geom_bar(position = "dodge") +
      theme_minimal() +
      labs(title = "Distribuição por Faixa Etária e Tipo de Ocupação", x = "Faixa Etária", y = "Contagem")
    ggplotly(gg)
  })
  
  output$pie_gender <- renderPlotly({
    data <- filtered_data()
    plot_ly(data, labels = ~Sexo, type = "pie", textinfo = "label+percent", insidetextorientation = "radial") %>%
      layout(title = "Distribuição por Sexo")
  })
  
  output$pie_race <- renderPlotly({
    data <- filtered_data()
    plot_ly(data, labels = ~`Cor ou Raca`, type = "pie", textinfo = "label+percent", insidetextorientation = "radial") %>%
      layout(title = "Distribuição por Raça")
  })
  
  output$pie_education <- renderPlotly({
    data <- filtered_data()
    plot_ly(data, labels = ~Escolaridade, type = "pie", textinfo = "label+percent", insidetextorientation = "radial") %>%
      layout(title = "Distribuição por Escolaridade")
  })
  
  output$state_bar_chart <- renderPlotly({
    data <- filtered_data() %>% group_by(UF) %>% summarise(Count = n())
    gg <- ggplot(data, aes(x = reorder(UF, Count), y = Count)) +
      geom_bar(stat = "identity", fill = "steelblue") +
      coord_flip() +
      theme_minimal() +
      labs(title = "Distribuição por Unidade da Federação", x = "UF", y = "Contagem")
    ggplotly(gg)
  })
  
  observeEvent(input$reset, {
    updateSelectInput(session, "year", selected = "Todos")
    updateSelectInput(session, "month", selected = "Todos")
    updateSelectInput(session, "state", selected = "Todos")
    updateSelectInput(session, "occupation", selected = "Todos")
    updateSelectInput(session, "age_group", selected = "Todos")
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("filtered_data_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data(), file, row.names = FALSE)
    }
  )
}

shinyApp(ui = ui, server = server)