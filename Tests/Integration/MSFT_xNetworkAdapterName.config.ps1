$TestAdapter = [PSObject]@{
    InterfaceAlias          = (Get-NetAdapter -Physical | Select-Object -First 1).Name
    PhysicalMediaType       = '802.3'
    Status                  = 'Up'
}


configuration MSFT_xNetworkAdapterName_Config {
    Import-DscResource -ModuleName xNetworking
    node localhost {
        xNetworkAdapterName Integration_Test {
            Name                    = $TestAdapter.InterfaceAlias
            PhysicalMediaType       = $TestAdapter.PhysicalMediaType
            Status                  = $TestAdapter.Status
        }
    }
}
