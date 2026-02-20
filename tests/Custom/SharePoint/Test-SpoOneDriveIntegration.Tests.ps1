BeforeAll {
    . $PSScriptRoot/Test-SpoOneDriveIntegration.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.2", "Security" {
    It "CUSTOM.CIS.M365.7.2.2: Ensure SharePoint and OneDrive integration with Azure AD B2B is enabled" {

        $result = Test-SpoOneDriveIntegration

        if ($null -ne $result) {
            $result | Should -Be $true -Because "Sharepoint and Onedrive integration with Azure AD B2B is enabled."
        }
    }
}