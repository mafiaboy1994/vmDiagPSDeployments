


$vms = Get-AzVM -Status

$vm = Get-AzVM -Status -Name "p66Prd-Sma01"

#$settingsImport = Get-Content -path .\newPubSettings.json | ConvertFrom-Json

#$storageAccountName = Get-AzStorageAccount |?{$_.StorageAccountName -eq "p66guestmonitoringlogs"}| Select *


<#
$sasToken = New-AzStorageAccountSASToken -Service Blob,Table `
-ResourceType Service,Container,Object -Permission "racwdlup" `
-Context (Get-AzStorageAccount -ResourceGroupName $storageAccountName.ResourceGroupName `
-AccountName $storageAccountName.StorageAccountName).Context -ExpiryTime $([System.DateTime]::Now.AddDays(10))
#>

$publicSettings = Get-Content -Path .\newPubSettings.json | ConvertFrom-Json -AsHashtable

$privateSettings = Get-Content -Path .\privSettings.json | ConvertFrom-Json -AsHashtable

#$protectedSettings = "{'storageAccountName': '$storageAccountName',`
#'storageAccountSasToken': '$sasToken'}"

Set-AzVMExtension -ResourceGroupName $vm.ResourceGroupName -VMName $vm.name `
-Location $vm.Location -ExtensionType LinuxDiagnostic `
-Publisher Microsoft.Azure.Diagnostics -Name LinuxDiagnostic `
-settings $publicSettings `
-TypeHandlerVersion 3.0 -Verbose -Debug -nowait

