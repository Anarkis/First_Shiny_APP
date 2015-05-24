# About
LuisTT  
24 May 2015  

I this project we read the dataset `Loblolly` and filter the data related to the seed numbers: 325,307,331,321,319 and 305.


```r
summary(Loblolly)
```


```r
data_filtered <- filter(Loblolly, Loblolly$Seed %in% input$seed)
```

We also calculate a height prediction for the next 5 year from the last year, divided by 12

```r
last_year <- filter(data_filtered, age==25)
last_year$age <- last_year$age+5
last_year$height <- last_year$height+(last_year$height/12)

data_filtered <- rbind(data_filtered,last_year)
```

Finally\, we draw a plot with the data and the prevision.
