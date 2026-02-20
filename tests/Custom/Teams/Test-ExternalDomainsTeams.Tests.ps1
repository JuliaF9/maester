BeforeAll {
    . $PSScriptRoot/Test-ExternalDomainTeams.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.8.2.1", "Security" {
    It "CUSTOM.CIS.M365.8.2.1: Ensure external domains are restricted in the Teams admin center" {

        $result = Test-ExternalDomainTeams

        if ($null -ne $result) {
            $result | Should -Be $true -Because "external domains are restricted in the Teams admin center."
        }
    }
}