# Problem 1

df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'), 
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
        'Alaska','Texas','North Carolina','Alaska','California','Texas'), 
          Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))

aggregate(df1$Sales, by=list(df1$State), FUN=sum)

install.packages("dplyr")
library(dplyr)

df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))


# Problem 2
#  a

df2 <- read.csv("WorldCupMatches.csv")
dim(df2)

#  b
summary(df2)

#  c
length(unique(df2$City))

#  d
mean(df2$Attendance, na.rm = TRUE)

#  e
df2 %>% group_by(Home.Team.Name) %>% summarise(sum_goals = sum(Home.Team.Goals))

#  f
aggregate(df2$Attendance, by=list(df2$Year), FUN=mean, na.rm = T)

# Problem 3
#  a
install.packages("dplyr")
library(dplyr)

df3 <- read.csv("metabolite.csv")

df3 %>% group_by(Label) %>% summarise(count = length(Label))

#  b)
col_NA <- rep(NA, times = ncol(df3))

for(j in 1:ncol(df3)) {
  col_NA[j] <- sum(is.na(df3[ ,j]))
}
col_NA
sum(col_NA)

#  c
df3.1 <- df3[is.na(df3['Dopamine'])==F, ]
head(df3.1$Dopamine, 10)

#  d
df3.1[['c4.OH.Pro']][is.na(df3.1[['c4.OH.Pro']])] <- median(df3.1$c4.OH.Pro, na.rm = T)
head(df3.1$c4.OH.Pro, 10)