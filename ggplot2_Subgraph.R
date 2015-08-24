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
#��ͼ���ڷ���
#����grid��
library(grid)
#������ͼ
b <- b+theme(legend.position=c("right"))
b 
#������ͼ����,x,y,width,heith������ͼ�Ĵ�С��λ��viewport()
subvp <- viewport(width=0.3,height=0.25,x=0.7,y=0.85)
#������ͼ����������ͼ
a <- a+theme_gray(9)+labs(x=NULL,y=NULL)+theme(plot.margin=unit(rep(0,4),"lines"))
a <- a+guides(fill=FALSE)
print(a,vp=subvp)

###################