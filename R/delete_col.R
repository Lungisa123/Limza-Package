delete_col <- function(df, cols = ""){
  # df must be a data frame
  if(!is.data.frame(df)){
    stop(" 'df' should be a dataframe")
  }
  # ensure cols contains strings only
  if(!is.character(cols)){
    stop(" 'cols' must contain strings only")
  }

  if(any(is.na(cols))){
    stop(" 'cols' cannot contain NA")
  }

  if(length(cols) == 0 || all(cols == "")){
    stop(" 'cols' cannot be empty ")
  }
  # ensure columns actually exist
  if(!all(cols %in% names(df))){
   missing_cols <- cols[!cols %in% names(df)]

   stop(
     paste(
       "The following column(s) are not in the data frame:",paste(missing_cols,collapse = ",")
     )
   )
  }

  # duplicate columns
  if (any(duplicated(cols))){
    warning("Duplicate column names supplied")
  }

  positions <- match(cols,colnames(df))
    return(df[,-positions])


}