# create all the HTML output
# by rendering all of the .Rmd files

# iterate over the directories
for DIR in */; do
  # go into the directory
  cd $DIR

  for DIR in */; do
    # go into the directory
    cd $DIR
  
    # create the output directory
    mkdir htmls
  
    # iterate over Rmd files
    for RMD in *.Rmd; do
      # get the base name of the file
      BASE=$(basename $RMD ".Rmd")
      # echo back some useful user output to the terminal
      echo "Rendering $RMD to $BASE.html"
      # get R to do the hard work
      # note for future me, I had to run: file.copy(rmarkdown::pandoc_exec(), "/somewhere/on/path", overwrite = TRUE)
      Rscript -e "rmarkdown::render(input = './$BASE.Rmd', output_file = './$BASE.html', output_format = 'html_document', output_dir='./htmls')"
    done
  
    # go back up a directory
    cd ..
      
  done
  cd ..
done
