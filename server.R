library(ggplot2)
library(scales)
data<-read.csv("HouseValues.csv")
house<-data[,c("SaleDate","SalePrice","Story","TotalSF",
               "NH","ExtWalls","FinAttic","FinBsmt")]
story<-sort(unique(house$Story))
exterior<-sort(unique(house$ExtWalls))
NH<-sort(unique(house$NH))
SFmin<-0
SFmax<-1000000
FinAttic<-c(0,1)
FinBsmt<-c(0,1)

house_regress<-read.csv("HouseValuesRegression.csv")
houseR<-house_regress[,-c(1,2,6,8)]
houseFit<-lm(SalePrice~.,data=houseR)


shinyServer(
   function(input, output) {
      housefun<-reactive({
         house1<-house[house$NH>=min(input$nh) & house$NH<=max(input$nh),]
         house2<-house1[house1$Story %in% input$stry,]
         house3<-house2[house2$TotalSF>=min(input$sf) & house$TotalSF<=max(input$sf),]
         house4<-house3[house3$ExtWalls %in% input$extwall,]
         house5<-house4[house4$FinBsmt %in% input$bsmnt,]
         house5
      })
##############

newHouse<-reactive({data.frame(
   Story=input$newStory,
   TotalSF=as.integer(input$newSF),
   ExtWalls=input$newExt,
   FinBsmt=as.numeric(input$newBsmt),
   X0=as.integer(if(input$newNH==0){input$newSF}else{0}),
   X1=as.integer(if(input$newNH==1){input$newSF}else{0}),
   X2=as.integer(if(input$newNH==2){input$newSF}else{0}),
   X3=as.integer(if(input$newNH==3){input$newSF}else{0}),
   X4=as.integer(if(input$newNH==4){input$newSF}else{0}),
   X5=as.integer(if(input$newNH==5){input$newSF}else{0}),
   X6=as.integer(if(input$newNH==6){input$newSF}else{0}),
   X7=as.integer(if(input$newNH==7){input$newSF}else{0}),
   X8=as.integer(if(input$newNH==8){input$newSF}else{0}),
   X9=as.integer(if(input$newNH==9){input$newSF}else{0}),
   X10=as.integer(if(input$newNH==10){input$newSF}else{0}),
   X11=as.integer(if(input$newNH==11){input$newSF}else{0}),
   X12=as.integer(if(input$newNH==12){input$newSF}else{0}),
   X13=as.integer(if(input$newNH==13){input$newSF}else{0}),
   X14=as.integer(if(input$newNH==14){input$newSF}else{0}),
   X15=as.integer(if(input$newNH==15){input$newSF}else{0}),
   X16=as.integer(if(input$newNH==16){input$newSF}else{0}),
   X17=as.integer(if(input$newNH==17){input$newSF}else{0}),
   X18=as.integer(if(input$newNH==18){input$newSF}else{0}),
   X19=as.integer(if(input$newNH==19){input$newSF}else{0}),
   X20=as.integer(if(input$newNH==20){input$newSF}else{0}),
   X21=as.integer(if(input$newNH==21){input$newSF}else{0}),
   X22=as.integer(if(input$newNH==22){input$newSF}else{0}),
   X23=as.integer(if(input$newNH==23){input$newSF}else{0}),
   X25=as.integer(if(input$newNH==25){input$newSF}else{0}),
   X26=as.integer(if(input$newNH==26){input$newSF}else{0}),
   X28=as.integer(if(input$newNH==28){input$newSF}else{0}),
   X29=as.integer(if(input$newNH==29){input$newSF}else{0}),
   X30=as.integer(if(input$newNH==30){input$newSF}else{0}),
   X31=as.integer(if(input$newNH==31){input$newSF}else{0}),
   X32=as.integer(if(input$newNH==32){input$newSF}else{0}),
   X33=as.integer(if(input$newNH==33){input$newSF}else{0}),
   X34=as.integer(if(input$newNH==34){input$newSF}else{0}),
   X35=as.integer(if(input$newNH==35){input$newSF}else{0}),
   X36=as.integer(if(input$newNH==36){input$newSF}else{0}),
   X37=as.integer(if(input$newNH==37){input$newSF}else{0}),
   X38=as.integer(if(input$newNH==38){input$newSF}else{0}),
   X39=as.integer(if(input$newNH==39){input$newSF}else{0}),
   X40=as.integer(if(input$newNH==40){input$newSF}else{0}),
   X41=as.integer(if(input$newNH==41){input$newSF}else{0}),
   X42=as.integer(if(input$newNH==42){input$newSF}else{0}),
   X43=as.integer(if(input$newNH==43){input$newSF}else{0}),
   X44=as.integer(if(input$newNH==44){input$newSF}else{0}),
   X45=as.integer(if(input$newNH==45){input$newSF}else{0}),
   X46=as.integer(if(input$newNH==46){input$newSF}else{0}),
   X47=as.integer(if(input$newNH==47){input$newSF}else{0}),
   X48=as.integer(if(input$newNH==48){input$newSF}else{0}),
   X49=as.integer(if(input$newNH==49){input$newSF}else{0}),
   X50=as.integer(if(input$newNH==50){input$newSF}else{0}),
   X51=as.integer(if(input$newNH==51){input$newSF}else{0}),
   X52=as.integer(if(input$newNH==52){input$newSF}else{0}),
   X53=as.integer(if(input$newNH==53){input$newSF}else{0}),
   X54=as.integer(if(input$newNH==54){input$newSF}else{0}),
   X55=as.integer(if(input$newNH==55){input$newSF}else{0}),
   X56=as.integer(if(input$newNH==56){input$newSF}else{0}),
   X57=as.integer(if(input$newNH==57){input$newSF}else{0}),
   X58=as.integer(if(input$newNH==58){input$newSF}else{0}),
   X60=as.integer(if(input$newNH==60){input$newSF}else{0}),
   X61=as.integer(if(input$newNH==61){input$newSF}else{0}),
   X62=as.integer(if(input$newNH==62){input$newSF}else{0}),
   X64=as.integer(if(input$newNH==64){input$newSF}else{0}),
   X65=as.integer(if(input$newNH==65){input$newSF}else{0}),
   X66=as.integer(if(input$newNH==66){input$newSF}else{0}),
   X68=as.integer(if(input$newNH==68){input$newSF}else{0}),
   X69=as.integer(if(input$newNH==69){input$newSF}else{0}),
   X70=as.integer(if(input$newNH==70){input$newSF}else{0}),
   X71=as.integer(if(input$newNH==71){input$newSF}else{0}),
   X73=as.integer(if(input$newNH==73){input$newSF}else{0}),
   X74=as.integer(if(input$newNH==74){input$newSF}else{0}),
   X75=as.integer(if(input$newNH==75){input$newSF}else{0}),
   X76=as.integer(if(input$newNH==76){input$newSF}else{0}),
   X78=as.integer(if(input$newNH==78){input$newSF}else{0}),
   X79=as.integer(if(input$newNH==79){input$newSF}else{0}),
   X80=as.integer(if(input$newNH==80){input$newSF}else{0}),
   X81=as.integer(if(input$newNH==81){input$newSF}else{0}),
   X82=as.integer(if(input$newNH==82){input$newSF}else{0}),
   X83=as.integer(if(input$newNH==83){input$newSF}else{0}),
   X84=as.integer(if(input$newNH==84){input$newSF}else{0}),
   X85=as.integer(if(input$newNH==85){input$newSF}else{0}),
   X86=as.integer(if(input$newNH==86){input$newSF}else{0}),
   X88=as.integer(if(input$newNH==88){input$newSF}else{0}),
   X89=as.integer(if(input$newNH==89){input$newSF}else{0}),
   X90=as.integer(if(input$newNH==90){input$newSF}else{0}),
   X91=as.integer(if(input$newNH==91){input$newSF}else{0}),
   X93=as.integer(if(input$newNH==93){input$newSF}else{0}),
   X95=as.integer(if(input$newNH==95){input$newSF}else{0}),
   X96=as.integer(if(input$newNH==96){input$newSF}else{0}),
   X97=as.integer(if(input$newNH==97){input$newSF}else{0}),
   X98=as.integer(if(input$newNH==98){input$newSF}else{0}),
   X99=as.integer(if(input$newNH==99){input$newSF}else{0}),
   X101=as.integer(if(input$newNH==101){input$newSF}else{0}),
   X102=as.integer(if(input$newNH==102){input$newSF}else{0}),
   X103=as.integer(if(input$newNH==103){input$newSF}else{0}),
   X104=as.integer(if(input$newNH==104){input$newSF}else{0}),
   X105=as.integer(if(input$newNH==105){input$newSF}else{0}),
   X108=as.integer(if(input$newNH==108){input$newSF}else{0}),
   X110=as.integer(if(input$newNH==110){input$newSF}else{0}),
   X111=as.integer(if(input$newNH==111){input$newSF}else{0}),
   X112=as.integer(if(input$newNH==112){input$newSF}else{0})
)})
houseRp<-reactive({
   houseR1<-house[house$NH==input$newNH,]
   houseR2<-houseR1[houseR1$Story==input$newStory,]
   houseR3<-houseR2[houseR2$ExtWalls==input$newExt,]
   houseR4<-houseR3[houseR3$FinBsmt==input$newBsmt,]
   houseR5<-houseR4[,c(2:6,8)]
   houseR5$Source<-"Actual Values"
   saleP<-predict(houseFit,newHouse())[1]
   houseR6<-
                  data.frame(SalePrice=saleP
                   ,Story=input$newStory,
                     TotalSF=input$newSF,NH=input$newNH,ExtWalls=input$newExt,
                     FinBsmt=as.numeric(input$newBsmt)
                   ,Source="Regression Output")
  rbind(houseR5,houseR6)
  
})
##############
      output$plot1<-renderPlot({
         if(input$shape=='Story'){
            p<-ggplot(housefun(),aes(TotalSF,SalePrice))
            p<-p+scale_x_continuous(name="Total Square Feet",labels=comma)+
               scale_y_continuous(name="Last Sale Price",labels=dollar)+
               ggtitle("House Sales")
            p<-p+geom_point(aes(colour=factor(NH),size=factor(FinBsmt)),alpha=0.5)+
               scale_size_discrete(range = c(4,7))
            p<-p+geom_point(aes(shape=factor(Story)))+
               scale_shape_manual(values=1:12)+
               theme(legend.key=element_blank())
            p<-p+guides(colour = guide_legend(nrow = 13,override.aes = list(size=5)))
            p<-p+geom_smooth(method='lm')
            p} else {
               p<-ggplot(housefun(),aes(TotalSF,SalePrice))
               p<-p+scale_x_continuous(name="Total Square Feet",labels=comma)+
                  scale_y_continuous(name="Last Sale Price",labels=dollar)+
                  ggtitle("House Sales")
               p<-p+geom_point(aes(colour=factor(NH),size=factor(FinBsmt)),alpha=0.5)+
                  scale_size_discrete(range = c(4,7))
               p<-p+geom_point(aes(shape=factor(ExtWalls)))+
                  scale_shape_manual(values=1:12)+
                  theme(legend.key=element_blank())
               p<-p+guides(colour = guide_legend(nrow = 13,override.aes = list(size=5)))
               p<-p+geom_smooth(method='lm')
               p
            }}
         ,height = 600, width = 850)


   output$newHouse<-renderPrint(
      formatC(predict(houseFit,newHouse(),interval="predict")[1,1]
              ,format="d",big.mark=','))
   output$newHouseMin<-renderPrint(
      formatC(predict(houseFit,newHouse(),interval="predict")[1,2]
              ,format="d",big.mark=','))
   output$newHouseMax<-renderPrint(
      formatC(predict(houseFit,newHouse(),interval="predict")[1,3]
              ,format="d",big.mark=','))
   output$houseRP<-renderPrint(
      houseRp())
  # output$map<-renderImage("NH.PNG")
   output$coef<-renderPrint(summary(houseFit)$coef)
   output$plotR<-renderPlot({
      r<-ggplot(houseRp(),aes(TotalSF,SalePrice))
      r<-r+scale_x_continuous(name="Total Square Feet",labels=comma)+
         scale_y_continuous(name="Last Sale Price",labels=dollar)+
         ggtitle("House Sales")
#      r<-r+geom_point(size=10)
      r<-r+geom_point(aes(colour=factor(Source)
                          ),size=5#,alpha=0.5
                      )#+
         #scale_size_discrete(range = c(4,7))
#       r<-r+geom_point(aes(shape=factor(ExtWalls)))+
#          scale_shape_manual(values=1:12)+
#          theme(legend.key=element_blank())
      r<-r+guides(colour = guide_legend(nrow = 13,override.aes = list(size=5)
                                      ,size=FALSE  ))
      r<-r+geom_smooth(method='lm')
      r
   })
      
      
   }
)