library(Rgitbook)

#### Build a gitbook and erase the previous "Book" directory if any. ####
#source('initGitbook_function.R') # Fixes bugs to allow the building of *.Rmd files.
#newGitbook('Book')
#initGitbook()

#### Update and visualize the content. ####
# The main sections are directories inside the "Book" directory.
# To update a specific content, modify the "Book/corresponding_section/*.Rmd file.
# To delete a specific subsection of second or lower order, delete the *.md and
# *.Rmd files in the "Book/corresponding_section" directory and the *.HTML file
# in the "Book/_book/corresponding_section" directory. Don't forget to update
# the SUMMARY.md file in the "Book" directory.
# To add a subsection of second or lower order, add the corresponding *.md and
# *.Rmd files to the "Book/corresponding_section" directory and update the
# SUMMARY.md file.
# To delete a main section, delete the corresponding section directory in the
# "Book" and "Book/_book" directories and update the SUMMARY.md file.
# To add a main section, add a directory in the "Book" directory and put
# in it the required *.md and *.Rmd files. Don't forget to update the
# SUMMARY.md file.
buildGitbook()
openGitbook()

#### Publish ####
publishGitbook('oswaldosantos/Spatial_data_visualization_with_R',
               +                message = 'Update built gitbook',
               +                out.dir = paste0(getwd(), '/Book/_book'))