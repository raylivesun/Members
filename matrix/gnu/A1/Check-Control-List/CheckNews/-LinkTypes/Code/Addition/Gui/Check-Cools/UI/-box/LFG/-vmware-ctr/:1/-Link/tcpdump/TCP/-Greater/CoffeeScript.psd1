#!/home/admin/app/PowerShell/Members

# Greater Coffee Shop Inventory Management System (GCSIM)

# Initialize inventory
$inventory = @{
    'A1' = 'Cappuccino', 5
    'A2' = 'Latte', 10
    'A3' = 'Espresso', 8
    'A4' = 'Mocha', 7
    'A5' = 'Hot Chocolate', 3
}

# Function to display inventory
function DisplayInventory {
    $inventory.Keys | ForEach-Object {
        Write-Host "Product ID: $_"
        Write-Host "Product Name: $($inventory[$_])"
        Write-Host "Quantity: $($inventory[$_])"
        Write-Host ""
    }
    Write-Host "Press any key to continue..."
    Read-Key
}

# Function to add a new product to inventory
function AddProduct {
    Write-Host "Enter product ID:"
    $productId = Read-Host
    Write-Host "Enter product name:"
    $productName = Read-Host
    Write-Host "Enter initial quantity:"
    $initialQuantity = Read-Host -AsInt32
    if ($inventory.ContainsKey($productId)) {
        Write-Host "Product already exists. Update quantity instead?"
        if (Read-Key -Wait -Confirm) {
            UpdateProductQuantity $productId $initialQuantity
        }
        else {
            Write-Host "Product not added."
            return
        }
    }
    else {
        $inventory[$productId] = $productName
        $inventory[$productId] += $initialQuantity
        Write-Host "Product added successfully."
    }
    Write-Host "Press any key to continue..."
    Read-Key
}

# Function to update quantity of a product in inventory
function UpdateProductQuantity {
    param (
        [Parameter(Mandatory=$true)]
        [string]$productId,
        [Parameter(Mandatory=$true)]
        [int]$newQuantity
    )
    if ($inventory.ContainsKey($productId)) {
        $inventory[$productId] = $newQuantity
        Write-Host "Quantity updated successfully."
    }
    else {
        Write-Host "Product not found in inventory."
    }
    Write-Host "Press any key to continue..."
    Read-Key
}

# Function to remove a product from inventory
function RemoveProduct {
    Write-Host "Enter product ID to remove:"
    $productId = Read-Host
    if ($inventory.ContainsKey($productId)) {
        $inventory.Remove($productId)
        Write-Host "Product removed successfully."
    }
    else {
        Write-Host "Product not found in inventory."
    }
    Write-Host "Press any key to continue..."
    Read-Key
}

# Main program loop
while ($true) {
    Write-Host "1. Display Inventory"
    Write-Host "2. Add a New Product"
    Write-Host "3. Update Product Quantity"
    Write-Host "4. Remove a Product"
    Write-Host "5. Exit"
    Write-Host "Enter your choice (1-5):"
    $choice = Read-Host -AsInt32
    switch ($choice) {
        1 { DisplayInventory }
        2 { AddProduct }
        3 { UpdateProductQuantity }
        4 { RemoveProduct }
        5 { break }
        default { Write-Host "Invalid choice. Please try again." }
    }
    if ($choice -eq 5) {
        break
    }
}

