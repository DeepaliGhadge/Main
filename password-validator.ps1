$Entered_Password =Get-Content -Path .\Password.txt #Experiment with different Passwords.

Write-host 'Entered_Password' $Entered_Password
$Password_length = $Entered_Password.Length

if($Entered_Password -cmatch '[a-z]')     # at least 1 lowercase letter
      {
      $Has_Lowercase=$true
      #Write-host 'Has_Lowercase' $Has_Lowercase
      }
else
      {
      $Has_Lowercase=$false
      #Write-host 'Has_Lowercase' $Has_Lowercase
      }

if($Entered_Password -cmatch '[A-Z]')     # at least 1 uppercase letter
      {
        $Has_Uppercase=$true
        #Write-host 'Has_Uppercase' $Has_Uppercase
      }
else
      {
        $Has_Uppercase=$false
        #Write-host 'Has_Uppercase' $Has_Uppercase
      }

if($Entered_Password -match '[0-9]')       # at least 1 digit
      {
        $Has_Digit=$true
        #Write-host 'Has_Digit' $Has_Digit
      }
else
     {
       $Has_Digit=$false
       #Write-host 'Has_Digit' $Has_Digit
     }

if($Password_length -ge 10)       # at least 10 character long
    {
       $Valid_Length=$true
       #Write-host 'Valid_Length' $Valid_Length
    }
else
    {
      $Valid_Length=$false
      #Write-host 'Valid_Length' $Valid_Length
  }

#functions to print Output in color code Green
  function Green
  {
      process { Write-Host $_ -ForegroundColor Green }
  }

#functions to print Output in color code Red
  function Red
  {
      process { Write-Host $_ -ForegroundColor Red }
  }

$validOverall = $Valid_Length -eq $true -and $Has_Lowercase -eq $true -and $Has_Uppercase -eq $true -and $Has_Digit -eq $true
Write-host 'validOverall' $validOverall

if ($validOverall -eq $true)
{
Write-Output $Entered_Password 'Password is valid!!!' | Green
}
else
{
  if($Valid_Length -eq $false)
  {
  Write-Output 'Password length is not valid!!' | Red
  }

  if($Has_Lowercase -eq $false)
  {
  Write-Output 'Password has no lowercase' | Red
  }

  if($Has_Uppercase-eq $false)
  {
  Write-Output 'Password has no uppercase' | Red
  }

  if($Has_Digit-eq $false)
  {
  Write-Output 'Password has no digits' | Red
  }
}
