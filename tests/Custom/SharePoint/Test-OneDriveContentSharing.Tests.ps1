BeforeAll {
    . $PSScriptRoot/Test-OneDriveContentSharing.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.4", "Security" {
    It "CUSTOM.CIS.M365.7.2.4: Ensure OneDrive content sharing is restricted" {

        $result = Test-OneDriveContentSharing

        if ($null -ne $result) {
            $result | Should -Be $true -Because "OneDrive content sharing is restricted."
        }
    }
}