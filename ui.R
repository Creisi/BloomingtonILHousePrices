shinyUI(pageWithSidebar(
   headerPanel("Bloomington, IL House Sale Prices: 2009-2015"),
   sidebarPanel(
      sliderInput('nh', 'Neighborhood',value=c(0,112),min=0,max=112
                        ),
      sliderInput('sf', 'Total Square Feet',value=c(0,6062),min=0,max=6162
      ),
      checkboxGroupInput('stry','House Type',
                         c("1 Story"="1 Story",
                           "1.5 & 1 Story"="1.5 & 1 Story",
                           "1.5 Finished"="1.5 Finished",
                           "1.5 Unfinished"="1.5 Unfinished",
                           "2 & 1 Story"="2 & 1 Story",
                           "2 & 1.5 Story"="2 & 1.5 Story",
                           "2 Story"="2 Story",
                           "Dr/Bi-Level"="Dr/Bi-Level",
                           "L Bi-Level"="L Bi-Level",
                           "Quad-Level"="Quad-Level",
                           "St Bi-Level"="St Bi-Level",
                           "Tri-Level"="Tri-Level"
                         ),selected=
                            c("1 Story"="1 Story",
                              "1.5 & 1 Story"="1.5 & 1 Story",
                              "1.5 Finished"="1.5 Finished",
                              "1.5 Unfinished"="1.5 Unfinished",
                              "2 & 1 Story"="2 & 1 Story",
                              "2 & 1.5 Story"="2 & 1.5 Story",
                              "2 Story"="2 Story",
                              "Dr/Bi-Level"="Dr/Bi-Level",
                              "L Bi-Level"="L Bi-Level",
                              "Quad-Level"="Quad-Level",
                              "St Bi-Level"="St Bi-Level",
                              "Tri-Level"="Tri-Level"
                            ),inline=TRUE),
      checkboxGroupInput('extwall','House Exterior',
                         c("Alum/Vinyl"="Alum/Vinyl",
                           "Brick Front"="Brick Front",
                           "Wood"="Wood",
                           "Brick & Frame"="Brick & Frame",
                           "Brick"="Brick",
                           "Asphalt Shingle"="Asphalt Shingle",
                           "Masonite "="Masonite ",
                           "Stucco"="Stucco"
                         ),selected=
                            c("Alum/Vinyl"="Alum/Vinyl",
                              "Brick Front"="Brick Front",
                              "Wood"="Wood",
                              "Brick & Frame"="Brick & Frame",
                              "Brick"="Brick",
                              "Asphalt Shingle"="Asphalt Shingle",
                              "Masonite "="Masonite ",
                              "Stucco"="Stucco"
                            ),inline=TRUE),
      checkboxGroupInput('bsmnt','Basement',c(
            "Finished"=1,
            "Unfinished"=0),
            selected=(c(
               "Finished"=1,
               "Unfinished"=0))),
      selectInput('shape','What the shape in the plot represents',
                  choices=list('House Type'='Story','House Exterior'='ExtWalls'),
                               selected='Story'
                     ),
      h3('Regression Input'),
      h4('Input values to model the sale price of a house based on a regression
         analysis of the data'),
      selectInput('newNH','Neighborhood',choices=
                     list("0"=0,
                          "1"=1,
                          "2"=2,
                          "3"=3,
                          "4"=4,
                          "5"=5,
                          "6"=6,
                          "7"=7,
                          "8"=8,
                          "9"=9,                          
                          "10"=10,
                          "11"=11,
                          "12"=12,
                          "13"=13,
                          "14"=14,
                          "15"=15,
                          "16"=16,
                          "17"=17,
                          "18"=18,
                          "19"=19,
                          "20"=20,
                          "21"=21,
                          "22"=22,
                          "23"=23,
                          "25"=25,
                          "26"=26,
                          "28"=28,
                          "29"=29,
                          "30"=30,
                          "31"=31,
                          "32"=32,
                          "33"=33,
                          "34"=34,
                          "35"=35,
                          "36"=36,
                          "37"=37,
                          "38"=38,
                          "39"=39,
                          "40"=40,
                          "41"=41,
                          "42"=42,
                          "43"=43,
                          "44"=44,
                          "45"=45,
                          "46"=46,
                          "47"=47,
                          "48"=48,
                          "49"=49,
                          "50"=50,
                          "51"=51,
                          "52"=52,
                          "53"=53,
                          "54"=54,
                          "55"=55,
                          "56"=56,
                          "57"=57,
                          "58"=58,
                          "60"=60,
                          "61"=61,
                          "62"=62,
                          "64"=64,
                          "65"=65,
                          "66"=66,
                          "68"=68,
                          "69"=69,
                          "70"=70,
                          "71"=71,
                          "73"=73,
                          "74"=74,
                          "75"=75,
                          "76"=76,
                          "78"=78,
                          "79"=79,
                          "80"=80,
                          "81"=81,
                          "82"=82,
                          "83"=83,
                          "84"=84,
                          "85"=85,
                          "86"=86,
                          "88"=88,
                          "89"=89,
                          "90"=90,
                          "91"=91,
                          "93"=93,
                          "95"=95,
                          "96"=96,
                          "97"=97,
                          "98"=98,
                          "99"=99,
                          "101"=101,
                          "102"=102,
                          "103"=103,
                          "104"=104,
                          "105"=105,
                          "108"=108,
                          "110"=110,
                          "111"=111,
                          "112"=112
                     ),selected=2),
      sliderInput('newSF', 'Total Square Feet',value=c(2500),min=0,max=6162
      ),
      selectInput('newExt','House Exterior',choices=
                     list("Alum/Vinyl"="Alum/Vinyl",
                          "Brick Front"="Brick Front",
                          "Wood"="Wood",
                          "Brick & Frame"="Brick & Frame",
                          "Brick"="Brick",
                          "Asphalt Shingle"="Asphalt Shingle",
                          "Masonite "="Masonite ",
                          "Stucco"="Stucco"
                        ),selected="Alum/Vinyl"  ),
      selectInput('newStory','House Story Type',choices=
                     list("1 Story"="1 Story",
                          "1.5 & 1 Story"="1.5 & 1 Story",
                          "1.5 Finished"="1.5 Finished",
                          "1.5 Unfinished"="1.5 Unfinished",
                          "2 & 1 Story"="2 & 1 Story",
                          "2 & 1.5 Story"="2 & 1.5 Story",
                          "2 Story"="2 Story",
                          "Dr/Bi-Level"="Dr/Bi-Level",
                          "L Bi-Level"="L Bi-Level",
                          "Quad-Level"="Quad-Level",
                          "St Bi-Level"="St Bi-Level",
                          "Tri-Level"="Tri-Level"
                        ),selected="1 Story"),
     
      selectInput('newBsmt','Basement Type',choices=
                     list('Finished'=1,
                          'Unfinised'=0                        
                        ),selected=1)
      
   ),
   mainPanel(
      tabsetPanel(
      tabPanel("Main Plot",plotOutput(outputId = "plot1",  width = "100%")),
#       ,verbatimTextOutput('regress')
       tabPanel("Regression",
                h5("Average House Value Based on Regression Analysis"),
                verbatimTextOutput('newHouse'),
                h5("The house value could be lower or higher based on criteria
                    not in this regression analysis. So, there is a 95% chance 
                   that the value of a house with the criteria specified has a 
                   minimum value of: "),
                verbatimTextOutput('newHouseMin'),
                h5("and a maximum value of :"),
                verbatimTextOutput('newHouseMax'),
                h5("Below is a table of actual house sales from the data set that 
                  have been filtered based on the Neighborhood, House Exterior, 
                   Finished Basement, and Story type.  It shows all sales and
                   square footage for those filters.  It also adds a rew marked as
                   'Regression Output' that reflects the information that came
                   out of the regression analysis based on the inputs. If no table 
                   appears below, then there are not any actual values in the 
                   data set based on your Regression Input Paramaters"),
                verbatimTextOutput('houseRP'),
                h5("Below is a plot that shows the actual values that match the 
                   Regression Input parameters for all square footage, and shows
                   where the predicted output lies based on the Regression Input 
                   parameters."),
                plotOutput(outputId = "plotR",  width = "100%")
                ),
      tabPanel("Neighborhood Map",
               img(src="NH.jpg")),
      tabPanel("Coefficients",
                h5("Table of Coefficients from the regression analysis"),
                verbatimTextOutput('coef')),
      tabPanel("Documentation",
               h5("The data for the information presented was taken from copying 
                  the results from searches on the Bloomington Tax Assessor's website, 
www.wevaluebloomington.org. The data was filtered for sales bewtween 2009-YTD 2015."),
               h4("Main Plot"),
               h5("The first widets on the panel to the left are for the 'Main Plot' 
                  tab. The slider bars and check boxes are for alering the plots 
                  on the graph"),
               h4("Neiborhood"),
               h5("Use the double ended slider to pick the range of neighborhoods 
                  to include in the graph.  You can move the sliders so that only 
                  one or two neighborhoods are shown."),
               h4("Total Square Feet"),
               h5("This is another double ended slider to select the minimum and 
                  maximum square footage to be seen in the graph."),
               h4("House Type"),
               h5("This is a series of check boxes to slect which type of house 
                  design to be included. The shape inside each point on the graph 
                  can be used to show the house type."),
               h4("House Exterior"),
               h5("This series of checkboxes are to filter which type of siding/
                  exterior to include for the type of house.  THe shape inside each 
                  point on the graph can be used to show the House Exterior."),
               h4("Basement"),
               h5("These check boxes are to include finished, unfinished, or both
                   types of basements"),
               h4("Shape in the plot"),
               h5("The graph defaults to using the shape to show the house type 
                  in the plot area. However, if you want to see the shape represented
                   as the House Exterior, you can change that in this drop down"),
               h4("Regression Input"),
               h5("The next series of widgets in the left panel are to control the 
                  inputs for the 'Regression' tab. The inputs you select go into 
                  a linear regression model that will predict the house price based 
                  on the criteria you select. The Regression tab will display the 
                  predicted house price with a minimum and maximum value within a
                   95% confidence interval.  If the confidence interval is really 
                  wide, it is because there may not be many houses for the neighborhood
                   selected to provide enough accuraccey.  There will also be a table 
                  shown on the Regression tab that shows all the houses for all 
                  square footage amounts that meet the criterial you selected. They 
                  will also be shown on a graph that will show you houses that 
                  match the criteria based on the Regression inputs along with
                  the predicted value from the regression"),
               h4("Neighborhood"),
               h5("For this widget select a single neighborhood to be used in the
                   regression analysis"),
               h4("Total Square Feet"),
               h5("This is a single end slider to pick the square feet. It provides 
                  a single number of square feet into the model"),
               h4("House Exterior"),
               h5("Select a single exterior type for the regression model"),
               h4("House Story Type"),
               h5("Select a single House type for the regression model"),
               h4("Basement Type"),
               h5("Select if you want a finished or unfinished basement in the 
                  regression model"),
               h4("Neighborhood Map Tab"),
               h5("This tab displays the map of Bloomington and which neighborhood 
                  map refers to which geographical location"),
               h4("Coefficients Tab"),
               h5("This tab has an output of the coefficeints from the regression 
                  model.  The first coeficients refer to the Story type of the house,
                  The 1 story house is not displayed. That is because it is the 
                  default. That means everything is compared to the 1 story. So, 
                  if you have two houses with everything equal, the only difference 
                  is one is a 1 story and the other is a 1.5 & 1 story, the latter is 
                  $8,823 less. The TotalSF coefficient is the $/square foot for the 
                  house. The Exterior Coefficient is like the story type. Aluminium/
                  Vinyl is no shown because it is the default. Everthing is in 
                  comparison to Aluminum/Vinyl. So, two houses being equal and the 
                  only differnces is one has Vinyl siding and the other has Asphalt 
                  Shingle siding, the one with Asphalt will sell for $4,047 less. 
                  The FinBsmt coefficient lets you know that even if the square feet 
                  are equal between the two houses, having a finished basement, adds 
                  14,629 onto the sale price. The X# coefficients represent the 
                  neighborhood. The number for the coefficient is the $/square foot 
                  to add or subtract on the TotalSF coefficient. So, nomrally, the 
                  sale price will be based on $44/square foot, but if you are selling 
                  in neighborhood 0, you add $4/squre foot onto the sale price, if 
                  you are selling in neighborhood 4, you take off $9/square foot 
                  from the $44/squre foot for the sale price.")
               )
      
   ))
))

