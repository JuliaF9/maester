BeforeAll {
    . $PSScriptRoot/Test-ExternalMeetingChat.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.8.5.8", "Security" {
    It "CUSTOM.CIS.M365.8.5.8: Ensure external meeting chat is off" {

        $result = Test-ExternalMeetingChat

        if ($null -ne $result) {
            $result | Should -Be $true -Because "no user is allowed to chat in external meetings."
        }
    }
}