#!/home/admin/app/PowerShell/Members

# Get Exec Nick Frost & his most recent GitHub commit
$exec_nick_frost_commit=$(git log --author='Exec Nick Frost' --pretty=format:'%h - %s' | head -n 1)
Write-Progress "Exec Nick Frost's most recent GitHub commit: $exec_nick_frost_commit"


# Get GitHub commits for all PowerShell members
$powershell_members_commits=$(git log --author='PowerShell Member' --pretty=format:'%h - %s' | grep 'PowerShell Member')
Write-Progress "PowerShell Member's GitHub commits: $powershell_members_commits"


# Get GitHub commits for PowerShell Core team members
$powershell_core_team_members_commits=$(git log --author='PowerShell Core Team Member' --pretty=format:'%h - %s' | grep 'PowerShell Core Team Member')
Write-Progress "PowerShell Core Team Member's GitHub commits: $powershell_core_team_members_commits"


# Get GitHub commits for PowerShell Team members
$powershell_team_members_commits=$(git log --author='PowerShell Team Member' --pretty=format:'%h - %s' | grep 'PowerShell Team Member')
Write-Progress "PowerShell Team Member's GitHub commits: $powershell_team_members_commits"


# Get GitHub commits for PowerShell Gallery team members
$powershell_gallery_team_members_commits=$(git log --author='PowerShell Gallery Team Member' --pretty=format:'%h - %s' | grep 'PowerShell Gallery Team Member')
Write-Progress "PowerShell Gallery Team Member's GitHub commits: $powershell_gallery_team_members_commits"


# Get GitHub commits for PowerShell Community team members
$powershell_community_team_members_commits=$(git log --author='PowerShell Community Team Member' --pretty=format:'%h - %s' | grep 'PowerShell Community Team Member')
Write-Progress "PowerShell Community Team Member's GitHub commits: $powershell_community_team_members_commits"


# Get GitHub commits for PowerShell Team's GitHub organization
$powershell_team_github_organization_commits=$(git log --author='PowerShell Team' --pretty=format:'%h - %s' | grep 'PowerShell Team')
Write-Progress "PowerShell Team's GitHub organization commits: $powershell_team_github_organization_commits"


# Get GitHub commits for PowerShell Team's GitHub organization members
$powershell_team_github_organization_members_commits=$(git log --author='PowerShell Team GitHub Organization Member' --pretty=format:'%h - %s' | grep 'PowerShell Team GitHub Organization Member')
Write-Progress "PowerShell Team GitHub Organization Member's GitHub commits: $powershell_team_github_organization_members_commits"


# Get GitHub commits for PowerShell Team's GitHub organization's PowerShell Gallery team members
$powershell_team_github_organization_powershell_gallery_team_members_commits=$(git log --author='PowerShell Team GitHub Organization PowerShell Gallery Team Member' --pretty=format:'%h - %s' | grep 'PowerShell Team GitHub Organization PowerShell Gallery Team Member')
Write-Progress "PowerShell Team GitHub Organization PowerShell Gallery Team Member's GitHub commits: $powershell_team_github_organization_powershell_gallery_team_members_commits"


