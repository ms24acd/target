# Use this PowerShell script to validate your five_forces.yml file: from the CMD prompt, type
# ./validate_5f.ps1 five_forces.yml
# If you have written your `five_forces.yml` in correct YAML syntax, you should see text for
# *each* field.
Param(
  [Parameter(Mandatory)][String]$inputFile
  )
Import-Module powershell-yaml
$contents = Get-Content -Raw -Path $inputFile
$yaml = ConvertFrom-Yaml -Yaml $contents

$fields = "group","members","topic"

"{0,-12} {1}" -f "field", "value"
"{0,-12} {1}" -f "-----", "-----------------------------"

foreach ($f in $fields) {
#   "field is: $f"
    if (! [bool]$yaml.$f) {
	$v = "NOT FOUND!"
    }  else {
	$v = $yaml.$f -join ", "
    }
    "{0,-12} {1}" -f $f, $v
}

"{0,-12} {1}
" -f "-----", "-----------------------------"


$fields = "customer_power","substitute_threat","new_entrant_threat","competitor_rivalry","supplier_power","competitive_strategy"

foreach ($f in $fields) {
    if (! [bool]$yaml.$f) {
	$v = "NOT FOUND!"
    }  else {
	$v = $yaml.$f
    }

    "*** {0} ***
" -f $f 
    "{0}" -f [string]$v
}