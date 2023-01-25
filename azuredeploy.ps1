$SCSDK = "Path to Sitecore Azure Toolkit"

$SCTemplates = "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%2010.2.0/XP"

$ResourceGroup = "Microsoft Azure Resource Group name"

$LicenseFile = "Path to the Sitecore license.xml file"

$SubscriptionId = "Microsoft Azure SubscriptionId"

$Location = "Target location of deployment"

$ParamFile = "Path to filled-in azuredeploy.parameters.json file"

Import-Module $SCSDK\tools\Sitecore.Cloud.Cmdlets.psm1

Import-Module Az.Accounts

Connect-AzAccount

Set-AzContext -SubscriptionId $SubscriptionId

Start-SitecoreAzureDeployment -Name $ResourceGroup -Location $Location -ArmTemplateUrl "$SCTemplates/azuredeploy.json" -ArmParametersPath $ParamFile -LicenseXmlPath $LicenseFile -Verbose