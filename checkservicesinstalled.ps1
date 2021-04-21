[Array] $Services = 'Amazon SSM Agent','Armor Core','armor-filebeat','armor-winlogbeat','Qualys Cloud Agent','Trend Micro Deep Security Agent','Trend Micro Deep Security Monitor','Trend Micro Deep Security Notifier','Trend Micro Solution Platform','sshd','Remote Desktop Services';

$server="Localhost"
function Confirm-WindowsServiceExists($name)
{   
   if (Get-Service -Name $name -Computername $server -ErrorAction SilentlyContinue)
   {
       Write-Host "$name Exists on $server"
       return $true
   }
       Write-Host "$name does not exist on $server"
       return $false
}
foreach($ServiceName in $Services) {Confirm-WindowsServiceExists($ServiceName)}
