BeforeAll {
    . $PSScriptRoot/Test-ThirdPartyStorageServices.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.1.3.7", "Security" {
    It "CUSTOM.CIS.M365.1.3.7: Ensure 'third-party storage services' are restricted in 'Microsoft 365 on the web'" {


        $result = Test-ThirdPartyStorageServices

        if ($null -ne $result) {
            $result | Should -Be $true -Because "'third-party storage services' are restricted in 'Microsoft 365 on the web'."
        }
    }
}