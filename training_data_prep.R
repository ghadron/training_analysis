library(data.table)
library(tidyr)
library(magrittr)

import_ap_data <- function(ap_csv) {
    training_df <- as.data.frame(fread(file = ap_csv, header = TRUE))
    
    bool_cols <- c("injured", "sick", "restday")
    
    training_df[bool_cols][is.na(training_df[bool_cols])] <- FALSE
    training_df$injured <- as.logical(training_df$injured)
    training_df$sick <- as.logical(training_df$sick)
    training_df$restday <- as.logical(training_df$restday)
    
    training_df
}
