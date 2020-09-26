# 管理者権限で実行したいファイルのパス
$file = (Convert-Path .\choco_install.ps1)
Write-Output $file

# PowerShellを管理者権限で実行
Start-Process -FilePath powershell -ArgumentList $file -Verb runas 

# スクリプト実行後、自動的にPowerShellが閉じないようにする
pause