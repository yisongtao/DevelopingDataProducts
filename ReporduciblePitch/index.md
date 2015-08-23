---
title       : mtcars Dataset Analysis
subtitle    : Developing Data Product Course Project
author      : Yisong Tao
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Purpose of this app

- This app is developed for Developing Data Products Course Project.
- The app uses `mtcars` dataset in R `datasets` package, plots individual variables vs. Miles per Gallon (mpg) and demonstrates single variable regression model using mpg as outcome.
- The app is here: *https://yisongtao.shinyapps.io/DevelopingDataProducts*

--- .class #id 

## mtcars Dataset

- The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).
- The dataset is included in R 'datasets' package.


---

## mtcars Dataset 
- Variables in the dataset

| Index | Field | Detail |
------- | ----- | ------ |
| [, 1] | mpg | Miles per Gallon |
| [, 2]  | cyl | Number of Cylinders |
| [, 3]	| disp | Displacement (cu.in.) |
| [, 4]	| hp | Horsepower |
| [, 5]	| drat | Rear Axle Ratio |
| [, 6]	| wt | Weight (lb/1000) |
| [, 7]	| qsec | 1/4 mile time |
| [, 8]	| vs | V/S |
| [, 9]	| am | Transmission (0 = automatic, 1 = manual) |
| [,10]	| gear | Number of forward gears |
| [,11]	| carb | Number of carburetors |

---

## Analysis Code
```
    formulaTextPoint <- reactive({
        paste("mpg ~", "as.numeric(", input$variable, ")")
    })
    fit <- reactive({
        lm(formulaText(), data=mtcars)
    })
    output$fitPlot <- renderPlot({
        with(mtcars, {
            plot(as.formula(formulaTextPoint()), xlab = formulaText(),
                 ylab = "Miles per Gallon",)
            abline(fit(), col=2)
        })
    })
```

- Code on Github: *https://github.com/yisongtao/DevelopingDataProducts*
