BeforeAll {
    . $PSScriptRoot/Test-MeetingRecording.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.8.5.9", "Security" {
    It "CUSTOM.CIS.M365.8.5.9: Ensure meeting recording is off by default" {

        $result = Test-MeetingRecording

        if ($null -ne $result) {
            $result | Should -Be $true -Because "no user is allowed to record meetings."
        }
    }
}

