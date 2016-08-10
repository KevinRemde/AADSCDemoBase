#!/bin/bash

# Set globals here before running the script

# PublishSettingsFileLocation="./AzureSub.publishsettings" 
SubscriptionName="KevRem Azure"
rgName="rgtest"
assetLocation="https://raw.githubusercontent.com/KevinRemde/AADSCDemoBase/master/"
templateFileURI=$assetLocation"azuredeploy.json"
templateFilePath="./azuredeploy.json"
parmFilePath="./azuredeploy.parameters.json"

# Add Azure account
# azure account import $PublishSettingsFileLocation

# Do the interactive login instead
azure login

# Set the Azure account you want to use
azure account set "$SubscriptionName"

# Set ARM mode
azure config mode ARM

# Create the Resource Group
azure group create -n $rgName -l "West US"

# Deploy!
#azure group deployment create $rgName -n testRGDeploy -e $parmFilePath -f $templateFilePath  
azure group deployment create $rgName -n testRGDeploy -e $parmFilePath --template-uri $templateFileURI 

# Delete the whole RG
#azure group delete rgtest 