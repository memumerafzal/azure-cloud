# Microsoft Azure VM Creation

This repository explains to Create an Azure VM with in "myResourceGroup" using  New-AzVM


> **NOTE:** First step is to make an account on (https://portal.azure.com) Then Open Azure Cloud Shell 


## Using the script

Utilize the New-AzVM cmdlet to generate a virtual machine (VM). Assign distinct names to all associated resources, and the New-AzVM cmdlet will establish them if they are not yet present.

Upon request, furnish a username and password for use as the VM's sign-in credentials

For example, this can be done using

```powershell
New-AzVm `
    -ResourceGroupName 'myResourceGroup' `
    -Name 'myVM' `
    -Location 'East US' `
    -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' `
    -VirtualNetworkName 'myVnet' `
    -SubnetName 'mySubnet' `
    -SecurityGroupName 'myNetworkSecurityGroup' `
    -PublicIpAddressName 'myPublicIpAddress' `
    -OpenPorts 80,3389
```
The PowerShell script you provided is used to create a new virtual machine (VM) in Microsoft Azure using the New-AzVM cmdlet. Let's break down each parameter:

* New-AzVM: This is the cmdlet used to create a new virtual machine in Azure.

* -ResourceGroupName 'myResourceGroup': Specifies the name of the resource group where the VM will be deployed. Replace 'myResourceGroup' with the name of your desired resource group.

* -Name 'myVM': Sets the name for the new VM to 'myVM'. You can replace this with the desired name for your VM.

* -Location 'East US': Specifies the Azure region where the VM will be deployed. Replace 'East US' with your desired Azure region.

* -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest': Defines the image to be used for the VM. In this case, it's specifying a Windows Server 2022 Datacenter Azure Edition image. The :latest tag ensures that the latest version of the image is used.

* VirtualNetworkName 'myVnet': Specifies the name of the virtual network (VNet) to which the VM will be connected.

* -SubnetName 'mySubnet': Specifies the name of the subnet within the virtual network where the VM will be placed.

* -SecurityGroupName 'myNetworkSecurityGroup': Specifies the name of the network security group (NSG) to be associated with the VM. NSGs are used to control inbound and outbound traffic to network interfaces.

* -PublicIpAddressName 'myPublicIpAddress': Specifies the name of the public IP address to be assigned to the VM. This parameter assigns a public IP address to the VM, allowing it to be accessed from the internet.

* -OpenPorts 80,3389: Specifies the ports to be opened on the VM's network security group. In this example, ports 80 (HTTP) and 3389 (RDP) are opened, allowing web traffic and remote desktop access to the VM, respectively

When you run this script, it will create a new virtual machine in Azure with the specified configuration and settings



## Disclaimer

> Sharing is caring!