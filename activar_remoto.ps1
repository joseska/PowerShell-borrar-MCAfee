#Primero tenemos que activar el Powershell Remoting. Sino el Invoke-Command no funciona
Enable-PSRemoting -Force

# $commando = {ping Joseska-PC}
# Invoke-Command -scriptblock $commando -computername "Joseska-PC"
# Invoke-Command -ComputerName PC38015,PC38074 -FilePath L:\update\EPO_error\borrar_MCAfee.ps1

# ejecutar Script en Equipos deshabilitados
# Set-ExecutionPolicy Unrestricted