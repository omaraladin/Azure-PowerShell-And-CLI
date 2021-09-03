Import-Module -Name Az

Connect-AzAccount

# Defining Variables for the VM
$vmName = "Odoo13DevEnvVM"
$resourceGroup = "OdooDev"

# Assign Azure Credentials from StdInput as Variables
$adminCred = Get-Credential -Message "Enter the Username and Passwd"

# Create the VM
New-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCred -Image UbuntuLTS
