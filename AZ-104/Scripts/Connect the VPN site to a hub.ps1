Connect your VPN site to the hub site-to-site VPN gateway using the New-AzVpnConnection cmdlet.

Before running the command, you may need to redeclare the following variables:
Azure PowerShell

$virtualWan = Get-AzVirtualWAN -ResourceGroupName "TestRG" -Name "TestVWAN1"

$vpnGateway = Get-AzVpnGateway -ResourceGroupName "TestRG" -Name "vpngw1"

$vpnSite = Get-AzVpnSite -ResourceGroupName "TestRG" -Name "TestSite1"

Connect the VPN site to the hub.
Azure PowerShell

New-AzVpnConnection -ResourceGroupName $vpnGateway.ResourceGroupName -ParentResourceName $vpnGateway.Name -Name "testConnection" -VpnSite $vpnSite -VpnSiteLinkConnection @($vpnSiteLinkConnection1, $vpnSiteLinkConnection2)