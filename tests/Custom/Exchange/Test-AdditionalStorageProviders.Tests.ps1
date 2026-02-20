BeforeAll {
    . $PSScriptRoot/Test-AdditionalStorageProviders.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.6.5.3", "Security" {
    It "CUSTOM.CIS.M365.6.5.3: Ensure additional storage providers are restricted in Outlook on the web" {

        $result = Test-AdditionalStorageProviders

        if ($null -ne $result) {
            $result | Should -Be $true -Because "additional storage providers are restricted in Outlook on the web."
        }
    }
}