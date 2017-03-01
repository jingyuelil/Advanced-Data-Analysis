#Q1
#(b)
data = read.table("/Users/lleiou/Google Drive/😳 Courses/4th term/Advanced-Data-Analysis/HW/Question/HW4/DATACIGARETTE.txt", header = TRUE)
mat.data <- data.matrix(data[,2:8])
mat.data
cor((mat.data))
#scatter plot matrix:
pairs(data[,2:8])

#(c)
results = lm(Sales ~ Age+HS+Income+Black+Female+Price , data=data)
# install.packages('car')
results
library(car)
vif(results)

#(d)
r = rstudent(results)
data[abs(r)>3,]

#(e)
lev = hat(model.matrix(results))
lev
# length(lev)
# 51
data[lev>12/51]
data[which(lev>12/51),1]

#(f)
cook = cooks.distance(results)
cook

#(g)
#(gd)
results = lm(ln(Sales) ~ Age+HS+Income+Black+Female+Price , data=data)
results
r = rstudent(results)
data[abs(r)>3,]


#(ge)
lev = hat(model.matrix(results))
lev
# length(lev)
# 51
data[which(lev>12/51),1]

#(gf)
cook = cooks.distance(results)
cook

# just wonder why the results doesn't change anything after taking the log(Sales)

data[ ,'Sales']
log(data[,'Sales'])









y = data[,2]
x = data[,1]
lm(y~x)
summary(lm(y~x))
confint(lm(y~x))
confint(lm(y~x),x=6)

predict(lm(y~x),newdata=data.frame(x=6),interval="confidence")
predict(lm(y~x),newdata=data.frame(x=6),interval="prediction")

predict(lm(y~x),newdata=data.frame(x=6),interval="confidence",level=1-0.05/2)


predict(lm(y~x),newdata=data.frame(x=7),interval="confidence",level=1-0.05/2)


reduced = lm(y~x)
full = lm(y~factor(x))
anova(reduced,full)



cook = cooks.distance(results)
data[cook>1,]
cook


#Q3
data = read.csv("/Users/lleiou/Google Drive/😳 Courses/4th term/Advanced-Data-Analysis/HW/Answer/HW3/mileage.csv")
data
y = data[,1]
x1 = data[,2]
x2 = data[,3]
full = lm(y~factor(x1)+x2)

summary(lm(y~factor(x1)+x2))
reduced = lm(y~x2)

anova(reduced,full)



###############################################
#this is just a replica of the example in class
x=c(127,115,127,150,156,182,156,132,137,113,137,117,137,153,117,126,170,182,162,184,143,159,108,175,108,179,111,187,111,115,194,168)
y = c(13,12,7,9,6,11,12,10,9,9,15,11,8,6,13,10,14,8,11,10,6,9,14,8,6,9,15,8,7,7,5,7)
z = c(1235,1080,845,1522,1047,1979,1822,1253,1297,946,1713,1024,1147,1092,1152,1336,2131,1550,1884,2041,854,1483,1055,1545,729,1792,1175,1593,785,744,1356,1262)

summary(lm(z~y+x))



#the following is just a test whether I can plot in atom. (and it proves to be okay)
data <- read.csv("/Users/lleiou/Google Drive/😳 Courses/4th term/Advanced-Data-Analysis/HW/Answer/HW2/HW2DATA.csv")
fertilizer <- c(rep("A",12),rep("B",12))
wheat <- data[,2]
response <- data[,3]
interaction.plot(fertilizer,wheat,response)
