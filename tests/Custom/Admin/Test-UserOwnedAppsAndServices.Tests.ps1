BeforeAll {
    . $PSScriptRoot/Test-UserOwnedAppsAndServices.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.1.3.4", "Security" {
    It "CUSTOM.CIS.M365.1.3.4: Ensure 'User owned apps and services' is restricted" {

        $result = Test-UserOwnedAppsAndServices

        if ($null -ne $result) {
            $result | Should -Be $true -Because "'User owned apps and services' is restricted."
        }
    }
}