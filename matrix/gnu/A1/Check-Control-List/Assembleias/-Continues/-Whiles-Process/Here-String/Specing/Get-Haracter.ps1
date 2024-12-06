#!/home/admin/app/PowerShell/Members

# Get Haracter IDs from input file (one per line)
$i = 0
while ($i -lt (Get-Content./center.txt).Count) {
    $id = (Get-Content./center.txt)[$i]
    $i++

    # Get character info using Haracter ID
    $charInfo = Get-CharacterInfo -CharacterId $id

    # Check if character info is not null
    if ($charInfo) {
        # Print character info
        Write-Host "Character ID: $id"
        Write-Host "Name: $($charInfo.Name)"
        Write-Host "Race: $($charInfo.Race)"
        Write-Host "Class: $($charInfo.Class)"
        Write-Host "Level: $($charInfo.Level)"
        Write-Host "Alignment: $($charInfo.Alignment)"
        Write-Host "Deity: $($charInfo.Deity)"
        Write-Host "Exp: $($charInfo.Experience)"
        Write-Host "HP: $($charInfo.CurrentHealth) / $($charInfo.MaximumHealth)"
        Write-Host ""
    
        # Get character spells
        $spells = Get-CharacterSpells -CharacterId $id
        if ($spells) {
            Write-Host "Spells:"
            foreach ($spell in $spells) {
                Write-Host "- $($spell.Name)"
            }
            Write-Host ""
        }

        # Get character items
        $items = Get-CharacterItems -CharacterId $id
        if ($items) {
            Write-Host "Items:"
            foreach ($item in $items) {
                Write-Host "- $($item.Name)"
            }
            Write-Host ""
        
        }
        
        # Get character quests
        $quests = Get-CharacterQuests -CharacterId $id
        if ($quests) {
            Write-Host "Quests:"
            foreach ($quest in $quests) {
                Write-Host "- $($quest.Name)"
            }
            Write-Host ""
        }
        
    } else {
        Write-Host "Character ID $id not found."
    }
}


# Function to get character info using Haracter ID
function Get-CharacterInfo {
    param (
        [Parameter(Mandatory=$true)]
        [string]$CharacterId
    )

    # Replace the placeholders with your own API endpoint and authentication details
    $url = "https://api.example.com/characters/$CharacterId"
    $headers = @{
        "Authorization" = "Bearer YOUR_API_TOKEN"
    }

    try {
        $response = Invoke-RestMethod -Method GET -Uri $url -Headers $headers
        return $response

    } catch {
        Write-Host "Error retrieving character info: $_"
        return $null
    }
}

