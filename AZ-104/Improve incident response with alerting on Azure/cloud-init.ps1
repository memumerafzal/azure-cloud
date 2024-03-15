cat <<EOF > cloud-init.txt
#cloud-config
package_upgrade: true
packages:
- stress
runcmd:
- sudo stress --cpu 1
EOF



az vm create --resource-group [resource group name] --name vm1 --location eastUS --image Ubuntu2204 --custom-data cloud-init.txt --generate-ssh-keys