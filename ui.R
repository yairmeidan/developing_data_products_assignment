library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("What Affects a Confidence Interval for the Mean?"),
        sidebarPanel(
                h2("Preface and Instructions")
                ,h4("This shiny app relies the MOOC 'Statistical Inference' given by JHU via Coursera.")
                ,h4("It may supplement it by interactively showing the impact of changing several parameters on the confidence interval for the mean.")
                ,h4("All you have to do is 'play' with the input parameters and observe the output on the right.")
                ,h2('Input')
                ,numericInput(
                        inputId='mu'
                        ,label='Please enter mu (0 to 10 only)'
                        ,value=0
                        ,min = 0
                        ,max = 10
                        ,step = 1)
                ,numericInput(
                        inputId='s'
                        ,label='Please enter sd (0 to 10 only)'
                        ,value=1
                        ,min = 0
                        ,max = 10
                        ,step = 1)
                ,numericInput(
                        inputId='n_simulations'
                        ,label='Please enter number of simulations (100 to 10,000 only)'
                        ,value=100
                        ,min = 100
                        ,max = 10000
                        ,step = 100)
                ,numericInput(
                        inputId='alpha'
                        ,label='Please enter confidence level (0 to 1)'
                        ,value=0.05
                        ,min = 0
                        ,max = 1
                        ,step = 0.01)
                ,sliderInput(
                    "n_breaks"
                    ,"Please enter number of breaks (5 to 30)"
                    ,min=5
                    ,max=30
                    ,value=10
                    ,step=1)
        ),
        mainPanel(
                h2('Output'),
                h4('Confidence interval limits are:'),
                verbatimTextOutput("ci"),
                h4('Confidence interval width is:'),
                verbatimTextOutput("ci_width"),
                plotOutput("sim_plot")
        )
))