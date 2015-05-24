---
title       : Developing Data product
subtitle    : 
author      : Betty Yeo
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
---

## Developing Data product

The purpose of the project is to build a shiny application and a slidify presentation. The assignment make use of the mtcars dataset to predict the miles per galon. The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles .


```r
library(datasets)
head(mtcars, 5)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
```

--- .class #id

## Parameters

We are interested to examine the correlation of the mpg with the following:

-Transmission Type (Automatic , Manual)
-No. of Cylinders
-Weight of the cars
-Horsepower

Users will be presented with a user interface to input the parameter to see the correlation with the mpg

--- .class #id 

## Computation using Linear Model
Using Linear model coeeficient which would be used to predict the MPG based on the input parameter


```r
lm(mpg ~ hp + cyl + wt +am, data=mtcars)
```

```
## 
## Call:
## lm(formula = mpg ~ hp + cyl + wt + am, data = mtcars)
## 
## Coefficients:
## (Intercept)           hp          cyl           wt           am  
##    36.14654     -0.02495     -0.74516     -2.60648      1.47805
```


--- .class #id

## Pediction model

This shiny application is deployed [here](https://bettyyeo.shinyapps.io/datapdt) 

![](assets/img/app.png)

--- .class #id
## Further instruction

You can view the source codes and clone both the Server.R and UI.R files [here](https://github.com/bettyyeo/producedataproduct) in R-Studio and do a runApp
