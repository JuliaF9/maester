BeforeAll {
    . $PSScriptRoot/Test-GuestUserAccess.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.1.6.2", "Security" {
    It "CUSTOM.CIS.M365.5.1.6.2: Ensure guest user access is restricted" {

        $result = Test-GuestUserAccess

        if ($null -ne $result) {
            $result | Should -Be $true -Because "guest user access is restricted."
        }
    }
}