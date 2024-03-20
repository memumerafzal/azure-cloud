#Powershell to create resource group in specific location

PS /home/kevin> $location ='eastus'
PS /home/kevin> $rgName = 'Temp-RG'
PS /home/kevin> New-AzResourceGroup -Name $rgName -Location $location

<# 
Output
ResourceGroupName : Temp-RG
Location          : eastus
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/459698c5-d214-47cc-a729-2b121b1683d6/resourceGroups/Temp-RG
#>

PS /home/kevin> Get-AzResourceGroup -Name $rgName
