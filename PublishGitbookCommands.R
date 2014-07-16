# Commands to pass to git to publish the book

# WebBook folder
cd Spatial_data_visualization_with_R/_book

# Create an empty Git repository
git init

# Record changes to the repository
# --allow-empty Let you make a commit that is equal to the parent commit
# -m <msg> Commit message
git commit --allow-empty -m 'Update built gitbook1'

# Updates files in the working tree to match the version in the index or the specified tree
# Also changes the working branch
# -b <branch> Create a new branch or Reset a existing one
git checkout -b gh-pages

# add all existing file (from Spatial_data_visualization_with_R/_book) to the index
git add .

# Record changes to the repository
# -a Tell the command to automatically stage files that have been modified and deleted, 
#    but new files you have not told Git about are not affected.
# -m <msg> Commit message
git commit -a -m 'Update built gitbook2'

# Updates remote refs using local refs
# -- force Usually, the command refuses to update a remote ref that is not an ancestor of 
# the local ref used to overwrite it. This flag disables these checks, and can cause 
# the remote repository to lose commits; use it with care.
git push https://github.com/oswaldosantos/Spatial_data_visualization_with_R gh-pages --force
