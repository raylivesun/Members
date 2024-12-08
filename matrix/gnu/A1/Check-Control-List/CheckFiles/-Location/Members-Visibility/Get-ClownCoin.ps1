#!/home/admin/app/PowerShell/members

# Get Clowin coin count for each member
$clowin_coin_count=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/users/clowincoin' | jq '.data.clowincoin_count')
Write-Host "Clowin Coin Count:" $clowin_coin_count

# Get Clowin balance for each member
$clowin_balance=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/users/clowinbalance' | jq '.data.clowin_balance')
Write-Host "Clowin Balance:" $clowin_balance

# Get Clowin transactions for each member
$clowin_transactions=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/users/clowintransactions' | jq '.data.transactions')
Write-Host "Clowin Transactions:" $clowin_transactions


# Get Crowdfunding campaigns
$crowdfunding_campaigns=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/campaigns' | jq '.data')
Write-Host "Crowdfunding Campaigns:" $crowdfunding_campaigns

# Get Crowdfunding contributions for each member
$crowdfunding_contributions=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/users/contributions' | jq '.data.contributions')
Write-Host "Crowdfunding Contributions:" $crowdfunding_contributions


# Get Crowdfunding donations for each member
$crowdfunding_donations=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/users/donations' | jq '.data.donations')
Write-Host "Crowdfunding Donations:" $crowdfunding_donations


# Get Crowdfunding rewards for each member
$crowdfunding_rewards=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/users/rewards' | jq '.data.rewards')
Write-Host "Crowdfunding Rewards:" $crowdfunding_rewards


# Get Crowdfunding rewards earned by each member
$crowdfunding_rewards_earned=$(curl -s -H 'Content-Type: application/json' -X GET 'http://localhost:8080/api/v1/users/rewards/earned' | jq '.data.rewards_ear
[Output too much, the middle part output is omitted]
 End part of output:
d: 10000
[
  {
    "id": 5,
    "user_id": 5,
    "campaign_id": 2,
    "amount": 10000,
    "created_at": "2022-05-01T12:00:00Z",
    "updated_at": "2022-05-01T12:00:00Z"
    "deleted_at": null
  }
]
')
$crowdfunding_rewards_earned
Write-Host "Crowdfunding Rewards Earned:" $crowdfunding_rewards_earned



