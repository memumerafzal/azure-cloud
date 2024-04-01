# Create a Recovery Services vault
New-AzRecoveryServicesVault -ResourceGroupName $resourceGroupName -Name $vaultName -Location $location

# Enable Site Recovery for the VM
Enable-AzRecoveryServicesAsrForAzureVm -ResourceGroupName $resourceGroupName -Name $vmName -TargetResourceGroup $targetResourceGroup -TargetAzureSiteRecoveryStorageAccountId "/subscriptions/yourSubscriptionId/resourceGroups/yourResourceGroup/providers/Microsoft.Storage/storageAccounts/yourStorageAccount" -RecoveryAzureRegion $targetLocation

# Set up replication for the VM
$recoveryServicesVault = Get-AzRecoveryServicesVault -ResourceGroupName $resourceGroupName -Name $vaultName
$replicationPolicy = New-AzRecoveryServicesAsrPolicy -RecoveryAzureStorageAccountId "/subscriptions/yourSubscriptionId/resourceGroups/yourResourceGroup/providers/Microsoft.Storage/storageAccounts/yourStorageAccount" -Name "ASRPolicy" -ReplicationIntervalInMinutes 15 -RecoveryPoints 96 -ApplicationConsistentSnapshotFrequency 4 -TimeZone "UTC"
Set-AzRecoveryServicesAsrProtection -ResourceGroupName $resourceGroupName -Name $vmName -RecoveryServicesAsrVault $recoveryServicesVault -AsrPolicy $replicationPolicy -CreateVmIfNotFound -OS "Windows"