BeforeAll {
    . $PSScriptRoot/Test-AuditDisabled.ps1
}


Describe "Custom" -Tag "CUSTOM.CIS.M365.6.1.1", "Security" {
    It "CUSTOM.CIS.M365.6.1.1: Ensure 'AuditDisabled' organizationally is set to 'False'" {

        $result = Test-AuditDisabled

        if ($null -ne $result) {
            $result | Should -Be $true -Because "'AuditDisabled' organizationally is set to 'False'."
        }
    }
}