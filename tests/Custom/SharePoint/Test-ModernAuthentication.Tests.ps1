BeforeAll {
    . $PSScriptRoot/Test-ModernAuthentication.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.1", "Security" {
    It "CUSTOM.CIS.M365.7.2.1: Ensure modern authentication for SharePoint applications is required" {

        $result = Test-ModernAuthentication

        if ($null -ne $result) {
            $result | Should -Be $true -Because "modern authentication for SharePoint applications is required."
        }
    }
}