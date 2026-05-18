# ==========================================
# 04_statistics.R
# Description: Hypothesis Testing & Group Comparisons
# ==========================================

library(dplyr)
library(rstatix)
library(ggplot2)
library(ggpubr)

data <- read.csv("outputs/processed_data.csv")

# -------------------------------
# BodyFat Split
# -------------------------------
median_val <- median(data$BodyFat)

data <- data %>%
  mutate(Group = ifelse(BodyFat >= median_val, "High", "Low"))

# -------------------------------
# Statistical Tests
# -------------------------------
results <- data.frame()

for (var in names(data)[!names(data) %in% c("BodyFat", "Group")]) {
  
  if (shapiro.test(data[[var]])$p.value > 0.05) {
    p <- t.test(data[[var]] ~ data$Group)$p.value
    test <- "T-test"
  } else {
    p <- wilcox.test(data[[var]] ~ data$Group)$p.value
    test <- "Mann-Whitney"
  }
  
  results <- rbind(results, data.frame(Variable = var, Test = test, P = p))
}

write.csv(results, "outputs/stat_tests.csv")

# -------------------------------
# Visualizations
# -------------------------------
ggboxplot(data, x = "Group", y = "BodyFat", fill = "Group")
ggsave("outputs/boxplot.png")

ggdensity(data, x = "BodyFat", fill = "Group")
ggsave("outputs/density.png")

cat("Statistical analysis completed.\n")
