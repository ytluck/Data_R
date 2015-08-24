 ##时间：2015-08-24
 ##功能：比较个人目前技能结构作为改进方向
 rm(list=ls()) 
 library(ggplot2) 
 library(grid)
#数据
 field <- c("数据可视化","机器学习","数学","统计学","计算机科学","沟通与演讲","领域知识") 
 score <- c(2.5,3,3.5,4.5,4,3,2) 
 Mscore <- c(2,1.5,2.5,3,3.2,2.5,0.5)
 structure <-  data.frame(field,score) 
 Mstructure <- data.frame(field,Mscore) 

 ##数据科学家知识结构
p <- ggplot(structure,aes(x=field,y=score))+geom_bar(stat="identity",fill="blue") 
#修改列别在坐标轴的项目顺序
p <- p+scale_x_discrete(limits=field,labels=c("数据\n可视化","机器学习","数学","统计学","计算机\n科学","沟通\n与演讲","领域知识"))
#添加直线
#p <- p+geom_hline(yintercept=2.5,colour="red")+scale_y_continuous(breaks=c(0,1,2,3,4,5),limits=c(0,5),labels=c("空无","了解","熟练","优秀","卓越","顶尖"))
p <- p+geom_hline(yintercept=2.5,colour="red")+scale_y_continuous(limits=c(0,5))
#设置坐标轴标签#设置标题
p <- p+labs(x="知识领域",y="技能和知识水平",title="数据科学家技能知识结构\n")
#组建数据分析团队，考虑所要解决的问题以及成员的技能构成

##个人目前知识结构
M<- ggplot(Mstructure,aes(x=field,y=Mscore))+geom_bar(stat="identity",fill="blue") 
#修改列别在坐标轴的项目顺序
M <- M+scale_x_discrete(limits=field,labels=c("数据\n可视化","机器学习","数学","统计学","计算机\n科学","沟通\n与演讲","领域知识"))
#添加直线
M <- M+geom_hline(yintercept=2.5,colour="red")+scale_y_continuous(limits=c(0,5))
#设置坐标轴标签#设置标题#添加时间注解
M <- M+labs(x="知识领域",y="技能和知识水平",title="个人技能知识结构\n")+annotate("text",x=6.5,y=5,label="2015-08-24")

##把两幅图放在一个页面上
#加载grid包
#library(grid)
##清除当前设备或移动到新的page
grid.newpage()
##用viewport创建视图窗口，并用grid.layout创建布局，同时把布局给视窗
VP <- viewport(layout = grid.layout(1, 2))
##用pushViewport()命令锁定该图层，使之成为目标区域
pushViewport(VP)
#创建布局函数,函数参数是放置图形的位置
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
#绘图
print(p, vp = vplayout(1, 1))
print(M, vp = vplayout(1, 2))
