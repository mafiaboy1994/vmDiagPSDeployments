
$vms = Get-AzVM -Status



foreach($vm in $vms){

    if($vm.StorageProfile.ImageReference.Offer -like "*ubuntu*"){
        #Write-Host "Ubuntu Imaged Linux VM found"

        Set-AzVMExtension -ResourceGroupName $vm.ResourceGroupName -VMName $vm.name `
        -Publisher Microsoft.Azure.Extensions -Settings '.\Linux Software Checker\ubuntuPythonChecker.json'
    }
    else{
        Write-Host "OS Yet to be Determined"
    }

}
