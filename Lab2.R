#read data from college.csv
college <- read.csv("college.csv")

#summary()
summary(college)

#pair()
pairs(~Apps+Accept+Enroll+Grad.Rate, data=college)

#pair() with different colors group by public or non-public
myCol <- c("#1086EE", "#28F4F4")
pairs(~Apps+Accept+Enroll+Grad.Rate, data=college, col=myCol[college$Private])

#boxplot()
boxplot(Apps~Private, data=college, xlab="Private or not", ylab="Applications", main="Relations between Apps and Private")

#scatterplot
#set colours
scatterCol <- rep("cadetblue1", length(college$Top10perc))
scatterCol[college$Top10perc <= 70] <- "chartreuse1"
scatterCol[college$Top10perc <= 50] <- "burlywood1"
scatterCol[college$Top10perc <= 30] <- "beige"

#plot()
plot(Top10perc~rownames(college), data=college, col=scatterCol)

#sort the values in ascending order
collegeSort <- college[order(college$Top10perc),]
plot(Top10perc~rownames(college), data=collegeSort, col=scatterCol, xlab="No.")

#generate a histogram of Top10perc
hist(college$Top10perc, breaks=100, col=scatterCol, xlab="from high school ranked top 10%", main="Histogram of Top 10%")

#divide the plotting window into multiple regions for plotting multiple plot
par(mfrow=c(1,2))
plot(Top10perc~rownames(collegeSort), data=collegeSort, col=scatterCol)
hist(college$Top10perc, breaks=100, col=scatterCol, xlab="from high school ranked top 10%", main="Histogram of Top 10%")

#increase the regions to allow 4 diagrams
par(mfrow=c(2,2))
plot(Top10perc~rownames(college), data=college, col=scatterCol, xlab="No.", main="Distribution")
plot(Top10perc~rownames(college), data=collegeSort, col=scatterCol, xlab="No.", main="Distribution Sorted")
hist(college$Top10perc, breaks=100, col=scatterCol, xlab="from high school ranked top 10%", main="Histogram of Top 10%")
hist(college$Top25perc, breaks=100, col=scatterCol, xlab="from high school ranked top 25%", main="Histogram of Top 25%")

#other plot method
dotchart(college$Top10perc, col=scatterCol)

#install.packages("Rcmdr")
library(Rcmdr)
scatter3d(college$Apps, college$Accept, college$Enroll, xlab="Apps", ylab="Accept", zlab="Enroll")
