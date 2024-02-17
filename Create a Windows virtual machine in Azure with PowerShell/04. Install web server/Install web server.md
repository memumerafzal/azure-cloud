# How to install IIS Server

This repository explains to install IIS Server in VM


> **NOTE:** First step is to make an account on (https://portal.azure.com) Then Open Azure Cloud Shell 


## Using the Azure Cloud Shell

To see your VM in action, install the IIS web server. Open a PowerShell prompt on the VM and run the following command:

```powershell
	Invoke-AzVMRunCommand -ResourceGroupName 'myResourceGroup' -VMName 'myVM' -CommandId 'RunPowerShellScript' -ScriptString 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'
```

## Updated Command

## Disclaimer

> Sharing is caring!