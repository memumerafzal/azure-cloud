# Prompting user to enter the source and destination resource group names
$sourceResourceGroupName = Read-Host -Prompt "Enter the source Resource Group name"
$destinationResourceGroupName = Read-Host -Prompt "Enter the destination Resource Group name"

# Prompting user to enter the name of the storage account to be moved
$storageAccountName = Read-Host -Prompt "Enter the storage account name"

# Retrieving the storage account from the source resource group
$storageAccount = Get-AzResource -ResourceGroupName $sourceResourceGroupName -ResourceName $storageAccountName

# Moving the storage account to the destination resource group
Move-AzResource -DestinationResourceGroupName $destinationResourceGroupName -ResourceId $storageAccount.ResourceId
