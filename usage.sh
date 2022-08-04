USAGE=`top -b -n1 | head -n 50 | tail -n 48 | awk -F',' '{print $1}' | awk -F':' '{print $2}' | awk -F' ' '{print $1}'`
time=`date +"%H:%M:%S"`
printf "$time " >> "$(date +"%Y_%m_%d").log"
for i in $USAGE;
do 
printf "$i "  >> "$(date +"%Y_%m_%d").log" ;
done
printf '\n' >> "$(date +"%Y_%m_%d").log"
