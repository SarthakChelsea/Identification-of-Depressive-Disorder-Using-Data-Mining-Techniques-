#Identification of Depressive Disorder Using Data Mining Techniques

## Project Overview
This project aims to predict whether a patient has experienced depressive disorders using data from the BFFS dataset. By implementing a comprehensive data preprocessing pipeline and leveraging advanced classification techniques in R, we developed a robust model to accurately identify depressive disorders.

## Table of Contents
- [Project Overview](#project-overview)
- [Data Preprocessing](#data-preprocessing)
- [Model Development](#model-development)
- [Results](#results)
- [Usage](#usage)

## Data Preprocessing
The initial dataset comprised 5000 observations across 276 columns, categorized into 240 categorical and 26 numerical features. The preprocessing steps involved:

1. **Categorical Features:**
   - **Remove Unbalanced Columns:** Columns with a significant imbalance in their categories were removed.
   - **Handle Missing Values:** Missing values were imputed based on the most frequent category or other suitable methods.
   - **Eliminate Correlated Columns:** Highly correlated categorical features were identified and removed to reduce multicollinearity.
   - **Result:** A refined set of 50 categorical features.

2. **Numerical Features:**
   - **Outlier Removal:** Techniques such as the IQR method were used to identify and remove outliers.
   - **Impute Missing Values:** Missing values were imputed using methods such as mean or median imputation.
   - **Remove Correlated Columns:** Highly correlated numerical features were identified and removed to avoid redundancy.
   - **Result:** A refined set of 8 numerical features.

3. **Combined Dataset:**
   - **Address Multicollinearity:** Further checks were performed to ensure no multicollinearity issues remained.
   - **Outlier Removal:** Additional outliers in the combined dataset were removed.
   - **Min-Max Scaling:** Numerical data was standardized using min-max scaling to ensure all features are on a similar scale.

The final preprocessed dataset contains 3704 observations across 57 columns.

## Model Development
We employed nested for loops in R to perform a series of experiments involving different combinations of data preprocessing, feature selection, model training, and evaluation. Key steps included:

1. **Data Splitting:**
   - The dataset was split into training (66.7%) and testing (33.3%) sets using the `initial_split` function from the `rsample` package.

2. **Balancing Techniques:**
   - **Oversampling:** Techniques such as SMOTE were used to balance the dataset by oversampling the minority class.
   - **Undersampling:** Random undersampling was used to balance the dataset by undersampling the majority class.

3. **Feature Selection Methods:**
   - **Information Gain:** Used to select features based on their information gain with respect to the target variable.
   - **Boruta:** An all-relevant feature selection method that identifies important features by comparing the importance of original attributes with the importance achievable at random.
   - **FDA (Flexible Discriminant Analysis):** Used as a feature selection technique by evaluating feature importance through discriminant analysis.

4. **Model Training and Evaluation:**
   - Various combinations of balancing techniques and feature selection methods were iterated through to identify the optimal approach.
   - Models were evaluated based on True Positive Rate (TPR) for both classes (Y and N).

### Explored Models and Combinations:
1. **Oversampling + Information Gain + FDA:**
   - **Class Y TPR:** 76.19%
   - **Class N TPR:** 66.37%

2. **Oversampling + Boruta + FDA:**
   - **Class Y TPR:** 75.6%
   - **Class N TPR:** 67.26%

3. **Undersampling + Information Gain + FDA (Best Model):**
   - **Class Y TPR:** 75.69%
   - **Class N TPR:** 65.93%

The **Undersampling + Information Gain + FDA** combination was selected as the best model due to its lower risk of overfitting and higher time efficiency.

## Results
The best model, **Undersampling + Information Gain + FDA**, achieved the following metrics:
- **Class Y (Y) TPR:** 75.69%
- **Class N (N) TPR:** 65.93%

These results indicate the model's effectiveness in predicting depressive disorders while balancing sensitivity and specificity.

## Usage
To reproduce the results or use the model on new data, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
2. **Run the R file "Project Code"**
