# Microsoft Azure Resource Group Creation using Powershell Syntex

This repository explains to Create an Azure resource group with New-AzResourceGroup


> **NOTE:** First step is to make an account on (https://portal.azure.com) Then Open Azure Cloud Shell 


## Using the script

A resource group is a logical container into which Azure resources are deployed and managed.

For example, this can be done using

```powershell
New-AzResourceGroup -Name 'myResourceGroup' -Location 'EastUS'
```

The PowerShell command New-AzResourceGroup is used to create a new resource group in Microsoft Azure. Here's a breakdown of the command and its parameters:

* New-AzResourceGroup: This is the cmdlet (or commandlet) provided by the Azure PowerShell module. It is used to interact with Azure resources, specifically for creating new resource groups.

* -Name 'myResourceGroup': This parameter specifies the name of the resource group to be created. In this example, the name provided is 'myResourceGroup'. You can replace this with the desired name for your resource group.

* -Location 'EastUS': This parameter specifies the Azure region where the resource group will be created. In this example, the location provided is 'EastUS', which corresponds to the East US Azure region. You can replace this with the desired Azure region where you want your resource group to be located.

When you run this command in PowerShell with the specified parameters, it will create a new resource group named 'myResourceGroup' in the East US Azure region. This resource group can then be used to organize and manage related Azure resources, such as virtual machines, storage accounts, databases, etc., within the specified region



## Disclaimer

> Sharing is caring!