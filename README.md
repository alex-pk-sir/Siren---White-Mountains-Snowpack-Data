# Siren---White-Mountains-Snowpack-Data
Snow depth and penetrability data from the northern White Mountains of New Hampshire (winter 2011-2012)

### Overview of data and code
Data and associated code for modeling and plotting data from snowpack stations (n = 30) used for evaluating the influence of dormant season canopy cover (DSCC) on snow depth and penetrability during the 2011-2012 season. Stations were surveyed on 6 occasions over the course of the winter as part of a study to evaluate carnivore habitat use (Siren et al. 2017).

-Response variables include snow depth and snow penetrability found in the `depth.csv` and `penetrability.csv` files. 

-Snow depth and penetrability measurements were taken 5 times at each site during each survey using a "research grade" avalanche probe and penetrometer, respectively.

-There were 30 snow stations, 8 in open DSCC sites (Open), 4 in low DSCC sites (Low), 8 in medium DSCC sites (Medium), and 10 in high DSCC sites (High). These classifications were made using proprietary stand data provided by the landowners. For more information, please seen Siren et al. (2017).

-The code was written using R Statistical software. Base R functions were used for linear modeling (lm) and the lubridate and ggplot2 packages were used for converting dates and plotting model predictions, respectively.

### Structure of files
The nomenclature of the .csv files are the same for both .csv files. They are as follows:
  -site: name of the snow station
  -date: date of the snow survey
  -elevation: elevation of the snow station
  -canopy_density: DSCC classification of the site
  -elevation_s: scaled and centered elevation
  -date_f: categorical variable (created in R)

### Structure of code
See R code.

### Description of data collection and original use
Data were collected by Alexej Siren and orginally used for evaluating the influence of snow on carnivores: **Sirén, A. P. K., P. J. Pekins, J. R. Kilborn, J. J. Kanter, and C. S. Sutherland. 2017. Potential influence of high-elevation wind farms on carnivore mobility. Journal of Wildlife Management 81:1–8. https://doi.org/10.1002/jwmg.21317**
