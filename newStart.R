source("01-init.R")
source("02-runName.R")

if (grepl("LandWeb", runName)) {
  source(file.path(activeDir, "params", "LandWeb_parameters.R")) ## same as FMA_parameters; i.e., no cache ids
} else if (grepl(
  paste(
    "ANC", "BLUERIDGE", "DMI", "EDSON", "LP", "MANNING", "MILLARWESTERN", "MISTIK", "MPR",
    "FMANWT", "SUNDRE", "TOLKO", "VANDERWELL", "WESTFRASER", "WEYCO", sep = "|"
  ), toupper(runName))) {
  source(file.path(activeDir, "params", "FMA_parameters.R"))
} else if (grepl(paste("PROVAB", "PROVNWT", "PROVSK", sep = "|"), toupper(runName))) {
  source(file.path(activeDir, "params", "FMA_parameters.R"))
} else {
  stop(crayon::red("Parameters file not read for runName", runName))
}

if (grepl("prof", tolower(runName))) {
  source(file.path(activeDir, "params", "profiling_parameters.R"))
}

if (grepl("test", tolower(runName))) {
  source(file.path(activeDir, "params", "testing_parameters.R"))
}

source("03-packages.R")
source("04-paths.R")
source("05-options.R")
source("06-sim-objects.R")

source("07-preamble.R")
source("08-speciesLayers.R")
source("09-pre-sim.R")

if (isFALSE(postProcessOnly))
  rm(simOutPreamble)

message(crayon::red(runName))

if (isFALSE(postProcessOnly)) {
  if (isFALSE(usePOM)) {
    source("10-main-sim.R")
    #source("11-post-sim.R")
  } else {
    source("10a-POM.R") ## TODO: may not work out-of-the-box; untested!!
  }
} else {
  #mySimOut <- readRDS(simFile("mySimOut", Paths$outputPath, 1000))
  source("12-postprocessing.R")
}

#source("11-post-sim.R")

if (FALSE) {
  source("13-old.R")
}
