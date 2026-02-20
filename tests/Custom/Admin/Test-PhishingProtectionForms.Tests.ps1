BeforeAll {
    . $PSScriptRoot/Test-PhishingProtectionForms.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.1.3.5", "Security" {
    It "CUSTOM.CIS.M365.1.3.5: Ensure internal phishing protection for Forms is enabled" {

        $result = Test-PhishingProtectionForms

        if ($null -ne $result) {
            $result | Should -Be $true -Because "internal phishing protection for Forms is enabled."
        }
    }
}