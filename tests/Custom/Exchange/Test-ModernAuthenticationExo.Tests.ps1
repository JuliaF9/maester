BeforeAll {
    . $PSScriptRoot/Test-ModernAuthenticationExo.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.6.5.1", "Security" {
    It "CUSTOM.CIS.M365.6.5.1: Ensure modern authentication for Exchange Online is enabled" {

        $result = Test-ModernAuthenticationExo

        if ($null -ne $result) {
            $result | Should -Be $true -Because "modern authentication for Exchange Online is enabled."
        }
    }
}