BeforeAll {
    . $PSScriptRoot/Test-InfectedFiles.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.3.1", "Security" {
    It "CUSTOM.CIS.M365.7.3.1: Ensure Office 365 SharePoint infected files are disallowed for download" {

        $result = Test-InfectedFiles

        if ($null -ne $result) {
            $result | Should -Be $true -Because "Office 365 SharePoint infected files are disallowed for download."
        }
    }
}