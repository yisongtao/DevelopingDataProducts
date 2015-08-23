library(shiny)
library(datasets)

data(mtcars)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("mpg ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("mpg ~", "as.numeric(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(formulaText(), data=mtcars)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = mtcars,
                xlab = formulaText(),
                ylab = "Miles per Gallon",
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$fitPlot <- renderPlot({
        with(mtcars, {
            plot(as.formula(formulaTextPoint()), 
                 xlab = formulaText(),
                 ylab = "Miles per Gallon",)
            abline(fit(), col=2)
        })
    })
    
})