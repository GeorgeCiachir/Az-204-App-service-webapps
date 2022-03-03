# Define resource group name
$resourceGroup="Creating-Web-Apps"
$location = "westeurope"

# Login to Azure
az login
az account set --subscription "TestAccount"

# List the current resource groups table format
az group list --output table

# Create a resource group if needed
az group create `
    --name $resourceGroup `
    --location $location

#################################################### ARM template - Deploying a container using ARM template
New-AzResourceGroupDeployment `
    -Name "AppServiceWebApps" `
    -ResourceGroupName $resourceGroup `
    -TemplateFile './template/webapp-template.json' `
    -TemplateParameterFile './template/webapp-parameters.json'