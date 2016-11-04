## A function that takes a directory of data files and a threshhold for complete cases
## and calculates the correlation between sulfate and nitrate for monitoring locations
## where the number of completely observed cases (on all variables) is greater than the threshold.
## The function should return a vector of correlations for the monitors that meet the 
## threshold requirement. If no monitors meet the threshold requirement, then the function should
## return a numeric vector of length 0.

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all variables)
## required to compute the correlation between
## nitrate and sulfate; the default is 0
## use function cor()

library(dplyr)
library(purrr)
corr <- function(directory, threshold = 0){
            all_complete <- complete(directory, id = 1:332)       # returns a data frame
            select_nobs <- filter(all_complete, nobs > threshold) # returns a data frame
            result <- integer()
            if (length(select_nobs$nobs) == 0){
                  max_nobs <- max(all_complete$nobs)
                  print(paste0("The threshold number is too high! The highest number to select is: ", max_nobs))
            }
           files_id <- select_nobs$id
           all_files <- list.files()
           files_touse <- all_files[files_id]
           files_tocor <- numeric(length(id))
           for (i in seq_along(files_touse)){
                 file_r <- read.csv(files_touse[[i]])
                 files_tocor[[i]] <- cor(file_r$sulfate, file_r$nitrate, use = "complete.obs")
                 result <- files_tocor
           }
           return(result)
}

cr <- corr("specdata", 2000)
summary(cr)    
length(cr)
head(cr)
cr <- corr("specdata", 1100)
head(cr)
summary(cr)



