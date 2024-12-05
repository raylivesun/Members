#!/home/admin/app/PowerShell/Members

# Alians Buffer for Aliases and Functions
. "$PSScriptRoot/aliases.ps1"

# Function to check if a user is a member of a group
function IsUserMemberOfGroup {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName,

        [Parameter(Mandatory=$true)]
        [string]$userName
    )

    # Use the Get-ADGroupMember cmdlet to check if the user is a member of the group
    $isMember = Get-ADGroupMember -Identity $groupName -Members $userName -ErrorAction SilentlyContinue
    $isMember
}

# Function to get the members of a group
function Get-GroupMembers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    # Use the Get-ADGroupMember cmdlet to get the members of the group
    Get-ADGroupMember -Identity $groupName -Properties Member
}

# Function to get the members of a group in a CSV format
function Get-GroupMembersCSV {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )

    # Use the Get-ADGroupMember cmdlet to get the members of the group
    $members = Get-ADGroupMember -Identity $groupName -Properties Member
    $members | Select-Object Member | Format-Table -AutoSize | Out-Csv -Path $outputFile
}

# Function to get the members of a group in a JSON format
function Get-GroupMembersJSON {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )

    # Use the Get-ADGroupMember cmdlet to get the members of the group
    $members = Get-ADGroupMember -Identity $groupName -Properties Member
    $members | Format-Table -AutoSize | ConvertTo-Json | Out-File -FilePath $outputFile
}

# Function to get the members of a group in a human-readable format
function Get-GroupMembersHuman {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    # Use the Get-ADGroupMember cmdlet to get the members of the group
    $members = Get-ADGroupMember -Identity $groupName -Properties Member
    $members | Format-Table -AutoSize
}

# Function to get the members of a group in a PowerShell object format
function Get-GroupMembersObject {
    param (
        [Parameter(Mandatory=$true)]
        [string]$groupName
    )

    # Use the Get-ADGroupMember cmdlet to get the members of the group
    $members = Get-ADGroupMember -Identity $groupName -Properties Member
    $members
}

# Function to check if a user is a member of multiple groups
function IsUserMemberOfGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string]$userName,

        [Parameter(Mandatory=$true)]
        [string[]]$groupNames
    )

    foreach ($groupName in $groupNames) {
        if (Is-UserMemberOfGroup -groupName $groupName -userName $userName) {
            return $true
        }
    }
    return $false
}

# Function to get the members of multiple groups
function Get-GroupMembersFromGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )
    foreach ($groupName in $groupNames) {
        Get-GroupMembersCSV -groupName $groupName -outputFile "group_members_$groupName.csv"
    }
}

# Function to get the members of multiple groups in a CSV format
function Get-GroupMembersCSVFromGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )
    Get-GroupMembersObject -groupName $groupNames | Format-Table -AutoSize | Select-Object Name, Member | ConvertTo-Csv -Path $outputFile
}

# Function to get the members of multiple groups in a JSON format
function Get-GroupMembersJSONFromGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )
    Get-GroupMembersObject -groupName $groupNames | Format-Table -AutoSize | Select-Object Name, Member | ConvertTo-Json | Out-File -FilePath $outputFile
}

# Function to get the members of multiple groups in a human-readable format
function Get-GroupMembersHumanFromGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames
    )
    foreach ($groupName in $groupNames) {
        Get-GroupMembersHuman -groupName $groupName
    }
}

# Function to get the members of multiple groups in a PowerShell object format
function Get-GroupMembersObjectFromGroups {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames
    )
    Get-GroupMembersObject -groupName $groupNames
}

# Function to check if a user is a member of multiple groups using the built-in Active Directory module
function IsUserMemberOfGroupsAD {
    param (
        [Parameter(Mandatory=$true)]
        [string]$userName,

        [Parameter(Mandatory=$true)]
        [string[]]$groupNames
    )
    foreach ($groupName in $groupNames) {
        if (Get-ADGroupMember -Identity $groupName -Members $userName) {
            return $true
        }
    }
    return $false
}

# Function to get the members of multiple groups using the built-in Active Directory module
function Get-GroupMembersFromGroupsAD {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )
    foreach ($groupName in $groupNames) {
        Get-ADGroupMember -Identity $groupName -Properties Member | Select-Object Name, Member | Format-Table -AutoSize | Out-Csv -Path "group_members_$groupName.csv"
    }
    # If you want to export the members in a single CSV file, use the following command:
    # Get-ADGroupMember -Identity $groupName -Properties Member | Format-Table -AutoSize | Select-Object Name, Member | Export-Csv -Path "group_members.csv"
}

# Function to get the members of multiple groups using the built-in Active Directory module in a CSV format
function Get-GroupMembersCSVFromGroupsAD {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )
    Get-ADGroupMember -Identity $groupName -Properties Member | Format-Table -AutoSize | Select-Object Name, Member | ConvertTo-Csv -Path $outputFile
}

# Function to get the members of multiple groups using the built-in Active Directory module in a JSON format
function Get-GroupMembersJSONFromGroupsAD {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]
        [Parameter(Mandatory=$true)]
        [string]$outputFile
    )
    Get-ADGroupMember -Identity $groupName -Properties Member | Format-Table -AutoSize | Select-Object Name, Member | ConvertTo-Json | Out-File -FilePath $outputFile
    # If you want to export the members in a single JSON file, use the following command:
    # Get-ADGroupMember -Identity $groupName -Properties Member | Format-Table -AutoSize | Select-Object Name, Member | ConvertTo-Json | Out-File -FilePath "group_members.json"
}

# Function to get the members of multiple groups using the built-in Active Directory module in a human-readable format
function Get-GroupMembersHumanFromGroupsAD {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames
    )
    foreach ($groupName in $groupNames) {
        Get-ADGroupMember -Identity $groupName -Properties Member | Format-Table -AutoSize
    }
}

# Function to get the members of multiple groups using the built-in Active Directory module in a PowerShell object format
function Get-GroupMembersObjectFromGroupsAD {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames
    )
    Get-ADGroupMember -Identity $groupName -Properties Member | Format-Table -AutoSize
}

# Function to check if a user is a member of multiple groups using the built-in Active Directory module and a custom attribute
function IsUserMemberOfGroupsADCustomAttribute {
    param (
        [Parameter(Mandatory=$true)]
        [string]$userName,

        [Parameter(Mandatory=$true)]
        [string[]]$groupNames,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeName,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeValue
    )
    foreach ($groupName in $groupNames) {
        if (Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue }) {
            $group = Get-ADGroup -Identity $groupName
            if ($group.Members.Contains($userName)) {
                return $true
                break
            }
            return $false
        }
        else {
            return $false
        }
    }
    return $false
}

# Function to get the members of multiple groups using the built-in Active Directory module and a custom attribute in a CSV format
function Get-GroupMembersCSVFromGroupsADCustomAttribute {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames,

        [Parameter(Mandatory=$true)]
        [string]$outputFile,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeName,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeValue
    )
    foreach ($groupName in $groupNames) {
        Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize | Out-Csv -Path "group

        _members_$groupName.csv"
    }
    # If you want to export the members in a single CSV file, use the following command:
    # Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize | ConvertTo-Csv -Path
    # "group_members.csv"
}

# Function to get the members of multiple groups using the built-in Active Directory module and a custom attribute in a JSON format
function Get-GroupMembersJSONFromGroupsADCustomAttribute {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames,

        [Parameter(Mandatory=$true)]
        [string]$outputFile,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeName,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeValue
    )
    foreach ($groupName in $groupNames) {
        Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize | ConvertTo-Json | Out-
        File -FilePath "group_members_$groupName.json"
    }
    # If you want to export the members in a single JSON file, use the following command:
    # Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize | ConvertTo-Json | Out
    File -FilePath "group_members.json"
}

# Function to get the members of multiple groups using the built-in Active Directory module and a custom attribute in a human-readable format
function Get-GroupMembersHumanFromGroupsADCustomAttribute {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeName,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeValue
    )
    foreach ($groupName in $groupNames) {
        Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize
    }
    # If you want to export the members in a single CSV file, use the following command:
    # Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize | Out-Csv -Path "
    # "group_members.csv"
}


# Function to get the members of multiple groups using the built-in Active Directory module and a custom attribute in a PowerShell object format
function Get-GroupMembersObjectFromGroupsADCustomAttribute {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$groupNames,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeName,

        [Parameter(Mandatory=$true)]
        [string]$customAttributeValue
    )
    foreach ($groupName in $groupNames) {
        Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize
    }
    # If you want to export the members in a single CSV file, use the following command:
    # Get-ADUser -Identity $userName -Properties * | Where-Object { $_.$customAttributeName -eq $customAttributeValue } | Select-Object Name, @{N='Member';E={$group.Members}} | Format-Table -AutoSize | ConvertTo-Csv -Path
    # "group_members.csv"
}


# Example usage:
# Get the members of multiple groups in a CSV format
Get-GroupMembersCSVFromGroupsAD -groupNames "Group1", "Group2", "Group3" -outputFile "group_members.csv"

# Get the members of multiple groups in a JSON format
Get-GroupMembersJSONFromGroupsAD -groupNames "Group1", "Group2", "Group3" -outputFile "group_members.json"

# Get the members of multiple groups in a human-readable format
Get-GroupMembersHumanFromGroupsAD -groupNames "Group1", "Group2", "Group3"

# Get the members of multiple groups in a PowerShell object format
Get-GroupMembersObjectFromGroupsAD -groupNames "Group1", "Group2", "Group3"

# Check if a user is a member of multiple groups using a custom attribute
Is-UserMemberOfGroupsADCustomAttribute -userName "User1" -groupNames "Group1", "Group2", "Group3" -customAttributeName "CustomAttribute" -customAttributeValue "CustomAttributeValue"

# Get the members of multiple groups using a custom attribute in a CSV format
Get-GroupMembersCSVFromGroupsADCustomAttribute -groupNames "Group1", "Group2", "Group3" -outputFile "group_members.csv" -customAttributeName "CustomAttribute" -customAttributeValue "CustomAttributeValue"

# Get the members of multiple groups using a custom attribute in a JSON format
Get-GroupMembersJSONFromGroupsADCustomAttribute -groupNames "Group1", "Group2", "Group3" -outputFile "group_members.json" -customAttributeName "CustomAttribute" -customAttributeValue "CustomAttributeValue"

# Get the members of multiple groups using a custom attribute in a human-readable format
Get-GroupMembersHumanFromGroupsADCustomAttribute -groupNames "Group1", "Group2", "Group3" -customAttributeName "CustomAttribute" -customAttributeValue "CustomAttributeValue"

# Get the members of multiple groups using a custom attribute in a PowerShell object format
Get-GroupMembersObjectFromGroupsADCustomAttribute -groupNames "Group1", "Group2", "Group3" -customAttributeName "CustomAttribute" -customAttributeValue "CustomAttributeValue"



Import-Alias System.Management.Automation.Host


param (
    [parameter(Position=0,Mandatory=$False)] 
    [string]$OutputCsvFileName,

    [parameter(Position=1,Mandatory=$False)] 
    [switch]$OpenFileWhenComplete = $False
)


# ----------------------------------------
#	How to use
<#--
	Open a powershell window then type in the following and click enter
		.\get-stream-video-info.ps1 "C:\Temp\streamanalysis\stream7Oct22-getnbstreamvideoinfo.csv"
		
	You'll then be prompted for 3 options
	[V] Videos  [C] ChannelVideos  [A] All  [?] Help (default is "V"): 
		V - videos, which will get a list of all the videos in your STREAM environment.
			NOTE you may need to alter the variables in the code if you have more than 1000s of videos
		C - ChannelVideos, will get a list of all the videos and the channels they are in.
			NOTE this returns a filtered view of all the videos associated with a channel
		A - All, returns both the Videos and the ChannelVideos.
		
	You'll then be prompted for a user to login to the STREAM portal with, this is so the script can get a security token to do it's work with.
	Choose/use an account with full access to STREAM.
		
	If you used a CSV file path after the script name, then this powershell script will export one or two CSV files based on the option chosen
		<your folder path, your filename>-videos<your file ending>
		and or
		<your folder path, your filename>-channelVideos<your file ending>
			
	If you don't want to export file names, this powershell creates objects you can use in other ways
		V or A - will create an object $ExtractData, which is a list of every video and key properties for each video.
		C or A - wil create an object $videosPerChannel, which lists key information about each video AND the channel they are part of.


 ----------------------------------------------------------------------------------------------
	original source
	my script 
	https://techcommunity.microsoft.com/t5/microsoft-stream-classic/powershell-script-to-list-all-videos-in-your-365-stream/m-p/1752149

	which inspired Twan van Beers to write
	https://neroblanco.co.uk/2022/02/get-list-of-videos-from-microsoft-stream/
	
	I've then taken Twan's script and modified it to do what I require in my environment.
	Namely - get the video information AND the channels they are part of. For my 1000 or so videos and 35 channels, it takes about 1 min to run using the All option.
	
	This meant I was able to setup an intranet video library with a channel metadata column, folders per channel 
	(so i could give edit rights to channel owners, without opening up the entire library or having to use multiple libraries), and eventually
	download the videos, then upload them into the library using ShareGate to reinstate some of the key metadata, i.e. created date, person who created them etc
	
	
--#>

# ----------------------------------------------------------------------------------------------
function Show-OAuthWindowStream {
    param (
        [string]$Url,
        [string]$WindowTitle
    )
       
    $Source = `
@"
    [DllImport("wininet.dll", SetLastError = true)]
    public static extern bool InternetSetOption(IntPtr hInternet, int dwOption, IntPtr lpBuffer, int lpdwBufferLength);
"@

    $WebBrowser = Add-Type -memberDefinition $Source -passthru -name $('WebBrowser'+[guid]::newGuid().ToString('n'))
    $INTERNET_OPTION_END_BROWSER_SESSION = 42
    # Clear the current session
    $WebBrowser::InternetSetOption([IntPtr]::Zero, $INTERNET_OPTION_END_BROWSER_SESSION, [IntPtr]::Zero, 0) | out-null

    Add-Type -AssemblyName System.Windows.Forms
    $Form = New-Object -TypeName System.Windows.Forms.Form -Property @{Width = 600; Height = 800 }

    $Script:web = New-Object -TypeName System.Windows.Forms.WebBrowser -Property @{Width = 580; Height = 780; Url = ($URL -f ($Scope -join "%20")) }
    $Web.ScriptErrorsSuppressed = $True
    $Form.Controls.Add($Web)
    $Featured = {
        $Head = $Web.Document.GetElementsByTagName("head")[0];
        $ScriptEl = $Web.Document.CreateElement("script");
        $Element = $ScriptEl.DomElement;

        # Javascript function to get the sessionInfo including the Token
        $Element.text = `
@'
        function CaptureToken() { 
            if( typeof sessionInfo === undefined ) {
                return '';
            } else {
                outputString = '{';
                outputString += '"AccessToken":"' + sessionInfo.AccessToken + '",';
                outputString += '"TenantId":"' + sessionInfo.UserClaim.TenantId + '",';
                outputString += '"ApiGatewayUri":"' + sessionInfo.ApiGatewayUri + '",';
                outputString += '"ApiGatewayVersion":"' + sessionInfo.ApiGatewayVersion + '"';
                outputString += '}';

                return outputString;
            }
        }
'@;

        $Head.AppendChild($ScriptEl);
        $TenantInfoString = $Web.Document.InvokeScript("CaptureToken");
            
        if( [string]::IsNullOrEmpty( $TenantInfoString ) -eq $False ) {
            $TenantInfo = ConvertFrom-Json $TenantInfoString
            if ($TenantInfo.AccessToken.length -ne 0 ) {
                $Script:tenantInfo = $TenantInfo;
                $Form.Controls[0].Dispose()
                $Form.Close()
                $Form.Dispose()
            }
        }

    }
    $Web.add_DocumentCompleted($Featured)
    $Form.AutoScaleMode = 'Dpi'
    $Form.ShowIcon = $False
    $Form.Text = $WindowTitle
    $Form.AutoSizeMode = 'GrowAndShrink'
    $Form.StartPosition = 'CenterScreen'
    $Form.Add_Shown( { $Form.Activate() })
    $Form.ShowDialog() | Out-Null

    write-output $Script:tenantInfo
}

# ----------------------------------------------------------------------------------------------
function Get-RequestedAssets([PSCustomObject]$Token, [string]$Url, [string]$Label) {
    $Index = 0
    $MainUrl = $Url
    $AllItems = @()
    do {
        $RestUrl = $MainUrl.Replace("`$skip=0", "`$skip=$Index") 
		
		
            
        Write-Host "  Fetching ... $($Index) to $($Index+100)"
        $Items = @((Invoke-RestMethod -Uri $RestUrl -Headers $Token.headers -Method Get).value)

        $AllItems += $Items
        $Index += 100
            
    } until ($Items.Count -lt 100)

    Write-Host "  Fetched $($AllItems.count) items"

    $Assets = $AllItems | Select-Object `
                            @{Name='Type';Expression={$Label}},`
                            Id, Name,`
                            @{Name='Size(MB)';Expression={$_.AssetSize/1MB}}, `
                            PrivacyMode, State, VideoMigrationStatus, Published, PublishedDate, ContentType, Created, Modified, `
                            @{name='Media.Duration';Expression={$_.Media.Duration}},`
                            @{name='Media.Height';Expression={$_.Media.Height}},`
                            @{name='Media.Width';Expression={$_.Media.Width}},`
                            @{name='Media.isAudioOnly';Expression={$_.media.isAudioOnly}},`
                            @{name='Metrics.Comments';Expression={$_.Metrics.Comments}},`
                            @{name='Metrics.Likes';Expression={$_.Metrics.Likes}},`
                            @{name='Metrics.Views';Expression={$_.Metrics.Views}}, `
                            @{name='ViewVideoUrl';Expression={("https://web.microsoftstream.com/video/" + $_.Id)}}, `
                            @{name='VideoCreatorName';Expression={$_.creator.name}}, `
                            @{name='VideoCreatorEmail';Expression={$_.creator.mail}}, `
                            @{name='VideoDescription';Expression={$_.description}}
							
        
    write-output $Assets
	
}




function Get-VideoChannels([PSCustomObject]$Token, [string]$Url, [string]$Label) {
		#this will get the list of channels
    $Index = 0
    $MainUrl = $Url
    $AllItems = @()
    do {
        $RestUrl = $MainUrl.Replace("`$skip=0", "`$skip=$Index") 
		
		
            
        Write-Host "  Fetching ... $($Index) to $($Index+100)"
        $Items = @((Invoke-RestMethod -Uri $RestUrl -Headers $Token.headers -Method Get).value)

        $AllItems += $Items
        $Index += 100
            
    } until ($Items.Count -lt 100)

    Write-Host "  Fetched $($AllItems.count) items"
	#to add properties to this section look at https://aase-1.api.microsoftstream.com/api/channels?$skip=0&$top=100&adminmode=true&api-version=1.4-private
	
    $Channels = $AllItems | Select-Object `
                            @{Name='Type';Expression={$Label}},`
                            Id, Name, Description,`
                            @{Name='MetricsVideos';Expression={$_.metrics.videos}}
	#write-host $channels.count							
        
    write-output $Channels
}

function Get-channelVideos([PSCustomObject]$Token, [PSCustomObject]$allChannels, [string]$Label) {
		#this will get the list of channels
   
    $MainUrl = "https://aase-1.api.microsoftstream.com/api/channels/ChannelIDToSwap/videos?`$top=50&`$skip=0&`$filter=published%20and%20(state%20eq%20%27completed%27%20or%20contentSource%20eq%20%27livestream%27)&`$expand=creator,events&adminmode=true&`$orderby=name%20asc&api-version=1.4-private"
	
	#for each channel URL go through all the videos, capture the channel name against the video id and name
	$allVideosPerChannel = @()
	
	foreach($chan in $allChannels) {
		$thisChannelid = $chan.id 
		$chanUrl = @( $MainUrl.Replace("ChannelIDToSwap", $thisChannelid) )
		$chanName = $chan.name
		$AllItems = ""
		$items = ""
		$thischanvideos = ""
		$Index = 0
		Where-Object { $_.id -eq $thisChannelid } | ForEach-Object {$thischanvideos}
		#write-host $chanUrl
		
		#loop the index
		do {
			
			$RestUrl = $chanUrl.Replace("`$skip=0", "`$skip=$Index") 
			
			#write-host $restUrl
				
			#Write-Host "$chanName | Fetching ... $($Index) to $($Index+50)"
			$Items = @((Invoke-RestMethod -Uri $RestUrl -Headers $Token.headers -Method Get).value)
			
			$allItems = $items | Select-Object id,name, @{Name='Channel';Expression={$chanName}},@{Name='Type';Expression={$Label}}
			#write-host $allItems.count
			#foreach($x in $items ) {
			#	write-host $x.name
				#write-host $x.id
				#write-host $label
				#write-host $chanName
			#}

			
			$Index += 50
			
				
		} until ($Items.Count -lt 100)
		
		#got videos into $items, now mist with $chan info and put into $allVideosPerChannel object 
		$allVideosPerChannel += $AllItems
		
		
		$AllItems = ""
		$items = ""
	}

	

    Write-Host "  Fetched $($allVideosPerChannel.count) videos in $($allChannels.count) channels"
	#to add properties to this section look at https://aase-1.api.microsoftstream.com/api/channels?$skip=0&$top=100&adminmode=true&api-version=1.4-private
	
   
        
    write-output $allVideosPerChannel
}



# ----------------------------------------------------------------------------------------------
function Get-StreamToken() {
        
    $TenantInfo = Show-OAuthWindowStream -url "https://web.microsoftstream.com/?noSignUpCheck=1" -WindowTitle  "Please login to Microsoft Stream ..."
    $Token = $TenantInfo.AccessToken
    $Headers = @{
        "Authorization"   = ("Bearer " + $Token)
        "accept-encoding" = "gzip, deflate, br"
    }
    $UrlTenant = $TenantInfo.ApiGatewayUri
    $ApiVersion = $TenantInfo.ApiGatewayVersion
        
    $UrlBase = "$UrlTenant{0}?`$skip=0&`$top=100&adminmode=true&api-version=$ApiVersion" 
        
    $RequestToken = [PSCustomObject]::new()
    $RequestToken | Add-Member  -Name "token" -MemberType NoteProperty -Value  $Token
    $RequestToken | Add-Member  -Name "headers" -MemberType NoteProperty -Value  $Headers
    $RequestToken | Add-Member  -Name "tenantInfo" -MemberType NoteProperty -Value $TenantInfo
        
    $Urls = [PSCustomObject]::new()
    $RequestToken | Add-Member  -Name "urls" -MemberType NoteProperty -Value  $Urls

    $RequestToken.urls | Add-Member  -Name "Videos" -MemberType NoteProperty -Value  ($UrlBase -f "videos")
    $RequestToken.urls | Add-Member  -Name "Channels" -MemberType NoteProperty -Value   ($UrlBase -f "channels")
    $RequestToken.urls | Add-Member  -Name "Groups" -MemberType NoteProperty -Value  ($UrlBase -f "groups")
        
    $UrlBase = $UrlBase.replace("`$skip=0&", "")
    $RequestToken.urls | Add-Member  -Name "Principals" -MemberType NoteProperty -Value   ($UrlBase -f "principals")

    write-output $RequestToken
}





function New-Menu {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Title,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Question
    )
    
    $videos = [ChoiceDescription]::new('&Videos', 'Videos')
    $channelvideos = [ChoiceDescription]::new('&ChannelVideos', 'All Videos by Channel')
	$all = [ChoiceDescription]::new('&All', 'All videos AND all videos by channel')
    

    $options = [ChoiceDescription[]]($videos, $channelvideos, $all)

    $result = $host.ui.PromptForChoice($Title, $Question, $options, 0)


    switch ($result) {
        0 { 'Videos' }
        1 { 'ChannelVideos' }
        2 { 'All' }
    }

}



$menuoutome = New-Menu -title 'Stream videos' -question 'What do you want to output?'

#write-host $menuoutome


$StreamToken = Get-StreamToken

$urlQueryToUse = $StreamToken.Urls.Videos

#default $StreamToken.Urls.Videos is something like https://aase-1.api.microsoftstream.com/api/videos?$skip=900&$top=100&adminmode=true&api-version=1.4-private

#To get creator and event details you need to add    $expand=creator,events      to the URL , not to do that you need to use &`$expand=creator,events  with out the ` powershell thinks $expand is a variable.
	#  e.g. use  
	$urlQueryToUse = $StreamToken.Urls.Videos+"&`$expand=creator,events"
	
#Other option
#	use the following if you want to only see files that have privacymode eq 'organization' i.e. video is visible to EVERYONE in the organisation
#	Thanks to Ryechz for this 
#
#   $urlQueryToUse = $StreamToken.Urls.Videos + "&orderby=publishedDate%20desc&`$expand=creator,events&`$filter=published%20and%20(state%20eq%20%27Completed%27%20or%20contentSource%20eq%20%27livestream%27)%20and%20privacymode%20eq%20%27organization%27%20"

if($menuoutome -eq 'Videos' -Or $menuoutome -eq 'All'){
	#modify the -URL submitted to get more data or filter data or order the output 
	$ExtractData = Get-RequestedAssets -token $StreamToken -Url $urlQueryToUse -Label "Videos"
	write-host ""
	write-host "The `$ExtractData object contains all the details about each video. Use `$ExtractData[0] to see the first item in the object, and it's properties."
	
	if( $OutputCsvFileName ) {
		$thisOutputCsvFileName = $OutputCsvFileName.replace(".csv", '-'+$menuoutome+'-videos.csv')
		$ExtractData | Export-CSV $thisOutputCsvFileName -NoTypeInformation -Encoding UTF8
		write-host "The following file has been created: $thisOutputCsvFileName"
		if( $OpenFileWhenComplete ) {
			Invoke-Item $thisOutputCsvFileName
		}
	}
	
}

if($menuoutome -eq 'ChannelVideos' -Or $menuoutome -eq 'All'){
	#Get the list of channels , filter the result for the channel id and name
	$channelList = Get-VideoChannels -token $StreamToken -Url $StreamToken.Urls.Channels -Label "Channels"

	#for each channel get the videos that are in that channel, so that we can match them up to the ExtractData , which is the list of all videos)
	$videosPerChannel = get-channelvideos -token $StreamToken -allChannels $channelList -Label "ChannelVideos"
	write-host ""
	write-host "The `$videosPerChannel object contains key information about each video and the channel it is in. Use `$videosPerChannel[0] to see the first video, and it's properties."
	write-host "The `$channelList object contains a list of channel's and their properties."
	

	if( $OutputCsvFileName ) {
		$thisOutputCsvFileName = $OutputCsvFileName.replace(".csv", '-'+$menuoutome+'-channelVideos.csv')
		$videosPerChannel | Export-CSV $thisOutputCsvFileName -NoTypeInformation -Encoding UTF8
		write-host "The following file has been created: $thisOutputCsvFileName"
		if( $OpenFileWhenComplete ) {
			Invoke-Item $thisOutputCsvFileName
		}
	}
	
}
