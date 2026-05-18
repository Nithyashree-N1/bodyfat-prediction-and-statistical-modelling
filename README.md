# Body Fat Prediction & Statistical Modelling in R

An end-to-end statistical analysis and predictive modelling project developed in **R** using anthropometric body composition data from the **Body Fat dataset**.  

This project was originally created as part of a **Master’s coursework in Data Science** and demonstrates a complete analytical workflow — from data preprocessing and exploratory analysis to statistical modelling, visualisation, and interpretation.

---

##  Repository Structure

- **data/** – original dataset (`bodyfat.csv`)
- **scripts/** – modular R scripts for each stage of the analysis
- **outputs/**
  - **plots/** – archived visual outputs from the original R analysis
  - **tables/** – statistical result tables extracted from the coursework report
- **README.md** – project overview and documentation

---

##  Project Overview

This project investigates body fat estimation using anthropometric measurements collected from 252 individuals.  

The project implements a complete statistical and machine learning workflow including:

- Data preprocessing & outlier handling  
- Exploratory data analysis (EDA)  
- Correlation analysis & multicollinearity assessment  
- Multiple Linear Regression  
- Ridge & Lasso Regression using `glmnet`  
- Statistical hypothesis testing  
- Principal Component Analysis (PCA)  
- Hierarchical clustering  

The primary objective is to identify the strongest predictors of body fat percentage and uncover meaningful body composition patterns within the dataset.

---

##  Key Methods & Techniques

###  Regression Modelling
- Multiple Linear Regression (MLR)
- Ridge Regression (L2 regularisation)
- Lasso Regression (L1 regularisation)
- Feature selection using penalised models

###  Statistical Testing
- Shapiro–Wilk normality testing  
- Independent t-tests  
- Mann–Whitney U tests  
- One-way ANOVA  
- Kruskal–Wallis tests  

###  Dimensionality Reduction & Clustering
- Principal Component Analysis (PCA)
- Scree plot & loading analysis
- Hierarchical clustering using Ward’s method

---

## 🛠️ Tools & Technologies

- **R**
- **ggplot2**
- **dplyr**
- **glmnet**
- **corrplot**
- **factoextra**
- **cluster**

---

## 📸 Notes on Visual Outputs & Tables

All plots and tables were originally generated in **R** during the coursework analysis.  

As the original exported output files were not preserved, archived visual outputs extracted from the final coursework report are included under:

- `output/plots/`
- `output/tables/`

These visuals accurately represent the original analytical results and findings.

---

## 🎯 Key Findings

- Density was identified as the strongest predictor of body fat percentage
- Abdomen and Chest measurements showed strong positive relationships with BodyFat
- Significant multicollinearity existed among several anthropometric variables
- Lasso Regression improved interpretability through feature selection
- PCA demonstrated that a small number of components explained most dataset variance
- Hierarchical clustering identified distinct body composition profiles

---

## ▶️ Running the Project

1. Clone the repository
2. Open the project in RStudio
3. Install the required R packages
4. Place the dataset inside the `data/` folder
5. Run the scripts sequentially:

```r
01_preprocessing.R
02_eda.R
03_modeling.R
04_statistics.R
05_pca_clustering.R
