# Set variables
rgName="RG-LAB"
location="eastus"
firewallName="AZFirewall"

vnetName1="VNet1"
vnetName2="VNet2"
subnetName1="AZFirewallSubnet"
subnetName2="AZFirewallSubnet" # Assuming the subnet name is the same in both VNets
publicIPName="PublicIP"

# Create resource group
az group create --name $rgName --location $location

# Create Azure Firewall
az network firewall create --name $firewallName --resource-group $rgName --location $location

# Create public IP address
az network public-ip create --name $publicIPName --resource-group $rgName --location $location --sku "Standard" --allocation-method "Static"

# Assign public IP address to Azure Firewall in VNet1
az network firewall ip-config create --firewall-name $firewallName --name "AzureFirewallIpConfig" --public-ip-address $publicIPName --resource-group $rgName --vnet-name $vnetName1 --subnet $subnetName1


# Create resource group
az group create --name $rgName --location $location

# Create Azure Firewall
az network firewall create --name $firewallName --resource-group $rgName --location $location

# Create public IP address
az network public-ip create --name $publicIPName --resource-group $rgName --location $location --sku "Standard" --allocation-method "Static"

# Assign public IP address to Azure Firewall
az network firewall ip-config create --firewall-name $firewallName --name "AzureFirewallIpConfig" --public-ip-address $publicIPName --resource-group $rgName --vnet-name $vnetName1 --subnet $subnetName1





