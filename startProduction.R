# Start service
library(openeocubes)
library(gdalcubes)
library(caret)
library(sf)


 #"34.209.215.214"

aws.host <- Sys.getenv("AWSHOST")

if (aws.host == "") {
  aws.host <- NULL
} else {
  message("AWS host port id is: ", aws.host)
}

config <- SessionConfig(api.port = 8000, host = "0.0.0.0", aws.ipv4 = "34.209.215.214")
config$workspace.path <- "/var/openeo/workspace"
createSessionInstance(config)
Session$startSession()
