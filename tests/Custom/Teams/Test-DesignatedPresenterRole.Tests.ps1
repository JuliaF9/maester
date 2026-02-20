BeforeAll {
    . $PSScriptRoot/Test-DesignatedPresenterRole.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.8.5.6", "Security" {
    It "CUSTOM.CIS.M365.8.5.6: Ensure only organizers and co-organizers can present" {

        $result = Test-DesignatedPresenterRole

        if ($null -ne $result) {
            $result | Should -Be $true -Because "only organizers and co-organizers can present."
        }
    }
}