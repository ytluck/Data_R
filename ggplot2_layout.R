ls()
rm(list=ls())
library(ggplot2)
library(gcookbook)
cabbage_exp
#�������񷽷�
###��һ������ͼ�θ�������
a <- ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(position="dodge",stat="identity")
b <- ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat="identity")
library(plyr)
c <- ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar,order=desc(Cultivar)))+geom_bar(stat="identity")
#����grid��
library(grid)
##�����ǰ�豸���ƶ����µ�page
grid.newpage()
##��viewport������ͼ���ڣ�����grid.layout�������֣�ͬʱ�Ѳ��ָ��Ӵ�
VP <- viewport(layout = grid.layout(2, 2))
##��pushViewport()����������ͼ�㣬ʹ֮��ΪĿ������
pushViewport(VP)
#�������ֺ���,���������Ƿ���ͼ�ε�λ��
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
#��ͼ
print(a, vp = vplayout(1, 1:2))
print(b, vp = vplayout(2, 1))
print(c, vp = vplayout(2, 2))
