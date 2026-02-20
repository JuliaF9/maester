BeforeAll {
    . $PSScriptRoot/Test-CreateSecurityGroups.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.1.3.2", "Security" {
    It "CUSTOM.CIS.M365.5.1.3.2: Ensure users cannot create security groups" {

        $result = Test-CreateSecurityGroups

        if ($null -ne $result) {
            $result | Should -Be $true -Because "users cannot create security groups."
        }
    }
}