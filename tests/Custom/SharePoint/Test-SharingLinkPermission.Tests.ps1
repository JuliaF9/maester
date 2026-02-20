BeforeAll {
    . $PSScriptRoot/Test-SharingLinkPermission.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.11", "Security" {
    It "CUSTOM.CIS.M365.7.2.11: Ensure the SharePoint default sharing link permission is set" {

        $result = Test-SharingLinkPermission

        if ($null -ne $result) {
            $result | Should -Be $true -Because "the SharePoint default sharing link permission is set."
        }
    }
}