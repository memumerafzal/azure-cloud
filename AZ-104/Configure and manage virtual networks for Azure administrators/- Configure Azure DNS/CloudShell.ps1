az account show --output table

az account set --subscription "Azure subscription 1"

PS /home/kevin> az account set --subscription "Azure subscription 1"
PS /home/kevin> $RGName = "MEDomainServices-RG"
PS /home/kevin> New-AzResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile azuredeploy.json -TemplateParameterFile azuredeploy.parameters.json