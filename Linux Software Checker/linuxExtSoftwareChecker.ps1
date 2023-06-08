
$vms = Get-AzVM -Status



foreach($vm in $vms){

    if($vm.StorageProfile.ImageReference.Offer -like "*ubuntu*"){
        Write-Host "Ubuntu Imaged Linux VM found"
    }
    else{
        Write-Host "OS Yet to be Determined"
    }

}
