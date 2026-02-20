BeforeAll {
    . $PSScriptRoot/Test-Reauthentication.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.10", "Security" {
    It "CUSTOM.CIS.M365.7.2.10: Ensure reauthentication with verification code is restricted" {

        $result = Test-Reauthentication

        if ($null -ne $result) {
            $result | Should -Be $true -Because "reauthentication with verification code is restricted."
        }
    }
}