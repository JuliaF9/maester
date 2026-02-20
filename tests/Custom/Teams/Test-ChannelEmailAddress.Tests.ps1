BeforeAll {
    . $PSScriptRoot/Test-ChannelEmailAddress.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.8.1.2", "Security" {
    It "CUSTOM.CIS.M365.8.1.2: Ensure users can't send emails to a channel email address" {

        $result = Test-ChannelEmailAddress

        if ($null -ne $result) {
            $result | Should -Be $true -Because "no user is allowed to send emails from a channel email address."
        }
    }
}