```{r}
getwd()
list.files()
pf <- read.csv('Documents/pseudo_facebook.tsv',sep='\t')
names(pf)
#install.packages('ggplot2')
library(ggplot2)
qplot( x = dob_day, data = pf)+
  scale_x_discrete(breaks=1:31) +
  facet_wrap(~dob_month, ncol=3)
#facet_grid(horizontal~vertical)
qplot(x= friend_count, data =pf, xlim=c(0,1000))
qplot(x = friend_count, data =subset(pf,!is.na(gender)), binwidth = 25) +
  scale_x_continuous(limits = c(0,1000),breaks = seq(0,1000,50))+
  facet_wrap(~gender,ncol=2)
table(pf$gender)
#median is a better indicator because it marks the halfway point and is resistant to change 
#such as some large figures at the tail dragging the mean up
by(pf$friend_count,pf$gender,summary)
qplot(x=tenure/365, data =pf, binwidth= .25,color =I('black'),fill = I('#F79420')) +
  scale_x_continuous(breaks = seq(1,7,1), lim = c(0,7))
```
summary(pf$friend_count)
summary(log10(pf$friend_count))
qplot(x=sqrt(friend_count),data=pf,binwidth=1,color=I('black'))