#Run the following command in Cloud Shell to obtain the resource ID of the virtual machine you previously created:
    VMID=$(az vm show \
        --resource-group [sandbox resource group name] \
        --name vm1 \
        --query id \
        --output tsv)


#Run the following command to create a new metric alert that will be triggered when the VM CPU is greater than 80 percent.
        az monitor metrics alert create 
        -n "Cpu80PercentAlert" 
        --resource-group [ resource group name] 
        --scopes $VMID --condition "max percentage CPU > 80" 
        --description "Virtual machine is running at or greater than 80% CPU utilization" 
        --evaluation-frequency 1m 
        --window-size 1m 
        --severity 3