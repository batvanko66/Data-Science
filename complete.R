## A function that reads a directory full of files and reports the number of completely
## observed cases in each data file. The function should return a data frame
## where the first column is the name of the file and the second is the number
## of complete cases.
## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the 
## number of complete cases

complete <- function(directory, id = 1:332){
      setwd("/home/ivan/BD_Science/Data-Science/Coursera/datasciencecoursera")
      setwd(directory)
      all_files <- list.files()
      files_touse <- all_files[id]
      nobs <- numeric(length(id))
      for (i in seq_along(files_touse)){
           file_r <- read.csv(files_touse[[i]])
           nobs[[i]] <- sum(complete.cases(file_r))
           result <- data.frame(id, nobs)
      }
      result
 }

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
