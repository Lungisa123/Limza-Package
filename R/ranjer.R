ranjer <- function(x,lb,ub, inside = TRUE, inclusive = FALSE){

  # ensure x is numeric
  if(!is.numeric(x)){
    stop(" 'x' must be numeric")
  }
  # ensure lb and ub exist and are numeric
  if(!is.numeric(lb) || length(lb) != 1){
    stop(" 'lb' must be a single numeric value")

  }
  if(!is.numeric(ub) || length(ub) != 1){
    stop(" 'lb' must be a single numeric value")
  }
  # ensure inside n inclusive  are bool
  if (!is.logical(inside) || length(inside) != 1) {
    stop("'inside' is not a bool")
  }

  # inclusive must be logical
  if (!is.logical(inclusive) || length(inclusive) != 1) {
    stop("'inclusive' is not a bool")
  }
  # lb must be less than ub
  if(lb >= ub){
    stop(" 'lb' must be less than 'ub'")
  }

  if(length(x) == 0){
    warning(" 'x' is an empty vector")
  }
  if(any(is.na(x))){
    warning(" 'x' contains one or more NA values")
    return(NA)
  }

  condition <- if(inclusive){
    x >= lb & x <= ub
  }else{
    x > lb & x < ub
  }

  if(inside){
    if(!any(condition)){
      warning("No values fall within specified range")
    }
    return(x[condition])
  }
  if(!any(!condition)){
    warning("No values fall outside the specified range")
  }
  return(x[!condition])

}