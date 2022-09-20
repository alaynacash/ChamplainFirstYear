param($network, $server)

for($i=255; $i -ge 1; $i--)
{
 Resolve-DnsName -DnsOnly $network'.'$i -Server $server -ErrorAction Ignore | Select-Object -Property Name, Namehost
}