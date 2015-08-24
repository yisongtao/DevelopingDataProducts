library(shiny)

shinyUI(
    navbarPage("mtcars Analysis",
               tabPanel("Description",
                        h2("Motor Trend Car Road Tests Data Analysis"),
                        hr(),
                        h3("Description"),
                        helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                                 " and comprises fuel consumption and 10 aspects of automobile design and performance",
                                 " for 32 automobiles (1973–74 models)."
                                 ),
                        p(" This app plots individual variables vs. Miles per Gallon (mpg) and demonstrates single variable regression model using mpg as outcome."),
                        h3("Data format"),
                        p("A data frame with 32 observations on 11 variables."),
                        
                        p("  [, 1]   mpg	 Miles per Gallon"),
                        p("  [, 2]	 cyl	 Number of Cylinders"),
                        p("  [, 3]	 disp	 Displacement (cu.in.)"),
                        p("  [, 4]	 hp	 Horsepower"),
                        p("  [, 5]	 drat	 Rear Axle Ratio"),
                        p("  [, 6]	 wt	 Weight (lb/1000)"),
                        p("  [, 7]	 qsec	 1/4 mile time"),
                        p("  [, 8]	 vs	 V/S"),
                        p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                        p("  [,10]	 gear	 Number of forward gears"),
                        p("  [,11]	 carb	 Number of carburetors")
                        
                        
               ),
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("The relationship between variables and miles per gallon (MPG)"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Number of Cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Horsepower" = "hp",
                                                  "Rear Axle Ratio" = "drat",
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
                                                         plotOutput("fitPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("Code and More Analysis",
                        p("Code on github"),
                        a("https://github.com/yisongtao/DevelopingDataProducts"),
                        p("More analysis of the dataset from Regression Model Course on github"),
                        a("http://yisongtao.github.io/RegressionModel_CourseProject.html")
               )
    )
)