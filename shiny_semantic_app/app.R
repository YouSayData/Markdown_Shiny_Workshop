library(shiny)
library(shiny.semantic)
library(leaflet)

myGridTemplate <- grid_template(
  default = list(
    areas = rbind(
      c("title", "map"),
      c("info", "map"),
      c("user", "map")
    ),
    cols_width = c("400px", "1fr"),
    rows_height = c("50px", "auto", "200px")
  ),
  mobile = list(
    areas = rbind(
      "title",
      "info",
      "map",
      "user"
    ),
    rows_height = c("50px", "100px", "auto", "200px"),
    cols_width = c("100%")
  )
)

# display_grid(myGridTemplate)

shinyApp(
  ui = semanticPage(
    grid(
      myGridTemplate,
      title = h1("Hello shiny.semantic Grid!"),
      info = textOutput("sidebarStatistics"),
      map = textOutput("polluters_map"),
      user = div(
        shiny.semantic::toggle("toggle", "let's toggle"),
        shiny.semantic::multiple_checkbox(
          "mycheckbox", 
          "mycheckbox", 
          c("option A","option B","option C")
        )
      )
    )
  ),
  server = shinyServer(function(input, output) {})
)