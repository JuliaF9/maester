BeforeAll {
    . $PSScriptRoot/Test-OutboundAntispamMessageLimit.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.2.1.15", "Security" {
    It "CUSTOM.CIS.M365.2.1.15: Ensure outbound anti-spam message limits are in place" {

        $result = Test-OutboundAntispamMessageLimit

        if ($null -ne $result) {
            $result | Should -Be $true -Because "outbound anti-spam message limits are in place."
        }
    }
}