# build and install package locally (use for development)
install.packages("remotes", repos = "http://cran.us.r-project.org",lib =.libPaths()[1])
library(remotes,lib.loc=.libPaths()[1])

# openeocubes local install
remotes::install_local("./", dependencies = TRUE, force = TRUE,lib=.libPaths()[1])

# Start service
library(openeocubes)

aws.host <- Sys.getenv("AWSHOST")

if (aws.host == "") {
  aws.host <- NULL
} else {
  message("AWS host port id is: ", aws.host)
}


config <- SessionConfig(api.port = 8080, host = "0.0.0.0", aws.ipv4 = "34.209.215.214")
config$workspace.path <- "/var/openeo/workspace"
createSessionInstance(config)
Session$startSession()
