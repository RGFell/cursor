#First Assignment Pollutant's

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)


pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  id.length <- length(id)
  pollutant_list <- list.files(directory, full.names = TRUE) #Create a list of files
  dat <- data.frame() #Creates an empty data frame
  
  for ( id in 1:id.length){
    dat <- rbind(dat, read.csv(pollutant_list[id]))
    
  }
  
  dat_subset <- dat[which(dat[, "ID"] == id), ]
  meansp <- mean(dat_subset[, pollutant], na.rm = TRUE)
  return(meansp)
}

## Otra version de pollutantmean

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id = 1:332) {
 
  id.length <- length(id)
  names <- list()
  dat <- data.frame() #Creates an empty data frame
  
  for ( id in 1:id.length){
    dat <- rbind(dat, read.csv(pollutant_list[id]))
    
  }
 
  dat_subset <- dat[which(dat[, "ID"] == id), ]
  meansp <- mean(dat_subset[, pollutant], na.rm = TRUE)
  colnames(dat) = c("id", "nobs"))
  return(meansp)
  
}

