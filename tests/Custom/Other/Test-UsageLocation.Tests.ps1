BeforeAll {
    . $PSScriptRoot/Test-UsageLocation.ps1
}

Describe "Custom" -Tag "CUSTOM.M365.001", "Security" {
    It "CUSTOM.M365.001: Ensure all users have UsageLocation set to 'DE'" {

        $result = Test-UsageLocation

        if ($null -ne $result) {
            $result | Should -Be $true -Because "all users have set UsageLocation to the required location."
        }
    }
}

