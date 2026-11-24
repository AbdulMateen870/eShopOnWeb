param appserviceName string = 'dxcapplication'
param location string = 'westus3'

var suffix = uniqueString(resourceGroup().id)

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
	name: 'asp-${suffix}'
	location: location
	kind: 'windows'
	sku: {
		name: 'P1v3'
		tier: 'PremiumV3'
		capacity: 1
	}
	properties: {
		reserved: false
	}
}

resource appService 'Microsoft.Web/sites@2023-12-01' = {
	name: appserviceName
	location: location
	kind: 'app'
	properties: {
		serverFarmId: appServicePlan.id
		httpsOnly: true
		siteConfig: {
			alwaysOn: true
			minTlsVersion: '1.2'
			windowsFxVersion: 'DOTNETCORE|8.0'
		}
	}
}

output appServiceName string = appService.name
output appServiceUrl string = 'https://${appService.properties.defaultHostName}'
