###
### Basic sanity check to ensure that, given the same inputs, we get the same output
### Will output any differences in the result files, so no output is a good result.
###

$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

$ResultFile = "EmailAddresses.result.txt"

$ApprovedFile = "EmailAddresses.approved.txt"

Import-Module $Here\EmailAddressMangler.ps1

Invoke-EmailAddressMangler `
    -FirstNamesList .\namelists\top_100_male_female_first_names.txt `
    -LastNamesList .\namelists\top_100_last_names.txt `
    -AddressConvention fnli `
    -Domain testing.com `
    | Out-File -Encoding ascii $ResultFile

Compare-Object (Get-Content $ApprovedFile) (Get-Content $ResultFile)
