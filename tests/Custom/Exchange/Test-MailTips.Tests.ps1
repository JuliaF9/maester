BeforeAll {
    . $PSScriptRoot/Test-MailTips.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.6.5.2", "Security" {
    It "CUSTOM.CIS.M365.6.5.2: Ensure MailTips are enabled for end users" {


        $result = Test-MailTips

        if ($null -ne $result) {
            $result | Should -Be $true -Because "MailTips are enabled for end users."
        }
    }
}