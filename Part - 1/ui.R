#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny app to create page for Cars Data"),
  
  tabPanel("Analysis",
           fluidPage(
             titlePanel("The relationship between variables and miles per gallon (MPG)"),
             sidebarLayout(
               sidebarPanel(
                 selectInput("variable", "Variable:",
                             c("Number of cylinders" = "cyl",
                               "Displacement (cu.in.)" = "disp",
                               "Gross horsepower" = "hp",
                               "Rear axle ratio" = "drat",
                               "Weight (lb/1000)" = "wt",
                               "1/4 mile time" = "qsec",
                               "V/S" = "vs",
                               "Transmission" = "am",
                               "Number of forward gears" = "gear",
                               "Number of carburetors" = "carb"
                             )),
                 
                 checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
               ),
               
               mainPanel(
                 h3(textOutput("caption")),
                 
                 tabsetPanel(type = "tabs", 
                             tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                             tabPanel("Regression model", 
                                      plotOutput("mpgPlot"),
                                      verbatimTextOutput("fit")
                             )
                 )
               )
             )
           )
  ),
  tabPanel("Check the Source Code",
           h2("All the Source code can be find in Github")

  ),
  tabPanel("More Data Detail",
           h2("Motor Trend Car Road Tests"),
           hr(),
           h3("Description"),
           helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                    " and comprises fuel consumption and 10 aspects of automobile design and performance",
                    " for 32 automobiles (1973-74 models)."),
           h3("Format"),
           p("A data frame with 32 observations on 11 variables."),
           
           p("mpg -         Miles/(US) gallon"),
           p("cyl-	 Number of cylinders"),
           p("disp-	 Displacement (cu.in.)"),
           p("hp-	 Gross horsepower"),
           p("drat-	 Rear axle ratio"),
           p("wt-	 Weight (lb/1000)"),
           p("qsec-	 1/4 mile time"),
           p("vs-	 V/S"),
           p("am-	 Transmission (0 = automatic, 1 = manual)"),
           p("gear-	 Number of forward gears"),
           p("carb-	 Number of carburetors"),
           
           h3("Source"),
           
           a("https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html")
  ),
  tabPanel("Go back to my Github repository",
           a("https://github.com/send2kavr/carsdata")

)
)
)
