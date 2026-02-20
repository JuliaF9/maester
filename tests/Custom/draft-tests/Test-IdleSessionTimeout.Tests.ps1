BeforeAll {
    . $PSScriptRoot/Test-IdleSessionTimeout.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.1.3.2", "Security" {
    It "CUSTOM.CIS.M365.1.3.2: Ensure 'Idle session timeout' is set to '3 hours (or less)' for unmanaged devices" {

        $result = Test-IdleSessionTimeout

        if ($null -ne $result) {
            $result | Should -Be $true -Because "'Idle session timeout' is set to '3 hours (or less)' for unmanaged devices."
        }
    }
}