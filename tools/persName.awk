BEGIN { RS = "<\\/?persName[^>]*>" }
FNR==1 {next}
!(NR%2){print $1, $2}
#!(NR%2){ #RS= "</?persName[^>]*>" ; 
#  print $1, $2, RT; next }
#!(NR%2) {print $0, FILENAME}

