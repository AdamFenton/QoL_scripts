
selectedFile="$(osascript -l JavaScript -e 'a=Application.currentApplication();a.includeStandardAdditions=true; a.chooseFile({withPrompt:"Choose a file to print:"}).toString()')"
selectedFileBasename=$(basename "${selectedFile}")
new_basename=`echo "$selectedFileBasename" | tr -d '[:blank:]'`
printCommand="lpr -P LE302-Colour ~/Downloads/$new_basename"

echo $selectedFile
function send_file() {
  scp -q $selectedFile afenton@stargate:~/Downloads
}
function print_file() {
  ssh -q afenton@stargate $printCommand
}
function delete_file() {
  ssh -q afenton@stargate "rm ~/Downloads/$new_basename" 2> /dev/null
}


send_file
echo "File sent to server..."
print_file
echo "Printing started..."
