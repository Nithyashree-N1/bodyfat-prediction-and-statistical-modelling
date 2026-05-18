# ==========================================
# 02_eda.R
# Description: Exploratory Data Analysis & Visualization
# ==========================================

library(dplyr)
library(ggplot2)
library(tidyr)
library(moments)
library(gridExtra)

data <- read.csv("outputs/processed_data.csv")

# -------------------------------
# Summary Statistics
# -------------------------------
summary_data <- summary(data)
print(summary_data)

# Skewness & Kurtosis
balance_metrics <- data.frame(
  Variable = names(data),
  Skewness = sapply(data, skewness),
  Kurtosis = sapply(data, kurtosis)
)

write.csv(balance_metrics, "outputs/balance_metrics.csv")

# -------------------------------
# Unified Scatter Plot
# -------------------------------
data_long <- data %>%
  pivot_longer(cols = -BodyFat, names_to = "Variable", values_to = "Value")

plot <- ggplot(data_long, aes(Value, BodyFat)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  facet_wrap(~Variable, scales = "free_x") +
  theme_minimal()

ggsave("outputs/unified_plot.png", plot, width = 12, height = 8)

cat("EDA completed.\n")
