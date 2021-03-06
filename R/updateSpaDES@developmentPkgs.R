#git clone git@github.com:eliotmcintire/LandWeb --branch rewriteNoAll --recurse-submodules -j8

deps <- FALSE
#devtools::install_github("PredictiveEcology/quickPlot", ref = "development", dependencies = deps)
devtools::install_github("PredictiveEcology/reproducible", ref = "development", dependencies = deps)
#devtools::install_github("PredictiveEcology/webDatabases", ref = "master", dependencies = deps)
devtools::install_github("PredictiveEcology/SpaDES.tools", ref = "development", dependencies = deps)
devtools::install_github("PredictiveEcology/SpaDES.core", ref = "development", dependencies = deps)
devtools::install_github("PredictiveEcology/pemisc", ref = "development", dependencies = deps)
devtools::install_github("PredictiveEcology/map", ref = "development", dependencies = deps)
devtools::install_github("PredictiveEcology/LandR", ref = "development", dependencies = deps)
devtools::install_github("PredictiveEcology/LandWebUtils", ref = "development", dependencies = deps)
devtools::install_github("PredictiveEcology/SpaDES.shiny", ref = "development", dependencies = deps)

devtools::install_github("rforge/mumin", subdir = "pkg", ref = "master", dependencies = deps)

devtools::install_github("achubaty/amc", ref = "development", dependencies = deps)

if (FALSE) {
  options(shiny.reactlog = TRUE)
}

if (FALSE) {
  try(detach("package:map", unload = TRUE))
  try(detach("package:LandR", unload = TRUE))
  try(detach("package:pemisc", unload = TRUE))
  try(detach("package:SpaDES.core", unload = TRUE))
  try(detach("package:SpaDES.tools", unload = TRUE))
  try(detach("package:reproducible", unload = TRUE))

  ghPath <- "~/GitHub"

  if (Sys.info()[["user"]] == "achubaty")
    ghPath <- "~/GitHub/PredictiveEcology"

  devtools::load_all(file.path(ghPath, "reproducible"))
  devtools::load_all(file.path(ghPath, "pemisc"))
  devtools::load_all(file.path(ghPath, "map"))
  devtools::load_all(file.path(ghPath, "SpaDES.core"))
  devtools::load_all(file.path(ghPath, "SpaDES.tools"))
  devtools::load_all(file.path(ghPath, "LandR"))
}

## test download of private data from Google Drive
if (FALSE) {
  dataDir <- file.path("~/GitHub/LandWeb/m/Biomass_borealDataPrep/data")

  file.remove(c(
    list.files(dataDir, pattern = "SPP_1990_FILLED_100m_NAD83_LCC_BYTE_VEG", full.names = TRUE),
    list.files(dataDir, pattern = "CASFRI", full.names = TRUE)
  ))
}
