ls()
rm(list=ls())
library(ggplot2)
library(gcookbook)
cabbage_exp
#矩形网格方法
###第一步：将图形赋给变量
a <- ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(position="dodge",stat="identity")
b <- ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat="identity")
library(plyr)
c <- ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar,order=desc(Cultivar)))+geom_bar(stat="identity")
#视图窗口方法
#加载grid包
library(grid)
#绘制主图
b <- b+theme(legend.position=c("right"))
b 
#创建视图窗口,x,y,width,heith控制视图的大小和位置viewport()
subvp <- viewport(width=0.3,height=0.25,x=0.7,y=0.85)
#调整子图——绘制子图
a <- a+theme_gray(9)+labs(x=NULL,y=NULL)+theme(plot.margin=unit(rep(0,4),"lines"))
a <- a+guides(fill=FALSE)
print(a,vp=subvp)

###################