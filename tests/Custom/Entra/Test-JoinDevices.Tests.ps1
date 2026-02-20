BeforeAll {
    . $PSScriptRoot/Test-JoinDevices.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.1.4.1", "Security" {
    It "CUSTOM.CIS.M365.5.1.4.1: Ensure the ability to join devices to Entra is restricted" {

        $result = Test-JoinDevices

        if ($null -ne $result) {
            $result | Should -Be $true -Because "the ability to join devices to Entra is restricted."
        }
    }
}