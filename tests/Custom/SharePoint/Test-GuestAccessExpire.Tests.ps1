BeforeAll {
    . $PSScriptRoot/Test-GuestAccessExpire.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.7.2.9", "Security" {
    It "CUSTOM.CIS.M365.7.2.9: Ensure guest access to a site or OneDrive will expire automatically" {

        $result = Test-GuestAccessExpire

        if ($null -ne $result) {
            $result | Should -Be $true -Because "Ensure guest access to a site or OneDrive will expire automatically."
        }
    }
}