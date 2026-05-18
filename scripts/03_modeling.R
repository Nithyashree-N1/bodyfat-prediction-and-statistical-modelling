# ==========================================
# 03_modeling.R
# Description: Regression Models (MLR, Ridge, Lasso)
# ==========================================

library(car)
library(glmnet)

set.seed(123)

data <- read.csv("outputs/processed_data.csv")

# -------------------------------
# Linear Regression
# -------------------------------
model <- lm(BodyFat ~ ., data = data)
summary(model)

# VIF
vif_values <- vif(model)
write.csv(vif_values, "outputs/vif.csv")

# -------------------------------
# Ridge & Lasso
# -------------------------------
x <- as.matrix(data[, -which(names(data) == "BodyFat")])
y <- data$BodyFat

ridge <- cv.glmnet(x, y, alpha = 0)
lasso <- cv.glmnet(x, y, alpha = 1)

write.csv(as.matrix(coef(ridge, s = "lambda.min")), "outputs/ridge.csv")
write.csv(as.matrix(coef(lasso, s = "lambda.min")), "outputs/lasso.csv")

# -------------------------------
# Performance
# -------------------------------
ridge_pred <- predict(ridge, s = "lambda.min", newx = x)
lasso_pred <- predict(lasso, s = "lambda.min", newx = x)

ridge_r2 <- 1 - sum((y - ridge_pred)^2) / sum((y - mean(y))^2)
lasso_r2 <- 1 - sum((y - lasso_pred)^2) / sum((y - mean(y))^2)

cat("Ridge R2:", ridge_r2, "\n")
cat("Lasso R2:", lasso_r2, "\n")
