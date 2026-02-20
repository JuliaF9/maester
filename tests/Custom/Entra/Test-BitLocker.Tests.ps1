BeforeAll {
    . $PSScriptRoot/Test-BitLocker.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.1.4.6", "Security" {
    It "CUSTOM.CIS.M365.5.1.4.6: Ensure users are restricted from recovering BitLocker keys" {

        $result = Test-BitLocker

        if ($null -ne $result) {
            $result | Should -Be $true -Because "users are restricted from recovering BitLocker keys."
        }
    }
}