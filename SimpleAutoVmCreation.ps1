#Script Parameters
Param(
    [string]$resourceGroup
)

<# Commands used when script is running on local computer not cloud shell
#Import Azure PowerShell module
Import-Module -Name Az

#Connect to Azure account
Connect-AzAccount
#>

#Getting admin credentials for new VMs
$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

For ($i = 1; $i -le 3; $i++)
{
    $vmName = "ConferenceDemo" + $i
    Write-Host "Creating VM: " $vmName
    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
}