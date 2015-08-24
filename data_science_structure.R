##ʱ�䣺2015-08-24
##���ܣ��Ƚϸ���Ŀǰ���ܽṹ��Ϊ�Ľ�����
 rm(list=ls()) 
 library(ggplot2) 
 library(grid)
#����
 field <- c("���ݿ��ӻ�","����ѧϰ","��ѧ","ͳ��ѧ","�������ѧ","��ͨ���ݽ�","����֪ʶ") 
 score <- c(2.5,3,3.5,4.5,4,3,2) 
 Mscore <- c(2,1.5,2.5,3,3.2,2.5,0.5)
 structure <-  data.frame(field,score) 
 Mstructure <- data.frame(field,Mscore) 

 ##���ݿ�ѧ��֪ʶ�ṹ
p <- ggplot(structure,aes(x=field,y=score))+geom_bar(stat="identity",fill="blue") 
#�޸��б������������Ŀ˳��
p <- p+scale_x_discrete(limits=field,labels=c("����\n���ӻ�","����ѧϰ","��ѧ","ͳ��ѧ","�����\n��ѧ","��ͨ\n���ݽ�","����֪ʶ"))
#����ֱ��
#p <- p+geom_hline(yintercept=2.5,colour="red")+scale_y_continuous(breaks=c(0,1,2,3,4,5),limits=c(0,5),labels=c("����","�˽�","����","����","׿Խ","����"))
p <- p+geom_hline(yintercept=2.5,colour="red")+scale_y_continuous(limits=c(0,5))
#�����������ǩ#���ñ���
p <- p+labs(x="֪ʶ����",y="���ܺ�֪ʶˮƽ",title="���ݿ�ѧ�Ҽ���֪ʶ�ṹ\n")
#�齨���ݷ����Ŷӣ�������Ҫ����������Լ���Ա�ļ��ܹ���

##����Ŀǰ֪ʶ�ṹ
M<- ggplot(Mstructure,aes(x=field,y=Mscore))+geom_bar(stat="identity",fill="blue") 
#�޸��б������������Ŀ˳��
M <- M+scale_x_discrete(limits=field,labels=c("����\n���ӻ�","����ѧϰ","��ѧ","ͳ��ѧ","�����\n��ѧ","��ͨ\n���ݽ�","����֪ʶ"))
#����ֱ��
M <- M+geom_hline(yintercept=2.5,colour="red")+scale_y_continuous(limits=c(0,5))
#�����������ǩ#���ñ���#����ʱ��ע��
M <- M+labs(x="֪ʶ����",y="���ܺ�֪ʶˮƽ",title="���˼���֪ʶ�ṹ\n")+annotate("text",x=6.5,y=5,label="2015-08-24")

##������ͼ����һ��ҳ����
#����grid��
#library(grid)
##�����ǰ�豸���ƶ����µ�page
grid.newpage()
##��viewport������ͼ���ڣ�����grid.layout�������֣�ͬʱ�Ѳ��ָ��Ӵ�
VP <- viewport(layout = grid.layout(1, 2))
##��pushViewport()����������ͼ�㣬ʹ֮��ΪĿ������
pushViewport(VP)
#�������ֺ���,���������Ƿ���ͼ�ε�λ��
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
#��ͼ
print(p, vp = vplayout(1, 1))
print(M, vp = vplayout(1, 2))