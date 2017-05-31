#Primero tenemos que activar el Powershell Remoting. Sino el Invoke-Command no funciona
Enable-PSRemoting -Force

# $commando = {ping Joseska-PC}
# Invoke-Command -scriptblock $commando -computername "Joseska-PC"
# Invoke-Command -ComputerName PC38015,PC38074 -FilePath L:\update\EPO_error\epo_error.ps1


# Borramos el MCAffe Enterprise y el Agent
$Programa = Get-WmiObject -Class Win32_Product -Filter "Name = 'McAfee VirusScan Enterprise'"
$Programa.Uninstall()

$uninstall64 = (Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\McAfee\Agent -ErrorAction SilentlyContinue).InstallPath
$uninstall32 = (Get-ItemProperty HKLM:\SOFTWARE\McAfee\Agent -ErrorAction SilentlyContinue).InstallPath


Start-Sleep -s 3


if ($uninstall64) {
    $uninstall64 =  "$($uninstall64)frminst.exe"
    $uninstall64 = $uninstall64.Trim()

    Write "desinstalando 64Bits /remove=agent"
    Start-Process -FilePath $uninstall64 -args "/remove=agent /Silent" -Wait
    Write "desinstalando 64Bits /forceuninstall"
    Start-Process -FilePath $uninstall64 -args "/forceuninstall /Silent" -Wait
}

else {
    $uninstall32 =  "$($uninstall32)frminst.exe"
    $uninstall32 = $uninstall32.Trim()

    Write "desinstalando 32Bits /remove=agent"
    Start-Process -FilePath $uninstall32 -args "/remove=agent" -Wait
    Write "desinstalando 32Bits /forceuninstall"
    Start-Process -FilePath $uninstall32 -args "/forceuninstall" -Wait
}