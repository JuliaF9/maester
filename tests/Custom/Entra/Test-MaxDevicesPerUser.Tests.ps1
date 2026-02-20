BeforeAll {
    . $PSScriptRoot/Test-MaxDevicesPerUser.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.1.4.2", "Security" {
    It "CUSTOM.CIS.M365.5.1.4.2: Ensure the maximum number of devices per user is limited" {

        $result = Test-MaxDevicesPerUser

        if ($null -ne $result) {
            $result | Should -Be $true -Because "the maximum number of devices per user is set to 20 or less."
        }
    }
}