# ike-brute
Simple script to brute force transformation and group ID using ike-scan
## Warning:
This requires ike-scan

## How to use:
* There is `ike-dict.sh` which generates all possible transformations (`ike-dict.txt`). You can modify it if you want to narrow down choices. 
* Run `ike-brute.sh <IP>` to:
  * Find valid transformations and save tem to `valid_transformations_<IP>.txt` file
  * Use above to find valid group IDs using `vpnids` or other list like [this](https://github.com/danielmiessler/SecLists/blob/master/Miscellaneous/ike-groupid.txt)
* Once you get your valid group IDs along with valid transformations you can run (Aggressive mode must be supported): `ike-scan -M -A -n <FOUND_ID> --pskcrack=hash.txt <IP>` to get the PSK hash.

# Enjoy!
