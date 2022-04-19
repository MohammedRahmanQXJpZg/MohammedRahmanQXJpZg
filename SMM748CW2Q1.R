#Part 1:

# Library
library(caret) 
library(pROC)
library(randomForest)
library(rattle)
library(tree)

set.seed(25) # Random seed designation  
data("GermanCredit") # Retrieve German credit data set

Train_Index = createDataPartition(y =GermanCredit$Class,p=0.7,list=FALSE) # Split into into training set.(70%)
Train_Dataset = GermanCredit[Train_Index,] # Insert Index into German Credit Data to create Training data
Test_Dataset = GermanCredit[-Train_Index,] # Remainder becomes Testing Data

set.seed(25)
DTree_Model <- train(Class~., data = Train_Dataset, trControl=trainControl(method = "cv", number = 5), tuneLength=5, method = 'rpart') # Create and prunes D-tree model
DTree_Model
fancyRpartPlot(DTree_Model$finalModel) # Plot D-tree
mean(predict(DTree_Model, Test_Dataset) != Test_Dataset$Class) # Calculates error rate

#Part 2:

set.seed(25)
RForest_Model = train(Class~., data = Train_Dataset, trControl = trainControl(method = "cv", number = 5), method = "rf", ntree = 1000) # Creates Random forest with 1000 trees
mean(predict(RForest_Model, Test_Dataset) != Test_Dataset$Class)

plot(varImp(RForest_Model)) # Plot of feature significance 

#Part 3:

DTree_ROC <- roc(Test_Dataset$Class, as.numeric(predict(DTree_Model, Test_Dataset)))
RForest_ROC <- roc(Test_Dataset$Class, as.numeric(predict(RForest_Model, Test_Dataset)))

plot(DTree_ROC, col="blue")
plot(RForest_ROC, add = TRUE,col= "pink")

legend(x = "topleft",          
legend = c("Decision Tree", "Random Forest"), col = c("blue", "pink"), lwd=1)     

