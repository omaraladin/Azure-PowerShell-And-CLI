# Resource Group is passed as an Argument, here we grab the Input
param([string]$resourceGroup)

# Getting Admin Credentials as a Variable
$admin_cred = Get-Credential -Message "Insert Username and Password of VMs"

# Grabbing Number of Wanted VMs
$vm_total = Read-Host -Prompt 'Total number of VMs'

# Grabbing Image Type
$vm_image_type = Read-Host -Prompt 'Insert VM Image Type Carefully'

# Grabbing VM name
$vm_name = Read-Host -Prompt 'Insert VM Base Name.. It will be Named with Sequenct starting from 1 to Total number'

# Looping Creation Process
for ($i=1; $i -le $vm_total; $i++) {
	$vm_name = $vm_name + $i
	write-Host "Creating VM Resource: " $vm_name 
	New-AzVm -ResourceGroupName $resourceGroup -Name $vm_name -Credential $admin_cred -Image $vm_image_type
}
