#use the read.csv() functioin to read the data
college <- read.csv("college.csv", header=TRUE)

#use the head() function to read the first 3 rows of college dataframe
head(college, n=3)

#try rownames()
rownames(college)

#getting a vector of the university names
uname <- college$X

#set the row names to its corresponding university names
row.names(college) <- uname
college$X <- NULL

#total number of application received
sum(college$Apps)

#the average number of applications received by a university
mean(college$Apps)

#the list of universities which recevies more than 5000 applications
unameAboveFiveThousand <- college[which(college$Apps > 5000),]
rownames(unameAboveFiveThousand)

#the average graduation rate for universities that recevied more than 5000 applications
avgGradRateAbove <- mean(unameAboveFiveThousand$Grad.Rate)

#compared the Grad.rate
unameBelowFiveThousand <- college[which(college$Apps <= 5000),]
avgGradRateBelow <- mean(unameBelowFiveThousand$Grad.Rate)
print(avgGradRateAbove > avgGradRateBelow)

#highest/lowest number of full time undergrads
highestUndergrads <- rownames(college[which(college$F.Undergrad == max(college$F.Undergrad)),])
lowestUndergrads <- rownames(college[which(college$F.Undergrad == min(college$F.Undergrad)),])
sprintf("The highest number of full time undergrads university: %s", highestUndergrads)
sprintf("The lowest number of full time undergrads university: %s", lowestUndergrads)

library(Rcmdr)
scatter3d(college$Apps, college$Accept, college$Enroll, xlab="Apps", ylab="Accept", zlab="Enroll")

