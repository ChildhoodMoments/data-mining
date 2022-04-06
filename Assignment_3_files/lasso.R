library(tidyverse)
library(lubridate)
library(randomForest)
library(gbm)
library(pdp)
library(modelr)
library(rsample)
library(foreach)
library(mosaic)
library(ggplot2)
library(tree)
library(rpart)
library(rpart.plot)
library(glmnet)

greenbuildings=read.csv("https://github.com/jgscott/ECO395M/blob/master/data/greenbuildings.csv")

greenbuildings<-na.omit(greenbuildings)
greenbuildings_update = mutate(greenbuildings,revenue_year_square = greenbuildings$Rent*greenbuildings$leasing_rate)

# let's split our data into training and testing
gb_split =  initial_split(greenbuildings_update, prop=0.8)
gb_train = training(gb_split)
gb_test  = testing(gb_split)

##1 use lasso to yield automatic variable selection

gbx = model.matrix(revenue_year_square ~.-Rent-leasing_rate-LEED-Energystar, data=gb_train)
gby = gb_train$revenue_year_square

gblasso = gamlr(gbx , gby , family="gaussian", alpha = 1)
plot(gblasso)

best_lambda=lasso$lambda.min

##2 compute rmse of lasso

gbX_test = model.matrix(revenue_year_square ~ .-Rent-leasing_rate-LEED-Energystar, data = greenbuildings_test)
gbY_test = gb_test$revenue_year_square
Y_hat = predict(lasso, newx = X_test)

(mean((Y_hat-Y_test)^2))^0.5
