#################################################################################################################
##### VERY BASIC LINEAR REGRESSION ##############################################################################
#################################################################################################################

# Assumes data is clean
# set your working directory to your PC

# READ data
saledata <- read.csv('train_v2.csv')

# examine the variables in the data
summary(saledata)

# RUN the regression of Sales on the factors that if there was a promo that day , was it a school holiday and was it a state holiday
#Since the three variables of interest are binarly , lets convert them to factors by putting a factor() in front of each
reg_saledata <- lm(Sales~factor(Promo)+factor(StateHoliday)+factor(SchoolHoliday), data = saledata)
reg_saledata
# note: you can replace 'Promo+StateHoliday+SchoolHoliday' with a period (.), and you will get the same result.
# like this: reg_shoes <- lm(Sales~., data = shoes)

# look at a summary of the regression results:
summary(reg_saledata)

# PREDICT the average sales for a typical day you want
# first, create a dataframe with the  parameters
new_record <- data.frame(StateHoliday = 0 ,SchoolHoliday = 1,Promo=1)

# then run the prediction
predict(reg_saledata, newdata = new_record)

# INTERPRET: we expect the mean value of Sales for the new record to be 111068.12

