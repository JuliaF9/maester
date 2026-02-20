BeforeAll {
    . $PSScriptRoot/Test-SharePointGuestUsers.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.5", "Security" {
    It "CUSTOM.CIS.M365.7.2.5: Ensure that SharePoint guest users cannot share items they don't own" {

        $result = Test-SharePointGuestUsers

        if ($null -ne $result) {
            $result | Should -Be $true -Because "SharePoint guest users cannot share items they don't own."
        }
    }
}