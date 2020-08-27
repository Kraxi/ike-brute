display_usage() {
    echo "You should run this as root. ike-scan requires that."
    echo "For now there is no support for arguments etc. Just this usage. Maybe I will add this later on."
    echo "Once you run this, script will create valid_transformation_<IP>.txt file with all found valid transformations there"
    echo "Then it will print out valid groups if found any."

}

if [[ $1 == "-h"  ]]
then
    display_usage
    exit 1
fi

while read line;
    do (>&2 echo "Checking $line"; echo "$line" && sudo ike-scan -M $line $1) | grep -B14 "1 returned handshake" | grep "\-\-trans" ; done < ike-dict.txt 1> valid_transformation_${1}.txt


while read line_trans;
    do
        while read line_id;
            do (echo "Found ID: $line_id, $line_trans" && ike-scan -M -A -n $line_id $line_trans $1) | grep -B14 "1 returned handshake" | grep "Found ID:";
        done < vpnids
done < valid_transformation_${1}.txt
