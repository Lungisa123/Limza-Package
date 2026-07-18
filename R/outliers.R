outliers <- function(vec, out_rm = FALSE){

  if(!is.numeric(vec)){
    stop(" vec is not numeric")
  }
  # ensure out_rm is bool
  if(!is.logical(out_rm) || length(out_rm) != 1){
    stop(" 'out_rm' is not bool")

  }
  # ensure vec is not empty
  if(length(vec)== 0){
    warning(" 'vec' is empty")
    return(numeric(0))
  }

  if(any(is.na(vec))){
    warning(" 'vec' contain one or more NA values")
    return(NA)
  }
  # vec contain infinite values
  if(any(is.infinite(vec))){
    warning(" 'vec' contains infinite values")
  }

   q1 <- quantile(vec, prob = 0.25)
   q3 <- quantile(vec, prob = 0.75)
   iqr_multi <- 1.5 * IQR(vec)
   lower <- q1 - iqr_multi
   upper <- q3 + iqr_multi
   if(out_rm == FALSE){

      outliers_vec <- vec[vec < lower | vec > upper]

      if(length(outliers_vec) == 0){
        warning("No outliers detected")
      }
      return(outliers_vec)
   }

   # return clean data
   clean_vec <- vec[!(vec < lower | vec > upper)]
  if(length(clean_vec) == 0){
    warning("No outliers to remove")
  }
   return(clean_vec)
}