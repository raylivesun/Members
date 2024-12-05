#!/home/admin/app/PowerShell/Members

Describe "A suite" {
    It "my first test" {
      $Value = "Value"
      $Value | Should -Be "Value"
    }
  }
