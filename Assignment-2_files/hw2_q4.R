library(tidyverse)
library(ggplot2)
library(modelr)
library(rsample)
library(mosaic)
library(lubridate)
library(ModelMetrics)


#hotels_dev <- read.csv('https://raw.githubusercontent.com/jgscott/ECO395M/master/data/hotels_dev.csv')

#hotels_val <- read.csv('https://raw.githubusercontent.com/jgscott/ECO395M/master/data/hotels_val.csv')
hotels_dev <- read.csv('D:/01 UT Austin/2022 spring/DataMining/data-mining/HW2/hotels_dev.csv')
hotels_val <- read.csv('D:/01 UT Austin/2022 spring/DataMining/data-mining/HW2/hotels_val.csv')

# Using only the data in hotels.dev.csv, please compare the out-of-sample performance of the following models:

hotels_dev = mutate(hotels_dev, Time = ymd(arrival_date), month = month(Time) %>% factor())
hotels_val = mutate(hotels_val, Time = ymd(arrival_date), month = month(Time) %>% factor())

hotels_dev_split = initial_split(hotels_dev, prop = 0.8)
hotels_dev_split_train = training(hotels_dev_split)
hotels_dev_split_test = testing(hotels_dev_split)

# baseline 1: a small model that uses only the market_segment, adults, customer_type, and is_repeated_guest variables as features.
lm1 = lm(children ~ market_segment + adults + customer_type + is_repeated_guest,  data = hotels_dev_split_train,)
lm2 = lm(children ~ . -arrival_date, data = hotels_dev_split_train,)
# transfer arrival_date  as a time stamp,  in a specific format: Y-M-D    feature-engineer.R

lm3 = lm(children ~ . -arrival_date + market_segment:distribution_channel + month, data = hotels_dev_split_train,)

glm1 = glm(children ~ market_segment + adults + customer_type + is_repeated_guest,  data = hotels_dev_split_train, family = 'binomial')
glm2 = glm(children ~ . -arrival_date, data = hotels_dev_split_train, family = 'binomial')
glm3 = glm(children ~ . -arrival_date + market_segment:distribution_channel + month, data = hotels_dev_split_train, family = 'binomial')

rmse(lm1, hotels_dev_split_test)
rmse(lm2, hotels_dev_split_test)
rmse(lm3, hotels_dev_split_test)
rmse(glm1, hotels_dev_split_test)
rmse(glm2, hotels_dev_split_test)
rmse(glm3, hotels_dev_split_test)

# it shows prediction from a rank-deficient fit may be misleading
# lm model's rmse is smaller than glm model's



#Model validation: step 1
# spamtoy.R

probhat = predict(lm3, newdata = hotels_val)
probs <- exp(probhat)/(1 + exp(probhat))

probhat_2 <- predict(glm3, newdata = hotels_val)



# or get probability directly use
#pred = predict(glm3, newdata = hotels_val, type = 'response')
#head(pred)

#children_hat =  ifelse(probhat >= 0.5, 1, 0)
#table(children = hotels_val$children, children_hat = children_hat)


library(ROCR)

# ROC curve
#https://www.bilibili.com/video/BV1Y64y1Z7Ht
ROCR = prediction(probhat, hotels_val$children)
perf = performance(ROCR, 'tpr','fpr')

ROCR_2 = prediction(probhat_2, hotels_val$children)
perf_2 = performance(ROCR_2, 'tpr', 'fpr')

x <- unlist(perf@x.values)
y <- unlist(perf@y.values)
plotdata <- data.frame(x,y)
names(plotdata) <- c('x', 'y')

g <- ggplot(plotdata)+ 
  geom_path(aes(x = x, y = y, color = x), size =1)+
  labs(x = 'False positive rate', y = 'True positive rate', title = 'ROC Curves based on linear model')
  
x_2 <- unlist(perf_2@x.values)
y_2 <- unlist(perf_2@y.values)
plotdata_2 <- data.frame(x_2,y_2)
names(plotdata_2) <- c('x_2', 'y_2')

g_2  <- ggplot(plotdata_2)+ 
  geom_path(aes(x = x_2, y = y_2, color = x_2), size =1)+
  labs(x = 'False positive rate', y = 'True positive rate', title = 'ROC Curves based on logit model')



# folds lecture 0207

# B
hotels_val_split = initial_split(hotels_val, prop = 0.8)
hotels_val_split_train = training(hotels_val_split)
hotels_val_split_test = testing(hotels_val_split)
library(caret)

set.seed(100)
indexs = createFolds(1:dim(hotels_val)[1], k = 20, list = TRUE, returnTrain = FALSE)
err_result = c()
model = glm(children ~ . -arrival_date + market_segment:distribution_channel + month, data = hotels_val, family = 'binomial')
for (i in 1:20){
  slice_data = hotels_val[indexs[[i]],]
  prediction = predict(model,newdata = slice_data,type = "response")
  predict_num = round(mean(prediction)*dim(slice_data)[1])
  ### expected number of bookings with children for that fold.
  actual_num = sum(slice_data$children)
  err_result = rbind(err_result,c(actual_num,predict_num))
} 

# The following is the summary of expected number of bookings with children for that 
# fold and actual number

err_result = data.frame(err_result)
colnames(err_result)=c("actual_num","predict_num") 
err_result$difference = err_result$predict_num-err_result$actual_num
print(err_result)

# The following figure demonstrates the distribution of difference beween actual number
# and expected number.
p0 = ggplot(data=err_result) + 
  geom_histogram(aes(x=difference)) 
p0

