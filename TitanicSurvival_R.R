#UNCOMMENT AND RUN THE LINES BELOW IF YOU DON'T HAVE THESE PACKAGES
#install.packages('caret')
#install.packages('rpart')
#install.packages('rpart.plot')
#install.packages('rattle')
#install.packages('RColorBrewer')
#install.packages('e1071')
#install.packages('class')

#Import the necessary libraries
library(caret)
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)
library(e1071)
library(class)


#IMPORT THE NECESSARY DATA
train_data = read.csv("C:/Users/Madan/OneDrive/Desktop/Titanic-Survival-Prediction-Using-R-master/train.csv")
test_data = read.csv("C:/Users/Madan/OneDrive/Desktop/Titanic-Survival-Prediction-Using-R-master/test.csv")
validation_data = read.csv("C:/Users/Madan/OneDrive/Desktop/Titanic-Survival-Prediction-Using-R-master/gender_submission.csv")


print("*****USING DECISION TREES*****")
tc <- trainControl("cv",10)
rpart.grid <- expand.grid(.cp=0.2)

train = train_data
test = test_data

fit <- rpart(Survived ~ Pclass + Sex + SibSp + Parch + Age,
             method="class", data=train)

fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "C:/Users/Madan/OneDrive/Desktop/Titanic-Survival-Prediction-Using-R-master/Results/dtreeResults.csv", row.names = FALSE)

print("CONFUSION MATRIX USING DECISION TREES IS GIVEN BELOW")
results1 <- table(Prediction, validation_data$Survived)

print("ACCURACY USING DECISION TREES IS GIVEN BELOW")
confusionMatrix(results1)


print("USING NAIVE BAYES")

BayesTitanicModel<-naiveBayes(as.factor(Survived)~., train)

BayesPrediction<-predict(BayesTitanicModel, test)

summary(BayesPrediction)

output<-data.frame(test$PassengerId, BayesPrediction)

colnames(output)<-cbind("PassengerId","Survived")

write.csv(output, file = 'C:/Users/Madan/OneDrive/Desktop/Titanic-Survival-Prediction-Using-R-master/Results/NaiveBayesResults.csv', row.names = F)

print("CONFUSION MATRIX USING NAIVE BAYES:")
results2 <- table(BayesPrediction, validation_data$Survived)

print("ACCURACY USING NAIVE BAYES:")
confusionMatrix(results2)

print("USING K NEAREST NEIGHBOUR:")

train <- train[,-c(4,9,11,12)]
test <- test[,-c(3,8,10,11)]




