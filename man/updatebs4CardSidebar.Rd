% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update-functions.R, R/aliases.R
\name{updatebs4CardSidebar}
\alias{updatebs4CardSidebar}
\alias{updateCardSidebar}
\title{Programmatically toggle a bs4Card sidebar}
\usage{
updatebs4CardSidebar(session, inputId)

updateCardSidebar(session, inputId)
}
\arguments{
\item{session}{Shiny session object.}

\item{inputId}{Card sidebar id.}
}
\description{
Programmatically toggle a bs4Card sidebar

Alias to \link{updatebs4CardSidebar}
See \link{updatebs4CardSidebar} for full details
}
\examples{
if (interactive()) {
 library(shiny)
 library(bs4Dash)
 
 shinyApp(
  ui = bs4DashPage(
    sidebar_collapsed = FALSE,
    controlbar_collapsed = TRUE,
    enable_preloader = FALSE,
    navbar = bs4DashNavbar(skin = "dark"),
    body = bs4DashBody(
      bs4Card(
        title = "Closable Box with gradient", 
        closable = TRUE, 
        width = 12,
        height = "500px",
        solidHeader = FALSE, 
        collapsible = TRUE,
        actionButton("update", "Toggle card sidebar"),
        sidebar = bs4CardSidebar(
          inputId = "mycardsidebar",
          p("Sidebar Content")
        )
      )
    ),
    sidebar = bs4DashSidebar(),
    controlbar = bs4DashControlbar(),
    footer = bs4DashFooter()
  ),
  server = function(input, output, session) {
    observe(print(input$mycardsidebar))
    
    observeEvent(input$update, {
      updatebs4CardSidebar(session, inputId = "mycardsidebar")
    })
    
  }
 )
}
}
