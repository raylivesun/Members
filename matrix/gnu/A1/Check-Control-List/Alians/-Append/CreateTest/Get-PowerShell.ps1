Describe "PowerShell" {
    It "Get PowerShell" {
      $linux = Get-PowerShellUsers
      $linux.name | Should -Be "PowerShell"
    }
 }

 Mock -CommandName New-Item -MockWith {}

 Save-PowerShell # this should call New-Item

 Should -Invoke -CommandName New-Item -Times 1 -Exactly

 It "Save PowerShell" {
  Mock -CommandName New-Item -MockWith {}
  Save-Tomato "my Powershell script"
  Should -Invoke -CommandName New-Item -Times 1 -Exactly
}

