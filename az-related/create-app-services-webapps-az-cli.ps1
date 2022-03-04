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


# Create an AppServicePlan
# in this case I am creating an AppServicePlan based on Linux VMs
$appName = "greeting-app"

az appservice plan create `
    --name $appName `
    --resource-group $resourceGroup `
    --sku s1 `
    --is-linux

# In order to get the available runtime for Linux, run this command:
az webapp list-runtimes --linux

# then pick a runtime and pass it as an argument below
# it is really important to replace the "|" symbol with ":", because of how it gets parsed by powershell
# Example : JAVA|11-java11 -> JAVA:11-java11

az webapp create `
    --resource-group $resourceGroup `
    --plan $appName `
    --name $appName `
    --runtime "JAVA:11-java11"


# retrieve stream application log
az webapp log tail `
    --name $appName `
    --resource-group $resourceGroup