#library(purrr)

pollutantmean <- function(directory, pollutant, id = 1:332){
      setwd("/home/ivan/BD_Science/Data-Science/Coursera/datasciencecoursera")
      setwd(directory)
      files_all <- list.files() 
      files_toread <- purrr::map(files_all[id], read.csv)
      files_bind <- do.call(rbind, files_toread)
      mean(files_bind[[pollutant]], na.rm = TRUE)
}

pollutantmean("specdata", "nitrate")

options(digits = 4)
# these give 1,733 on 70:72 - na.omit(),  complete.cases()