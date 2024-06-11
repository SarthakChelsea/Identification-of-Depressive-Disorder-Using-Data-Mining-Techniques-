df<- read.csv('project_dataset_5K.csv')
dim(df)
ms_by_row<-((rowSums(is.na(df))/ncol(df)))*100
dr<-(1:5000)[ms_by_row>60]
cleaned_by_row<-df[-dr,]
dim(cleaned_by_row)



names(df)
library(caret)
ms_by_col<-(colSums(is.na(df))/nrow(df))*100
fullymissing<-names(ms_by_col[ms_by_col>=90])# for Sure to be Deleted
fullymissing
df_by_col<-(df[ , !(names(df) %in% fullymissing)]) # logical indexing
nearZeroVar(df_by_col)
sum(sapply(df_by_col,class)=='character')
sum(cor(df_by_col[ , !(names(df_by_col) %in% c('Class'))])>0.5,na.rm=T)-ncol(df_by_col)
detect_data_types <- function(data,thre=10) {
  column_types <- vector("character", length = ncol(data))
  
  for (i in 1:ncol(data)) {
    unique_values <- unique(data[, i])
    
    # If the number of unique values is less than or equal to a threshold, consider it categorical
    if (length(unique_values) <= thre) {  # You can adjust this threshold as needed
      column_types[i] <- "Categorical"
    } else {
      column_types[i] <- "Numerical"
    }
  }
  
  return(column_types)
}

column_types <- detect_data_types(df_by_col)
names(df_by_col)[column_types=='Categorical']
v<-numeric(0)
for (i in 10:210){
  column_types <- detect_data_types(df_by_col,i)
  v<-c(v,table(column_types)['Categorical'])
  
}
plot(10:210,v)

max(v)
