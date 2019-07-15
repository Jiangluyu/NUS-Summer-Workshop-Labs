#read.csv() from file, convert the missing values to NA
auto <- read.csv("Auto.csv", na.strings=c("?", "NA"))

#ignore the missng values converted to NA
auto <- na.omit(auto)

#perform a simple linear regression using mpg as response and horsepower as predictor
model1 <- lm(mpg~horsepower, data=auto)

#print the results of model1
summary(model1)

#generate the scatter plot
plot(mpg~horsepower, data=auto, col="blue", pch=16)

#display the regression linear on the plot
abline(model1, col="red", lwd=2)

#plot(model)
plot(model1)

#non-linear model
model2 <- lm(mpg~horsepower + I(horsepower^2), data=auto)
xrange <- seq(from=min(auto$horsepower), to=max(auto$horsepower))
lines(xrange, predict(model2, data.frame(horsepower=xrange)), col="red")

#plot(model)
plot(model2)

#print the results of model2
summary(model2)

#exclude name variable to compute correlations
autoWithoutName <- subset(auto, select=-c(name))
cor(autoWithoutName)

#peform a multiple linear regression using mpg as the response
model3 <- lm(mpg~cylinders+displacement+horsepower+weight+acceleration+year+origin, data=auto)

#print the results of model3
summary(model3)

