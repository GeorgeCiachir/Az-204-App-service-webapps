############################################ Login ############################################
Connect-AzAccount -SubscriptionName 'TestAccount'

############################################ Verify I'm using the correct subscription ############################################
Set-AzContext -SubscriptionName 'TestAccount'

############################################ Create a resource group if necessary ############################################
$resourceGroup = "Creating-Web-Apps"
$location = "westeurope"
New-AzResourceGroup -Name $resourceGroup -Location $location

############################################ Create an AppServicePlan ############################################
$appName = "greeting-app"

New-AzAppServicePlan `
    -Name $appName `
    -Location $location `
    -ResourceGroupName $resourceGroup `
    -Tier S1

############################################ Create a web app ############################################
New-AzWebApp `
    -Name $appName `
    -Location $location `
    -AppServicePlan $appName `
    -ResourceGroupName $resourceGroup
