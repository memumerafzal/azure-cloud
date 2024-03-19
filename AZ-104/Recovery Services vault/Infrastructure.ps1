# Set variables
resourceGroup="RG-LAB"
location="eastus"

vnet1Name="VNet1"
vnet1AddressPrefix="10.1.0.0/16"
subnet1Name="Subnet1"
subnet1Prefix="10.1.1.0/24"
vm1Name="VM1"
vm1Size="Standard_DS1_v2"
vm1Image="Win2022Datacenter"

vnet2Name="VNet2"
vnet2AddressPrefix="10.2.0.0/16"
subnet2Name="Subnet2"
subnet2Prefix="10.2.1.0/24"
vm2Name="VM2"
vm2Size="Standard_DS1_v2"
vm2Image="Win2022Datacenter"


azureFirewallSubnetName="AzureFirewallSubnet"
azureFirewallSubnetPrefix="10.1.3.0/24"
azureFirewallName="AzureFirewall"
publicIPName="AzureFirewallPublicIP"
azureFirewallSKU="AZFW_VNet"


adminPassword="7211308Umer"

# Create Resource Group
az group create --name $resourceGroup --location $location

# Create VNet1
az network vnet create \
    --resource-group $resourceGroup \
    --name $vnet1Name \
    --address-prefixes $vnet1AddressPrefix \
    --subnet-name $subnet1Name \
    --subnet-prefix $subnet1Prefix

# Create VNet2
az network vnet create \
    --resource-group $resourceGroup \
    --name $vnet2Name \
    --address-prefixes $vnet2AddressPrefix \
    --subnet-name $subnet2Name \
    --subnet-prefix $subnet2Prefix

# Create VM1 in VNet1
az vm create \
    --resource-group $resourceGroup \
    --name $vm1Name \
    --image $vm1Image \
    --size $vm1Size \
    --vnet-name $vnet1Name \
    --subnet $subnet1Name \
    --admin-username azuser \
    --admin-password $adminPassword

# Create VM2 in VNet2
az vm create \
    --resource-group $resourceGroup \
    --name $vm2Name \
    --image $vm2Image \
    --size $vm2Size \
    --vnet-name $vnet2Name \
    --subnet $subnet2Name \
    --admin-username azuser \
    --admin-password $adminPassword


# Set variables

# Create Azure Firewall
az network firewall create --name $firewallName --resource-group $rgName --location $location

# Create public IP address
az network public-ip create --name $publicIPName --resource-group $rgName --location $location --sku "Standard" --allocation-method "Static"

# Assign public IP address to Azure Firewall in VNet1
az network firewall ip-config create --firewall-name $firewallName --name "AzureFirewallIpConfig" --public-ip-address $publicIPName --resource-group $rgName --vnet-name $vnetName1 --subnet $subnetName1


# Define network rules
az network firewall network-rule create --firewall-name $firewallName --collection-name "allow_vnet1_to_vnet2" --priority 100 \
    --resource-group $rgName --action Allow --name "allow_vnet1_to_vnet2" \
    --source-addresses "<vnet1AddressSpace>" --destination-addresses "<vnet2AddressSpace>" \
    --destination-ports "<portsToAllow>" --protocols "<protocolsToAllow>"

az network firewall network-rule create --firewall-name $firewallName --collection-name "allow_vnet2_to_vnet1" --priority 101 \
    --resource-group $rgName --action Allow --name "allow_vnet2_to_vnet1" \
    --source-addresses "<vnet2AddressSpace>" --destination-addresses "<vnet1AddressSpace>" \
    --destination-ports "<portsToAllow>" --protocols "<protocolsToAllow>"

# Deny all other traffic by default
az network firewall network-rule collection add --firewall-name $firewallName --collection-name "DefaultRule" --priority 110 \
    --resource-group $rgName --action Deny --name "DenyAll"
