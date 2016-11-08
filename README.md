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

###Invoke-EmailAddressMangler Options
```
FirstNamesList       - A list of first names one per line.
LastNamesList        - A list of last names one per line.
SimpleMergeList      - A list of full names one per line in the format 'firstname lastname'. If this option is specified the tool will simple merge the names together as opposed to mangling all possible combinations.
Domain               -The domain to append to each email address. If the -Domain option is not specified a username list will be generated.
AddressConvention    - The email address or username naming convention. fn=firstname, ln=lastname, fi=fistinitial, li=lastinitial The following are acceptable formats: fnln, fn-ln, fn.ln, filn, fi-ln, fi.ln, fnli, fn-li, fn.li, lnfn, ln-fn, ln.fn, lifn, li-fn, li.fn, lnfi, ln-fi, ln.fi fn, ln.

```
