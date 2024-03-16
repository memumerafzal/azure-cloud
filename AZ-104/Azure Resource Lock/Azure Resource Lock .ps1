# Prompting user to enter the name of the resource group
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"

# Prompting user to enter the name of the storage account
$storageAccountName = Read-Host -Prompt "Enter the storage account name"

# Creating a new resource lock on the specified storage account
New-AzResourceLock -LockName LockStorage `
                   -LockLevel CanNotDelete `
                   -ResourceGroupName $resourceGroupName `
                   -ResourceName $storageAccountName `
                   -ResourceType Microsoft.Storage/storageAccounts
