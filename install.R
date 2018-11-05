install.packages('Rserve',,'http://www.rforge.net/')
install.packages('repmis')
require(repmis)
Names <- c("data.table", "dplyr", "lubridate", "stringr", "forecast", "tidyr", "RJDBC")
Vers <- c("1.11.8", "0.7.7", "1.5.0", "1.0.0", "8.3", "0.4.1", "0.2.7.1")

# Install old package versions into the default library
InstallOldPackages(pkgs = Names, versions = Vers)
