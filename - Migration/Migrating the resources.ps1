#Migrating the resources between the resources group through PowerShell is much easier. The below 2 commands can be used to migrate the resources between the resource group.

$SourceAID = (Get-AzureRmResource –ResourceGroupName “NetworkWatcher-RG” -ResourceName “NetworkWatcher_westus2”).ResourceID
Move-AzureRmResource -DestinationResourceGroupName “LAB-RG" -ResourceId $SourceAID 