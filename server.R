library(shiny)

shinyServer(
        function(input, output) {
            
            output$sim_plot <- renderPlot({
                
                # set random seed
                set.seed(1)
                
                # run simulation
                d<-rnorm(
                    n=input$n_simulations
                    ,mean=input$mu
                    ,sd=input$s
                ) 
            
                # calculate confidence interval
                tt<-t.test(
                    x=d
                    ,alternative = "two.sided"
                    ,conf.level=1-input$alpha
                )$conf.int
                
                # CI properties
                output$ci <- renderPrint({c(round(tt[1],2),round(tt[2],2))})
                output$ci_width <- renderPrint({round((tt[2]-tt[1]),2)})
            
                # generate a histogram
                hist(
                    x=d
                    ,breaks=input$n_breaks#ceiling(sqrt(input$n_simulations))
                    ,freq=FALSE
                    ,main=paste(
                        "Histogram of Simulated Data, Plus Confidence Interval"
                        ,"\n"
                        ,"mu="
                        ,input$mu
                        ,", sd="
                        ,input$s
                        ,", number of simulations="
                        ,input$n_simulations
                        ,"\n"
                        ,(1-input$alpha)
                        ," confidence interval"
                    ) 
                    ,xlab=''
                )
                
                # add confidence interval
                abline(
                    v = c(tt[1],tt[2])
                    ,col = "red"
                    ,lwd = 2
                )
                
            }
        )
    }
)