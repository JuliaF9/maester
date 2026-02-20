BeforeAll {
    . $PSScriptRoot/Test-ExternalContentSharing.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.3", "Security" {
    It "CUSTOM.CIS.M365.7.2.3: Ensure external content sharing is restricted" {

        $result = Test-ExternalContentSharing

        if ($null -ne $result) {
            $result | Should -Be $true -Because "external content sharing is restricted."
        }
    }
}