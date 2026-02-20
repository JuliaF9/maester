BeforeAll {
    . $PSScriptRoot/Test-DLPPolicyEnabled.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.3.2.2", "Security" {
    It "CUSTOM.CIS.M365.3.2.2: Ensure DLP policies are enabled for Microsoft Teams" {

        $result = Test-DLPPolicyEnabled

        if ($null -ne $result) {
            $result | Should -Be $true -Because "DLP policies are enabled for Microsoft Teams."
        }
    }
}