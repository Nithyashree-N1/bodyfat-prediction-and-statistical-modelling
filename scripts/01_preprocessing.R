# ==========================================
# 01_preprocessing.R
# Description: Data loading, missing values, outlier detection, cleaning
# ==========================================

# Load libraries
packages <- c("dplyr", "moments")
lapply(packages, require, character.only = TRUE)

# Set seed for reproducibility
set.seed(123)

# Load dataset
raw_data <- read.csv("data/bodyfat.csv")

# -------------------------------
# Missing Values Check
# -------------------------------
missing_values <- colSums(is.na(raw_data))
print("Missing Values:")
print(missing_values)

# -------------------------------
# Outlier Detection (IQR)
# -------------------------------
outlier_detection <- function(x) {
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  return(x[x < (Q1 - 1.5 * IQR) | x > (Q3 + 1.5 * IQR)])
}

outliers <- lapply(raw_data[, -1], outlier_detection)
print("Outliers:")
print(outliers)

# -------------------------------
# Data Cleaning
# -------------------------------
processed_data <- raw_data %>% 
  mutate(
    Height = ifelse(Height < 60, NA, Height),
    BodyFat = ifelse(BodyFat > 40, NA, BodyFat)
  ) %>%
  na.omit()

# Save cleaned data
write.csv(processed_data, "outputs/processed_data.csv", row.names = FALSE)

cat("Preprocessing completed.\n")
