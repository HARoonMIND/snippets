az vm create \
  --resource-group learn-7b9d90b7-8ed7-47ff-9c7c-bc5218f6bb30 \
  --name my-vm \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys



az vm create --resource-group TutorialResources \
  --name TutorialVM1 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose 
  Confirm that the VM is running by connecting over SSH.

IPADDRESS="$(az vm list-ip-addresses \
  --resource-group learn \
  --name my-VM \
  --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
  --output tsv)"



az vm run-command invoke \
   -g learn \
   -n my-VM \
   --command-id RunShellScript \
   --scripts "sudo apt-get update && sudo apt-get install -y nginx"

Connect VM in Azure :
ssh haroonmind@52.172.237.116
Password
Khan4504002!

Mysql :khan4504002

ALTER USER 'haroonmind'@52.172.237.116 IDENTIFIED WITH mysql_native_password by 'Khan4504002!';
CREATE USER 'haroonmind'@'52.172.237.116' IDENTIFIED WITH authentication_plugin BY 'Khan4504002!';
az vm open-port --port 80 --resource-group learn --name my-VM

az network nsg list \
  --resource-group learn \
  --query '[].name' \
  --output tsv

az network nsg rule list \
  --resource-group learn \
  --nsg-name my-VM-nsg


  az network nsg rule list \
  --resource-group learn \
  --nsg-name my-VM-nsg \
  --query '[].{Name:name, Priority:priority, Port:destinationPortRange, Access:access}' \
  --output table


az network nsg rule create \
  --resource-group learn \
  --nsg-name my-VM-nsg \
  --name allow-http \
  --protocol tcp \
  --priority 100 \
  --destination-port-range 80 \
  --access Allow

  {
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "location": {
            "type": "string"
        },
        "networkInterfaceName": {
            "type": "string"
        },
        "networkSecurityGroupName": {
            "type": "string"
        },
        "networkSecurityGroupRules": {
            "type": "array"
        },
        "subnetName": {
            "type": "string"
        },
        "virtualNetworkName": {
            "type": "string"
        },
        "addressPrefixes": {
            "type": "array"
        },
        "subnets": {
            "type": "array"
        },
        "publicIpAddressName": {
            "type": "string"
        },
        "publicIpAddressType": {
            "type": "string"
        },
        "publicIpAddressSku": {
            "type": "string"
        },
        "pipDeleteOption": {
            "type": "string"
        },
        "virtualMachineName": {
            "type": "string"
        },
        "virtualMachineComputerName": {
            "type": "string"
        },
        "virtualMachineRG": {
            "type": "string"
        },
        "osDiskType": {
            "type": "string"
        },
        "osDiskDeleteOption": {
            "type": "string"
        },
        "dataDisks": {
            "type": "array"
        },
        "dataDiskResources": {
            "type": "array"
        },
        "virtualMachineSize": {
            "type": "string"
        },
        "nicDeleteOption": {
            "type": "string"
        },
        "adminUsername": {
            "type": "string"
        },
        "adminPassword": {
            "type": "secureString"
        }
    },
    "variables": {
        "nsgId": "[resourceId(resourceGroup().name, 'Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupName'))]",
        "vnetName": "[parameters('virtualNetworkName')]",
        "vnetId": "[resourceId(resourceGroup().name,'Microsoft.Network/virtualNetworks', parameters('virtualNetworkName'))]",
        "subnetRef": "[concat(variables('vnetId'), '/subnets/', parameters('subnetName'))]"
    },
    "resources": [
        {
            "name": "[parameters('networkInterfaceName')]",
            "type": "Microsoft.Network/networkInterfaces",
            "apiVersion": "2021-03-01",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[concat('Microsoft.Network/networkSecurityGroups/', parameters('networkSecurityGroupName'))]",
                "[concat('Microsoft.Network/virtualNetworks/', parameters('virtualNetworkName'))]",
                "[concat('Microsoft.Network/publicIpAddresses/', parameters('publicIpAddressName'))]"
            ],
            "properties": {
                "ipConfigurations": [
                    {
                        "name": "ipconfig1",
                        "properties": {
                            "subnet": {
                                "id": "[variables('subnetRef')]"
                            },
                            "privateIPAllocationMethod": "Dynamic",
                            "publicIpAddress": {
                                "id": "[resourceId(resourceGroup().name, 'Microsoft.Network/publicIpAddresses', parameters('publicIpAddressName'))]",
                                "properties": {
                                    "deleteOption": "[parameters('pipDeleteOption')]"
                                }
                            }
                        }
                    }
                ],
                "networkSecurityGroup": {
                    "id": "[variables('nsgId')]"
                }
            }
        },
        {
            "name": "[parameters('networkSecurityGroupName')]",
            "type": "Microsoft.Network/networkSecurityGroups",
            "apiVersion": "2019-02-01",
            "location": "[parameters('location')]",
            "properties": {
                "securityRules": "[parameters('networkSecurityGroupRules')]"
            }
        },
        {
            "name": "[parameters('virtualNetworkName')]",
            "type": "Microsoft.Network/virtualNetworks",
            "apiVersion": "2021-01-01",
            "location": "[parameters('location')]",
            "properties": {
                "addressSpace": {
                    "addressPrefixes": "[parameters('addressPrefixes')]"
                },
                "subnets": "[parameters('subnets')]"
            }
        },
        {
            "name": "[parameters('publicIpAddressName')]",
            "type": "Microsoft.Network/publicIpAddresses",
            "apiVersion": "2020-08-01",
            "location": "[parameters('location')]",
            "properties": {
                "publicIpAllocationMethod": "[parameters('publicIpAddressType')]"
            },
            "sku": {
                "name": "[parameters('publicIpAddressSku')]"
            }
        },
        {
            "name": "[parameters('dataDiskResources')[copyIndex()].name]",
            "type": "Microsoft.Compute/disks",
            "apiVersion": "2022-03-02",
            "location": "[parameters('location')]",
            "properties": "[parameters('dataDiskResources')[copyIndex()].properties]",
            "sku": {
                "name": "[parameters('dataDiskResources')[copyIndex()].sku]"
            },
            "copy": {
                "name": "managedDiskResources",
                "count": "[length(parameters('dataDiskResources'))]"
            }
        },
        {
            "name": "[parameters('virtualMachineName')]",
            "type": "Microsoft.Compute/virtualMachines",
            "apiVersion": "2022-03-01",
            "location": "[parameters('location')]",
            "dependsOn": [
                "managedDiskResources",
                "[concat('Microsoft.Network/networkInterfaces/', parameters('networkInterfaceName'))]"
            ],
            "properties": {
                "hardwareProfile": {
                    "vmSize": "[parameters('virtualMachineSize')]"
                },
                "storageProfile": {
                    "osDisk": {
                        "createOption": "fromImage",
                        "managedDisk": {
                            "storageAccountType": "[parameters('osDiskType')]"
                        },
                        "diskSizeGB": 30,
                        "deleteOption": "[parameters('osDiskDeleteOption')]"
                    },
                    "imageReference": {
                        "publisher": "canonical",
                        "offer": "0001-com-ubuntu-server-focal",
                        "sku": "20_04-lts-gen2",
                        "version": "latest"
                    },
                    "copy": [
                        {
                            "name": "dataDisks",
                            "count": "[length(parameters('dataDisks'))]",
                            "input": {
                                "lun": "[parameters('dataDisks')[copyIndex('dataDisks')].lun]",
                                "createOption": "[parameters('dataDisks')[copyIndex('dataDisks')].createOption]",
                                "caching": "[parameters('dataDisks')[copyIndex('dataDisks')].caching]",
                                "diskSizeGB": "[parameters('dataDisks')[copyIndex('dataDisks')].diskSizeGB]",
                                "managedDisk": {
                                    "id": "[coalesce(parameters('dataDisks')[copyIndex('dataDisks')].id, if(equals(parameters('dataDisks')[copyIndex('dataDisks')].name, json('null')), json('null'), resourceId('Microsoft.Compute/disks', parameters('dataDisks')[copyIndex('dataDisks')].name)))]",
                                    "storageAccountType": "[parameters('dataDisks')[copyIndex('dataDisks')].storageAccountType]"
                                },
                                "deleteOption": "[parameters('dataDisks')[copyIndex('dataDisks')].deleteOption]",
                                "writeAcceleratorEnabled": "[parameters('dataDisks')[copyIndex('dataDisks')].writeAcceleratorEnabled]"
                            }
                        }
                    ]
                },
                "networkProfile": {
                    "networkInterfaces": [
                        {
                            "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceName'))]",
                            "properties": {
                                "deleteOption": "[parameters('nicDeleteOption')]"
                            }
                        }
                    ]
                },
                "osProfile": {
                    "computerName": "[parameters('virtualMachineComputerName')]",
                    "adminUsername": "[parameters('adminUsername')]",
                    "adminPassword": "[parameters('adminPassword')]",
                    "linuxConfiguration": {
                        "patchSettings": {
                            "patchMode": "ImageDefault"
                        }
                    }
                },
                "diagnosticsProfile": {
                    "bootDiagnostics": {
                        "enabled": true
                    }
                }
            }
        }
    ],
    "outputs": {
        "adminUsername": {
            "type": "string",
            "value": "[parameters('adminUsername')]"
        }
    }
}