#Primero tenemos que activar el Powershell Remoting. Sino el Invoke-Command no funciona
Enable-PSRemoting -Force


$commando = {ping Joseska-PC}
Invoke-Command -scriptblock $commando -computername "Joseska-PC"