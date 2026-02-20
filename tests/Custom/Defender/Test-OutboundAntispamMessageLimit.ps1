<#
.SYNOPSIS
    Checks outbound anti-spam message limits

.DESCRIPTION
    Ensure outbound anti-spam message limits are in place
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-OutboundAntispamMessageLimit

    Returns true if 'RecipientLimitExternalPerHour', 'RecipientLimitInternalPerHour', 'RecipientLimitPerDay' are set to 0 and 'ActionWhenThresholdReached' is set to 'BlockUserForToday'
#>

function Test-OutboundAntispamMessageLimit {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection ExchangeOnline)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedExchange
        return $null
    }

    Write-Verbose 'Test-OutboundAntispamMessageLimit: Testing if outbound anti-spam message limits are in place.'
    try {
        $ExoPolicyRLE = Get-HostedOutboundSpamFilterPolicy -Identity Default | Select-Object -ExpandProperty RecipientLimitExternalPerHour
        $ExoPolicyRLI = Get-HostedOutboundSpamFilterPolicy -Identity Default | Select-Object -ExpandProperty RecipientLimitInternalPerHour
        $ExoPolicyRL = Get-HostedOutboundSpamFilterPolicy -Identity Default | Select-Object -ExpandProperty RecipientLimitPerDay
        $ExoPolicyThreshold = Get-HostedOutboundSpamFilterPolicy -Identity Default | Select-Object -ExpandProperty ActionWhenThresholdReached

        $testResult = $ExoPolicyRLE -eq 0 -and $ExoPolicyRLI -eq 0 -and $ExoPolicyRL -eq 0 -and $ExoPolicyThreshold -eq 'BlockUserForToday'

        if ($testResult) {
            $testResultMarkdown = 'Well done. Outbound anti-spam message limits are in place.'
            return $true
        } else {
            $testResultmarkdown = "Outbound anti-spam message limits are still not in place, the setting is set to: '$($ExchangeMeetingPolicy)'."
            return $false
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}



