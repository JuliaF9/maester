BeforeAll {
    . $PSScriptRoot/Test-CreateTenants.ps1
}

Describe "Custom" -Tag "CUSTOM.CIS.M365.5.1.2.3", "Security" {
    It "CUSTOM.CIS.M365.5.1.2.3: Ensure 'Restrict non-admin users from creating tenants' is set to 'Yes'" {

        $result = Test-CreateTenants

        if ($null -ne $result) {
            $result | Should -Be $true -Because "'Restrict non-admin users from creating tenants' is set to 'Yes'."
        }
    }
}