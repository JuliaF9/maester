BeforeAll {
    . $PSScriptRoot/Test-MeetingChatAnonymous.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.8.5.5", "Security" {
    It "CUSTOM.CIS.M365.8.5.5: Ensure meeting chat does not allow anonymous users" {

        $result = Test-MeetingChatAnonymous

        if ($null -ne $result) {
            $result | Should -Be $true -Because "no user is allowed to chat in meetings."
        }
    }
}
