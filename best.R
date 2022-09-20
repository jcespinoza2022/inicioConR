# Graficar las tasas de mortalidad a 30 días por infarto de miocardio
# install.packages("data.table")
library("data.table")

resultado2<- read.csv("outcome-of-care-measures.csv")
best <- function(state, resultado2) {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
 resultado2 <- tolower(resultado2)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 
  
  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!resultado2 %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid resultado2')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",resultado2), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, resultado2] <- out_dt[,  as.numeric(get(resultado2))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(resultado2), `hospital name`)]
  
  return(out_dt[, "hospital name"][1])
  
}