
FILE_NAMES=(
  "the_basics"
  "filesystem"
)

for NAME in "${FILE_NAMES[@]}"; do
  echo "Compiling $NAME."
  cd "$NAME" 
  typst compile --root ../../ "$NAME.typ" "pdf/$NAME.pdf"
  cd ..
  echo "Finished compiling $NAME"
done
