
find ~+ $@ -name disc*.ev | while read line; do
    echo "-----------------------------------------------------"
    DIR_NAME=${line%:*}  # retain the part before the colon
    DIR_NAME=${DIR_NAME%/*}
    echo -n "Run directory: ";echo "'$line'"
    printf  "Time through simulation (Code Units): `awk 'END{print $1}' "$line"` out of `awk 'NR==10{print $3}' $DIR_NAME/disc.in`\n"
    #echo -n "Maximum density reached (g/cm^3): "; awk 'END{print $11 *  5.941E-07;}' "$line"

    # echo -n "Time through simulation (code units): ";awk END'{print $1}' "$line"
    # echo -n "Maximum density reached (code units): ";awk END'{print $11}' "$line"


    DIR_NAME=${line%:*}  # retain the part before the colon
    DIR_NAME=${DIR_NAME%/*}  # retain the part after the last slash
    echo -n  "Number of snapshots produced: ";find $DIR_NAME -maxdepth 5 -name "disc_*" -printf '.' | wc -m
    echo "-----------------------------------------------------"
done

