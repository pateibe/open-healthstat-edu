##ttest
library(shiny)
ui <- fluidPage(
  withMathJax(),
    titlePanel("The Fundamental Model in Science: Simple linear model, 2-group t-test"),
    titlePanel("$$ Y_i=\\beta_1+\\beta_2 x_i+ N(0,\\sigma^2), i=1,...,n , x_i = 0,1 $$"),
    sidebarLayout(          
        sidebarPanel(
          titlePanel("Simulation from known truth"),
          sliderInput(inputId="beta0",label = "True Intercept", min = -100, max = 100, value =0),
          sliderInput(inputId="beta1",label = "True Slope", min = -100,max = 100,value =0),
          sliderInput(inputId="sigma",label = "True sigma:",min = 0,max = 50,value = 10)
          ),
        mainPanel(
          titlePanel("Analysis"),
          sliderInput(inputId="n",label = "Sample Size:",min = 20,max = 1000,value = 60),
                  actionButton(inputId = "refresh",label = "Refresh", icon = icon("fa fa-refresh")),
        verticalLayout("Red: Estimated expected value vor given predictor value", 
                       "Red dashed: Confidence bound for expected value given predictor value", 
                       "Blue: Prediction bound for future observation given predictor value"),
        plotOutput(outputId = "LMplot",width="30%"),
        verbatimTextOutput(outputId="fit"),
        verbatimTextOutput(outputId="test")
        )))
server <- function(input, output) {
    xfix<-as.factor(seq(0,1,by=1))
    x<-reactive({input$refresh;as.factor(sample(c(0,1),input$n,replace=TRUE))})
    y<-reactive({input$beta0+input$beta1*(as.numeric(x())-1)+rnorm(input$n,0,input$sigma)})
    fit<-reactive({lm(y()~x())})
    test<-reactive({t.test(y()~x(),var.equal=TRUE)})
    output$LMplot <- renderPlot({
      stripchart(y()~x(),xlab="predictor",ylab="value",vertical=TRUE)
      results<-data.frame(y=y(),x=x())
      lmod<-lm(y~x,data=results)
      conf_interval <- predict(lmod,newdata=data.frame(x=xfix), interval="confidence",level = 0.95)
      lines(xfix, conf_interval[,1], col="red", lwd=2,type="b")
      lines(xfix, conf_interval[,2], col="red", lty=2,type="b")
      lines(xfix, conf_interval[,3], col="red", lty=2,type="b")
      pred_interval <- predict(lmod,newdata=data.frame(x=xfix),interval="prediction",level = 0.95)
      lines(xfix, pred_interval[,2], col="blue", lty=2,type="b")
      lines(xfix, pred_interval[,3], col="blue", lty=2,type="b")
    })
    output$fit<-renderPrint({summary(fit())})
    output$test<-renderPrint({test()})
}    
shinyApp(ui = ui, server = server)
