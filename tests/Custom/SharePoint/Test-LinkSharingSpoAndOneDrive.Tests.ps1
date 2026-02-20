BeforeAll {
    . $PSScriptRoot/Test-LinkSharingSpoAndOneDrive.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.7", "Security" {
    It "CUSTOM.CIS.M365.7.2.7: Ensure link sharing is restricted in SharePoint and OneDrive" {

        $result = Test-LinkSharingSpoAndOneDrive

        if ($null -ne $result) {
            $result | Should -Be $true -Because "link sharing is restricted in SharePoint and OneDrive."
        }
    }
}