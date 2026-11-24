siteConfig: {
  windowsFxVersion: 'DOTNETCORE|8.0'
  // or for classic .NET Framework style:
  // netFrameworkVersion: 'v8.0'
  appSettings: [
    {
      name: 'ASPNETCORE_ENVIRONMENT'
      value: 'Development'
    }
    {
      name: 'UseOnlyInMemoryDatabase'
      value: 'true'
    }
  ]
}
