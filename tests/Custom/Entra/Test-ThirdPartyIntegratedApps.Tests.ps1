BeforeAll {
    . $PSScriptRoot/Test-ThirdPartyIntegratedApps.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.1.2.2", "Security" {
    It "CUSTOM.CIS.M365.5.1.2.2: Ensure third party integrated applications are not allowed" {

        $result = Test-ThirdPartyIntegratedApps

        if ($null -ne $result) {
            $result | Should -Be $true -Because "third party integrated applications are not allowed."
        }
    }
}