# If you have edited *.Rmd files in the Book folder, use this script to transform them to *.md files
require(Rgitbook);
setwd("~/GitHub/Spatial_data_visualization_with_R/Book");

buildGitbook();
openGitbook();
