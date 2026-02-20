BeforeAll {
    . $PSScriptRoot/Test-SystemPreferredMFA.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.2.3.6", "Security" {
    It "CUSTOM.CIS.M365.5.2.3.6: Ensure system-preferred multifactor authentication is enabled" {

        $result = Test-SystemPreferredMFA

        if ($null -ne $result) {
            $result | Should -Be $true -Because "system-preferred multifactor authentication is enabled."
        }
    }
}