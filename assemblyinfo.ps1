Param($fileFilter,
	  $lpath,
	  $buildnum)
$files = Get-ChildItem $lpath -recurse -filter $fileFilter -name

Foreach ($file in $files)
{
        $file = $lpath + "\" + $file

        $fileObject=get-item $file
		
		if(!$fileObject.PSIsContainer)
		{
	        $fileObject.Set_IsReadOnly($False)

	        $sr = new-object System.IO.StreamReader( $file, [System.Text.Encoding]::GetEncoding("utf-8") ) 
	        $content = $sr.ReadToEnd()
	        $sr.Close()

	        $content = [Regex]::Replace( $content, '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+', $buildnum);

	        $sw = new-object System.IO.StreamWriter( $file, $false, [System.Text.Encoding]::GetEncoding("utf-8") )
	        $sw.Write( $content )
	        $sw.Close()
		}
}
# SIG # Begin signature block
# MIINUwYJKoZIhvcNAQcCoIINRDCCDUACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU57g+A+RW/QvNtUx+1mtWPYaH
# OmGgggpRMIIFHTCCBAWgAwIBAgIMQ8ELHAAAAABR03PaMA0GCSqGSIb3DQEBCwUA
# MIG+MQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjEoMCYGA1UE
# CxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJtczE5MDcGA1UECxMwKGMp
# IDIwMDkgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3JpemVkIHVzZSBvbmx5MTIw
# MAYDVQQDEylFbnRydXN0IFJvb3QgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgLSBH
# MjAeFw0xNTA2MTAxMzQ2MDVaFw0zMDExMTAxNDE2MDVaMIG0MQswCQYDVQQGEwJV
# UzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRy
# dXN0Lm5ldC9sZWdhbC10ZXJtczE5MDcGA1UECxMwKGMpIDIwMTUgRW50cnVzdCwg
# SW5jLiAtIGZvciBhdXRob3JpemVkIHVzZSBvbmx5MSgwJgYDVQQDEx9FbnRydXN0
# IENvZGUgU2lnbmluZyBDQSAtIE9WQ1MxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
# MIIBCgKCAQEA2IYNoGQKavWOlro7mmhq20RA3vUt/OttRFjPjnLDcC1eWtT5C9gR
# NZfAKfE77heh1kS5vx9KmOAZDrXjWQgdUoygsIooQaShhkBQs03HiEHaNpOnTD1j
# LAPLr40AJRFpUCL2SwDOw7IugYXdI91OTbXwwKh0/OtsYCmYcY9o97cd8/hDi2KV
# MoZPyshMS1P+USAwHv8ARMdecZqlG4l0Sv5TPoTqsaOJnfgtQljYCgZQI3AWHAJ3
# lxg82RB9DHrmBSwaCBZmEjhscR3WZNdWwI02w7i1ALjdL7V6v7Gkbnj6bRJ25Jl3
# EaYk5IK5RnmpsKNJW9NTdEOBdG+h+C4vJQIDAQABo4IBITCCAR0wDgYDVR0PAQH/
# BAQDAgEGMBMGA1UdJQQMMAoGCCsGAQUFBwMDMBIGA1UdEwEB/wQIMAYBAf8CAQAw
# MwYIKwYBBQUHAQEEJzAlMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5lbnRydXN0
# Lm5ldDAwBgNVHR8EKTAnMCWgI6Ahhh9odHRwOi8vY3JsLmVudHJ1c3QubmV0L2cy
# Y2EuY3JsMDsGA1UdIAQ0MDIwMAYEVR0gADAoMCYGCCsGAQUFBwIBFhpodHRwOi8v
# d3d3LmVudHJ1c3QubmV0L3JwYTAdBgNVHQ4EFgQUfhofGhF0XGTJDB+UAav9gWQu
# oSwwHwYDVR0jBBgwFoAUanImetAe733nO2lR1GyNn5ASZqswDQYJKoZIhvcNAQEL
# BQADggEBALd0Z7Q+TCUvYjWBnNJ25afiKHh0w+wZ5RP5tiOUT2KnTOZOcsIkkNB5
# uqjN10TfADkw8SjEcm94rJALLaPqha0UwgsUmT/7I3StqKrMImMyJQErytAWRkJa
# p0RHWB0EQeLRMb6XYTuuBBhsenqBX6si/gjWNY6nDfXsINzcbceidtj7ZqhDAwEh
# qKD2TObUgs7XDQHWM6yQo+CSuxgCdUMCegS02BXtV5E8EueNZvi9FMxGgtb6A8AK
# DXyxgA/roRo2pXUfPNg66ueVgd6sWvudtcwRTip0EdZ/eUJhyiFBYB6k3fHZdLDV
# pegLTIGJ38yGFiUZpRRXlaKKInuxZY0wggUsMIIEFKADAgECAhEAyu2J/t43YG0A
# AAAAVWX6nTANBgkqhkiG9w0BAQsFADCBtDELMAkGA1UEBhMCVVMxFjAUBgNVBAoT
# DUVudHJ1c3QsIEluYy4xKDAmBgNVBAsTH1NlZSB3d3cuZW50cnVzdC5uZXQvbGVn
# YWwtdGVybXMxOTA3BgNVBAsTMChjKSAyMDE1IEVudHJ1c3QsIEluYy4gLSBmb3Ig
# YXV0aG9yaXplZCB1c2Ugb25seTEoMCYGA1UEAxMfRW50cnVzdCBDb2RlIFNpZ25p
# bmcgQ0EgLSBPVkNTMTAeFw0xNjA0MDgxNzI3MTlaFw0xODA2MDYxNzU3MTdaMIGK
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTESMBAGA1UEBxMJUHJp
# bmNldG9uMSgwJgYDVQQKEx9IZWFydGxhbmQgUGF5bWVudCBTeXN0ZW1zLCBJbmMu
# MSgwJgYDVQQDEx9IZWFydGxhbmQgUGF5bWVudCBTeXN0ZW1zLCBJbmMuMIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoiESRWfiA8BLsf0a4kI5O8Y7etbV
# p9UJZwW8WeiFOqG/0ad8GZfvo16RVrNkmxA3jzdkZLv4KoEO81vdI2pro19wKIm7
# CMSUQx4tTumkokhKHzscZZhWRzDXT7OcfCoFXZMQGVn6K2im2BBkUW2wSufoyvJ+
# 0Aa8lyrNhxay4NFSIC13r+JStYen2CK6Iq/d3TJ/ScMj3viEbcVfemuvpH7Sc2VR
# U37Lnkq9IIlKLpZkjwIU5qlrgQqQ2rwazUX1eag4UrQ0ZU+WuV9XwEdhV87bUkYx
# 8DcyXbi79kGgPRGygOgMxdrTXuLI1Wi+GuEnqmVBOIpglFZzwvGOqKFwWQIDAQAB
# o4IBXzCCAVswDgYDVR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMGoG
# CCsGAQUFBwEBBF4wXDAjBggrBgEFBQcwAYYXaHR0cDovL29jc3AuZW50cnVzdC5u
# ZXQwNQYIKwYBBQUHMAKGKWh0dHA6Ly9haWEuZW50cnVzdC5uZXQvb3ZjczEtY2hh
# aW4yNTYuY2VyMDEGA1UdHwQqMCgwJqAkoCKGIGh0dHA6Ly9jcmwuZW50cnVzdC5u
# ZXQvb3ZjczEuY3JsMEoGA1UdIARDMEEwNgYKYIZIAYb6bAoBAzAoMCYGCCsGAQUF
# BwIBFhpodHRwOi8vd3d3LmVudHJ1c3QubmV0L3JwYTAHBgVngQwBBDAfBgNVHSME
# GDAWgBR+Gh8aEXRcZMkMH5QBq/2BZC6hLDAdBgNVHQ4EFgQUBZN+Xkf8IwxsXcu/
# 9AatMU5HvhAwCQYDVR0TBAIwADANBgkqhkiG9w0BAQsFAAOCAQEAUUi7vEDDkxqq
# d6jiVfkeQ7o/E17RoaaKW/9Je1ej1J/q9FBXi5e1rgl8qPiiv/F9G/+iqhSvkHTl
# 4+DQ/9C32MmSxCKyIhUiLIF0XHtZNIQPJ6RxnLJJHY6nWvq4m8omr4CenUamRwQF
# MAEU/2xfQaxxBo9tO93+cp8z0gLIyuJd3eDqg09qZCkY0sEWK1mAWHAsToMo63us
# JrMwy81jyuwHtR8wQFIwAJjqQmlsItaRtYsrHIALD/TwGcWSQZg6hvDX+zEv1/yM
# crkvnDgp0NWVPemR47nyISbJYybn3wJ4dJ/0cEyQg3gSWO08Swa7PppvctBWEIPv
# tU1ZhzZ6fjGCAmwwggJoAgEBMIHKMIG0MQswCQYDVQQGEwJVUzEWMBQGA1UEChMN
# RW50cnVzdCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdh
# bC10ZXJtczE5MDcGA1UECxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBh
# dXRob3JpemVkIHVzZSBvbmx5MSgwJgYDVQQDEx9FbnRydXN0IENvZGUgU2lnbmlu
# ZyBDQSAtIE9WQ1MxAhEAyu2J/t43YG0AAAAAVWX6nTAJBgUrDgMCGgUAoHgwGAYK
# KwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIB
# BDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU
# Gj+uK12RZ/+LBsprauXQvvOIz+EwDQYJKoZIhvcNAQEBBQAEggEAhFHMgTETS8Ot
# zXZaU0jOkbpUry5+bi5w3Ux/Cj1oYp9+l91LAgHkN5Gdug1PgxwMFsRIbl6VnMGh
# /IyLtFP/O1VyBPIl64TPOAhGbCtpjSeEIBl/fq+AITeASEcFUjIZl2fGYdoH5bCC
# jUtrdsijeW72mjW01vPIoC0k39fP/gQ7IzLsF7d5fiKO+M5OwFy4HxEt+iTNvB/Q
# wqGtR5OXsae933vWsqs0R/GCLd4BbVkrAxQ/6I1g6Bdef0NvVydXTIgO7H9slsOq
# 9lZME6sl9+cnqLk6XddGgG40oqrM2bH4Q/LWY/9WdccXeUHk1d9l4JFz49ddhIeE
# mkGfXPFlYQ==
# SIG # End signature block
