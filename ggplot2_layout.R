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
#加载grid包
library(grid)
##清除当前设备或移动到新的page
grid.newpage()
##用viewport创建视图窗口，并用grid.layout创建布局，同时把布局给视窗
VP <- viewport(layout = grid.layout(2, 2))
##用pushViewport()命令锁定该图层，使之成为目标区域
pushViewport(VP)
#创建布局函数,函数参数是放置图形的位置
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
#绘图
print(a, vp = vplayout(1, 1:2))
print(b, vp = vplayout(2, 1))
print(c, vp = vplayout(2, 2))

