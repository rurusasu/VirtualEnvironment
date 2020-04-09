@REM セキュリティを一時的に緩める
powershell Set-ExecutionPolicy RemoteSigned

@REM 「Chocolatey」をインストール
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

@REM アプリのインストール（一時的に「Chocolatey」のインストールフォルダーへパスを通します）
set path=%path%;%ChocolateyInstall%

choco install -y firefox
choco install -y thunderbird
choco install -y unchecky
choco install -y afedteated
choco install -y driverbooster
choco install -y iobit-uninstaller
choco install -y steam
choco install -y vscode
choco install -y miniconda3
choco install -y virtualbox
choco install -y github-desktop

@REM セキュリティ設定を元に戻す
powershell Set-ExecutionPolicy Restricted

ECHO "すべての処理が完了しました。"
PAUSE