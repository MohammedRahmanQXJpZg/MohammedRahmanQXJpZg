#Part 1:

#library
library(caret)
library(ROCR)
library(dplyr)
library(purrr)
library(pROC)

set.seed(25)
Thyroid_Data <- read.table("newthyroid.txt", header= TRUE,  sep="," ) # Retrieve thyroid data
Train_Index <- createDataPartition(Thyroid_Data$class, p = 0.7, list = TRUE, times = 10)
TrainTest_Data <- tibble(Train_Data = map(Train_Index , ~ Thyroid_Data[.x, ]), Test_Data = map(Train_Index , ~ Thyroid_Data[-.x, ]))

KNN_AUC = vector() # Empty KNN vector 
LDA_AUC = vector() # Empty LDA vector 

for(KNN_Index in 1:10) { # Iterates 10 training and testing sets
  set.seed(25) 
  Train_KNN=train(class~. , data = TrainTest_Data[[1]][[KNN_Index]],method="knn", trControl=trainControl(method = "cv", number = 5, classProbs=TRUE, summaryFunction = twoClassSummary),preProcess = c("center", "scale"), tuneGrid = expand.grid(k=c(3, 5, 7, 9, 11, 13, 15)), metric = "ROC") 
  #^^Train KNN with 5 fold cv
  KNN_AUC <- c(KNN_AUC,auc(TrainTest_Data[[2]][[KNN_Index]]$class,as.numeric(predict(Train_KNN, TrainTest_Data[[2]][[KNN_Index]])))) # Fill KNN vector with AUC test data
}
for(LDA_Index in 1:10) { 
  set.seed(25)
  Train_LDA = train(class~.,data= TrainTest_Data[[1]][[LDA_Index]], method = "lda", trControl = trainControl(method = "cv", number = 5, classProbs=TRUE,summaryFunction = twoClassSummary), metric = "ROC")
  #^^Train LDA with 5 fold cv
  LDA_AUC <- c(LDA_AUC,auc(TrainTest_Data[[2]][[LDA_Index]]$class,as.numeric(predict(Train_LDA, TrainTest_Data[[2]][[LDA_Index]]))))
}

#Part 2:
boxplot(KNN_AUC,LDA_AUC, names = c("kNN AUC Values", "LDA AUC Values")) # Plot boxplots of AUC values for KNN and LDA

