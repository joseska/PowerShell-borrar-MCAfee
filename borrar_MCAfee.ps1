# ejecutar Script en Equipos con el "Set-ExecutionPolicy restricted"
# Set-ExecutionPolicy Unrestricted


# Borramos el MCAffe Enterprise
$Programa = Get-WmiObject -Class Win32_Product -Filter "Name = 'McAfee VirusScan Enterprise'"
if ($Programa) {
    $Programa.Uninstall()
}
else {
    write-host "No está instalado el McAfee VirusScan Enterprise"
}

Start-Sleep -s 3

# Borramos el MCAffe Agent
$uninstall64 = (Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\McAfee\Agent -ErrorAction SilentlyContinue).InstallPath
$uninstall32 = (Get-ItemProperty HKLM:\SOFTWARE\McAfee\Agent -ErrorAction SilentlyContinue).InstallPath

if ($uninstall64) {
    $uninstall64 =  "$($uninstall64)frminst.exe"
    $uninstall64 = $uninstall64.Trim()

    Write "desinstalando 64Bits /remove=agent. Puede tardar bastante..."
    Start-Process -FilePath $uninstall64 -args "/remove=agent /Silent" -Wait
    Write "desinstalando 64Bits /forceuninstall. Puede tardar bastante..."
    Start-Process -FilePath $uninstall64 -args "/forceuninstall /Silent" -Wait
}
ElseIf ($uninstall32) {
    $uninstall32 =  "$($uninstall32)frminst.exe"
    $uninstall32 = $uninstall32.Trim()

    Write "desinstalando 32Bits /remove=agent. Puede tardar bastante..."
    Start-Process -FilePath $uninstall32 -args "/remove=agent" -Wait
    Write "desinstalando 32Bits /forceuninstall. Puede tardar bastante..."
    Start-Process -FilePath $uninstall32 -args "/forceuninstall" -Wait
}

else {
    Write "No está instalado el MCAfee Agent"
}



# habilitar de nuevo "Set-ExecutionPolicy restricted"
# Set-ExecutionPolicy undefined