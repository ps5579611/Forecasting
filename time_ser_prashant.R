df <- read.csv("TV_by_network_daypart.csv")
str(births)

getwd()
df1 <- as.data.frame(unique(df$daypart))
df1[1:4,] 
df2 <- as.data.frame(unique(df$network))

births$date

str(births$date)
birthstimeseries <- ts(births)

birthstimeseries

library(dplyr)
im <- function(df,i,j){
  daypart1 <- df %>% filter(daypart == i&network==j)
  #test1 <- daypart1 %>% filter(date >201612)
  #return(test1)
  train1 <-  daypart1 %>% filter(date <201701 )
  return(train1)
}

im2 <- function(df,i,j){
  daypart1 <- df %>% filter(daypart == i&network==j)
  test1 <- daypart1 %>% filter(date >201612)
  return(test1)
  #  train1 <-  daypart1 %>% filter(date <201701 )
  #  return(train1)
}

library(forecast)

a <- list()

for(i in 9:10){
  nam <- paste("trainA", i, sep = ".")
  x <- assign(nam, im(df,df1[i,],"A"))
  nam1 <- paste("testA", i, sep = ".")
  y <- assign(nam1, im2(df,df1[i,],"A"))
  tr <- ts(x$viewers, frequency=12,start = 2014)
  plot.ts(tr)
  tr_stl <- stl(tr, s.window="period")
  tr_dec <- decompose(tr,type = "additive")
  plot(tr_dec$seasonal)
  tr_dec_mul <- decompose(tr,type = "mult")
  plot(tr_dec_mul$seasonal)
  plot(tr_dec$trend)
  acf(tr)
  pacf(tr)
  
  tr_hlt <- HoltWinters(tr)
  #  library(forecast)
  tr_fr<- forecast(tr_hlt, h=12)
  plot(tr_fr)
  #tr_fr
  nam2 <- paste("MAEA", i, sep = ".")
  a[[i]] <- assign(nam2, mean(abs(tr_fr$mean-y$viewers)))
}
tr_fr$mean
b1 <- as.data.frame(a)
b2 <-t(b1)
as.numeric(t(b1))
d1 <- data.frame(b2,df1,"A")
rownames(d1) <- 1:nrow(d1)
colnames(d1) <- c("MSE","daypart","Network")
d1


b <-list()
for(i in 1:11){
  nam <- paste("trainB", i, sep = ".")
  x <- assign(nam, im(df,df1[i,],"B"))
  nam1 <- paste("testB", i, sep = ".")
  y <- assign(nam1, im2(df,df1[i,],"B"))
  tr <- ts(x$viewers, start=c(2014),  frequency=12)
  plot.ts(tr)
  tr_stl <- stl(tr, s.window="period")
  tr_dec <- decompose(tr,type = "additive")
  #plot(tr_dec$seasonal)
  tr_dec_mul <- decompose(tr,type = "mult")
  # plot(tr_dec_mul$seasonal)
  #  plot(tr_dec$trend)
  # acf(tr)
  # pacf(tr)
  
  tr_hlt <- HoltWinters(tr, beta=FALSE, gamma=FALSE)
  #  library(forecast)
  tr_fr<- forecast(tr_hlt, h=12)
  plot(tr_fr)
  #tr_fr
  nam2 <- paste("MAEB", i, sep = ".")
  b[[i]] <- assign(nam2, mean(abs(tr_fr$mean-y$viewers)))
}

b1 <- as.data.frame(b)
b2 <-t(b1)
as.numeric(t(b1))
d1 <- data.frame(b2,df1,"B")
rownames(d1) <- 1:nrow(d1)
colnames(d1) <- c("MSE","daypart","Network")
d1


c <- list()
for(i in 1:11){
  nam <- paste("trainC", i, sep = ".")
  x <- assign(nam, im(df,df1[i,],"C"))
  nam1 <- paste("testC", i, sep = ".")
  y <- assign(nam1, im2(df,df1[i,],"C"))
  tr <- ts(x$viewers, start=c(2014),  frequency=12)
  plot.ts(tr)
  tr_stl <- stl(tr, s.window="period")
  tr_dec <- decompose(tr,type = "additive")
  plot(tr_dec$seasonal)
  tr_dec_mul <- decompose(tr,type = "mult")
  plot(tr_dec_mul$seasonal)
  plot(tr_dec$trend)
  acf(tr)
  pacf(tr)
  
  tr_hlt <- HoltWinters(tr, beta=FALSE, gamma=FALSE)
  #  library(forecast)
  tr_fr<- forecast(tr_hlt, h=12)
  plot(tr_fr)
  #tr_fr
  nam2 <- paste("MAEC", i, sep = ".")
  c[[i]] <- assign(nam2, mean(abs(tr_fr$mean-y$viewers)))
}

b1 <- as.data.frame(c)
b2 <-t(b1)
as.numeric(t(b1))
d1 <- data.frame(b2,df1,"C")
rownames(d1) <- 1:nrow(d1)
colnames(d1) <- c("MSE","daypart","Network")
d1




d <- list()
for(i in 1:11){
  nam <- paste("trainD", i, sep = ".")
  x <- assign(nam, im(df,df1[i,],"D"))
  nam1 <- paste("testD", i, sep = ".")
  y <- assign(nam1, im2(df,df1[i,],"D"))
  tr <- ts(x$viewers, start=c(2014),  frequency=12)
  plot.ts(tr)
  tr_stl <- stl(tr, s.window="period")
  tr_dec <- decompose(tr,type = "additive")
  plot(tr_dec$seasonal)
  tr_dec_mul <- decompose(tr,type = "mult")
  plot(tr_dec_mul$seasonal)
  plot(tr_dec$trend)
  acf(tr)
  pacf(tr)
  
  tr_hlt <- HoltWinters(tr, beta=FALSE, gamma=FALSE)
  #  library(forecast)
  tr_fr<- forecast(tr_hlt, h=12)
  plot(tr_fr)
  #tr_fr
  nam2 <- paste("MAED", i, sep = ".")
  d[[i]] <- assign(nam2, mean(abs(tr_fr$mean-y$viewers)))
}

b1 <- as.data.frame(d)
b2 <-t(b1)
as.numeric(t(b1))
d1 <- data.frame(b2,df1,"D")
rownames(d1) <- 1:nrow(d1)
colnames(d1) <- c("MSE","daypart","Network")

d1


e <- list()
for(i in 1:11){
  nam <- paste("trainE", i, sep = ".")
  x <- assign(nam, im(df,df1[i,],"E"))
  nam1 <- paste("testE", i, sep = ".")
  y <- assign(nam1, im2(df,df1[i,],"E"))
  tr <- ts(x$viewers, start=c(2014),  frequency=12)
  plot.ts(tr)
  tr_stl <- stl(tr, s.window="period")
  tr_dec <- decompose(tr,type = "additive")
  #  plot(tr_dec$seasonal)
  tr_dec_mul <- decompose(tr,type = "mult")
  # plot(tr_dec_mul$seasonal)
  #  plot(tr_dec$trend)
  # acf(tr)
  # pacf(tr)
  
  tr_hlt <- HoltWinters(tr)
  #  library(forecast)
  tr_fr<- forecast(tr_hlt, h=12)
  plot(tr_fr)
  #tr_fr
  
  nam2 <- paste("MAEE", i, sep = ".")
  e[[i]] <- assign(nam2, mean(abs(tr_fr$mean-y$viewers)))
  #  b1 <- as.data.frame(c[[i]])
}

b1 <- as.data.frame(e)
b2 <-t(b1)
as.numeric(t(b1))
d1 <- data.frame(b2,df1,"E")
rownames(d1) <- 1:nrow(d1)
colnames(d1) <- c("MSE","daypart","Network")

d1
