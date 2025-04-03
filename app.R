library(shiny)
library(ggplot2)
library(ggthemes)
library(readr)
library(dplyr)
library(lubridate)

# Cargar los datos
datos <- read_csv("Datos históricos USD_MXN.csv")

# Limpieza inicial
datos <- datos %>%
  rename(
    Fecha = `Fecha`,
    Cierre = `Cierre`,
    Apertura = `Apertura`,
    Máximo = `Máximo`,
    Mínimo = `Mínimo`,
    Variacion = `% var.`
  ) %>%
  mutate(
    Fecha = dmy(Fecha), # Convertir a formato fecha
    Variacion = as.numeric(gsub("%", "", Variacion))
  ) %>%
  arrange(Fecha)

# UI ----
ui <- fluidPage(
  theme = shinythemes::shinytheme("flatly"),  # Estilo azul minimalista
  titlePanel("USD/MXN - Historial Financiero"),
  
  sidebarLayout(
    sidebarPanel(
      dateRangeInput(
        inputId = "rango_fechas",
        label = "Selecciona el rango de fechas:",
        start = min(datos$Fecha),
        end = max(datos$Fecha)
      )
    ),
    
    mainPanel(
      plotOutput("grafico_ts"),
      br(),
      textOutput("estadisticas"),
      br(),
      tags$p("Fuente: "),
      tags$a(href = "https://mx.investing.com/currencies/usd-mxn-historical-data",
             "Investing.com", target = "_blank")
    )
  )
)

# Server ----
server <- function(input, output) {
  
  datos_filtrados <- reactive({
    datos %>%
      filter(Fecha >= input$rango_fechas[1],
             Fecha <= input$rango_fechas[2])
  })
  
  output$grafico_ts <- renderPlot({
    ggplot(datos_filtrados(), aes(x = Fecha, y = Cierre)) +
      geom_line(color = "#0072B2", size = 1) +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, face = "bold"),
        axis.title = element_text(size = 14)
      ) +
      labs(
        title = "Tipo de cambio USD/MXN (Cierre)",
        x = "Fecha",
        y = "Valor de cierre"
      )
  })
  
  output$estadisticas <- renderText({
    df <- datos_filtrados()
    promedio <- mean(df$Cierre, na.rm = TRUE)
    maximo <- max(df$Cierre, na.rm = TRUE)
    minimo <- min(df$Cierre, na.rm = TRUE)
    
    paste0("Promedio: ", round(promedio, 4),
           " | Máximo: ", round(maximo, 4),
           " | Mínimo: ", round(minimo, 4))
  })
}

# Run App ----
shinyApp(ui = ui, server = server)
