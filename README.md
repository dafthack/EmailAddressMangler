# EmailAddressMangler
This module mangles two lists of names together to generate a list of potential email addresses or usernames. It can also be used to simply combine a list of full names in the format (firstname lastname) into either email addresses or usernames. 

In the 'namelists' folder I've included some lists of the top most common first names and last names. Mangling together common names into a list can be useful when performing external password attacks when a lack of usernames or known email addresses exist. 

##Quick Start Guide
Open a PowerShell terminal from the Windows command line with 'powershell.exe -exec bypass'.

Type 'Import-Module EmailAddressMangler.ps1'.

The following command will merge the top 100 male/female first names with the top 100 last names into a list of email addresses of format firstnamelastinitial@testing.com (ex. johns@testing.com) and write it to a file called emailaddresses.txt.

```PowerShell
Invoke-EmailAddressMangler -FirstNamesList .\namelists\top_100_male_female_first_names.txt -LastNamesList .\namelists\top_100_last_names.txt -AddressConvention fnli -Domain testing.com | Out-File -Encoding ascii emailaddresses.txt
```
The output would look something like this:
```
amyp@testing.com
amyr@testing.com
amys@testing.com
amyt@testing.com
amyw@testing.com
amyy@testing.com
andrewa@testing.com
andrewb@testing.com
andrewc@testing.com
andrewd@testing.com
andrewe@testing.com
```


The following command will perform a simple merge of a list of full names (john smith) one per line into a list of usernames in the format lastname.firstinitial (ex. smith.j) and write it to a file called usernames.txt.
   
```PowerShell
Invoke-EmailAddressMangler -SimpleMergeList .\listofnamestomerge.txt -AddressConvention ln.fi | Out-File -Encoding ascii usernames.txt
```

The output would look something like this:
```
hill.a
knight.j
murray.m
smith.m
williams.t
```
