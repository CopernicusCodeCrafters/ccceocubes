# Start service
library(openeocubes)
library(gdalcubes)
library(caret)
library(sf)
library(stats)
library(httr)
library(jsonlite)

 #CCC : "34.209.215.214"

aws.host <- Sys.getenv("AWSHOST")

if (aws.host == "") {
  tryCatch({
  aws.host <- NULL
  message("AWS Host is NULL")
  },
  error = function(err){
    message(toString(err))
  }) 
}else {
  tryCatch({
    message("AWS host port id is: ", aws.host)
  },error = function(err){
    message(toString(err))
  })
}

config <- SessionConfig(api.port = 8000, host = "0.0.0.0", aws.ipv4 = aws.host)
config$workspace.path <- "/var/openeo/workspace"
createSessionInstance(config)
Session$startSession()
