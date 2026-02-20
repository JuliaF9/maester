<#
.SYNOPSIS
    Checks if MailTips are enabled for end users

.DESCRIPTION
    Ensure MailTips are enabled for end users
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-MailTips

    Returns true if 'MailTipsAllTipsEnabled', 'MailTipsExternalRecipientsTipsEnabled', 'MailTipsGroupMetricsEnabled' is set to true and 'MailTipsLargeAudienceThreshold' is set to 25
#>

function Test-MailTips {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection ExchangeOnline)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedExchange
        return $null
    }


    Write-Verbose "Test-MailTips: Testing if MailTips are enabled for end users."
    try {
        $ExoPolicyAllTips = Get-OrganizationConfig | Select-Object -ExpandProperty MailTipsAllTipsEnabled
        $ExoPolicyRecipientsTips = Get-OrganizationConfig | Select-Object -ExpandProperty MailTipsExternalRecipientsTipsEnabled
        $ExoPolicyGroupMetrics = Get-OrganizationConfig | Select-Object -ExpandProperty MailTipsGroupMetricsEnabled
        $ExoPolicyAudienceThreshold = Get-OrganizationConfig | Select-Object -ExpandProperty MailTipsLargeAudienceThreshold

        $testResult = $ExoPolicyAllTips -eq $true -and $ExoPolicyRecipientsTips -eq $true -and $ExoPolicyGroupMetrics -eq $true -and $ExoPolicyAudienceThreshold -eq 25

        if ($testResult) {
            $testResultMarkdown = "Well done. MailTips are enabled for end users."
        } else {
            $testResultMarkdown = "MailTips are still disabled for end users.`n 'MailTipsAllTipsEnabled' is set to $($ExoPolicy1)"
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}

