#!/home/admin/app/PowerShell/Members

# call operator to load PSReadLine module
. "$PSScriptRoot/PSReadLine/PSReadLine.psm1"

# define function to handle user input
function PromptUser {
    param (
        [Parameter(Mandatory=$true)]
        [string]$question,

        [Parameter(Mandatory=$true)]
        [string]$prompt,

        [Parameter(Mandatory=$false)]
        [string]$default
    )

    # display the question and prompt
    Write-Host "$question" -NoNewline
    $input = Read-Host "$prompt" -DefaultParameterValue $default

    # validate the input
    if ($input -eq "") {
        Write-Host "Input cannot be empty."
        return PromptUser $question $prompt $default
    }

    return $input
}

# get user input for name, email, and phone number
$name = PromptUser -question "Enter your name:" -prompt "Name: " -default ""
$email = PromptUser -question "Enter your email address:" -prompt "Email: " -default ""
$phone = PromptUser -question "Enter your phone number:" -prompt "Phone: " -default ""

# validate email format
if (!(Test-Connection -Count 1 -Quiet -ErrorAction SilentlyContinue -Wait 100ms $email)) {
    Write-Host "Invalid email format."
    exit 1
}

# validate phone number format
if (!(Test-Connection -Count 1 -Quiet -ErrorAction SilentlyContinue -Wait 100ms $phone)) {
    Write-Host "Invalid phone number format."
    exit 1
}

# display user information
Write-Host "Name: $name"
Write-Host "Email: $email"
Write-Host "Phone: $phone"

