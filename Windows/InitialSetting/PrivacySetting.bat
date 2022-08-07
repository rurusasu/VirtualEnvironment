@echo off

rem win10初回インストール時のユーザ設定

rem windowsがインストールされているフォルダをカレントに
pushd C:\

rem 前回のコマンド実行結果を消去
cls


rem -----ユーザ設定の変更-----------
echo ユーザ設定を変更します。^
     変更したい番号を選んでください。
echo 1:カメラ
echo 2:マイク
echo 3:通知 
echo 4:アカウント情報
echo 5:連絡先
echo 6:カレンダー
echo 7:通話履歴
echo 8:メール
echo 9:タスク
echo 10:メッセージング
echo 11:無線
echo 12:ほかのデバイスとの同期
echo 13:バックグラウンドアプリ
echo 14:アプリの診断
echo 15:すべて"Yes!!"
echo 16:すべて"No..."
echo その他:終了
set setting=
set /p setting=
if not '%setting%'=='' (
	set /a condition=setting
	set AllSettingKey=0
	call :loop
)

rem -----それぞれの設定への条件分岐-----
:loop
	rem -----すべてYes-----
	if '%setting%'=='15' (
		set setting=1
		set condition=14
		set AllSettingKey=y
	)
	rem -----すべてNo-----
	if '%setting%'=='16' (
		set setting=1
		set condition=14
		set AllSettingKey=n
	)
	rem -----各種設定-------
	if '%setting%'=='1' call :Camera
	if '%setting%'=='2' call :Microphone
	if '%setting%'=='3' call :tuuti
	if '%setting%'=='4' call :Account
	if '%setting%'=='5' call :renraku
	if '%setting%'=='6' call :Calendar
	if '%setting%'=='7' call :CallHistory
	if '%setting%'=='8' call :Mail
	if '%setting%'=='9' call :Task
	if '%setting%'=='10' call :Messaging
	if '%setting%'=='11' call :Musen
	if '%setting%'=='12' call :Sync
	if '%setting%'=='13' call :BackGroundApp
	if '%setting%'=='14' call :AppSindan
	
	rem 変数「setting」に1を足す
	set /a setting+=1
	
	rem 変数「setting」が「condition」より大きければプログラムを終了する
	if %setting% gtr %condition% goto :quit
	
	rem それぞれの変数の値を表示
	echo 「setting」の値は%setting%, 「condition」の値は%condition%, 「AllSettingKey」の値は%AllSettingKey%です。
	
	goto :loop


rem -----終了-----
:quit
	echo 終了します
	pause
	exit



rem -----カメラの使用設定-----
:Camera
	if %AllSettingKey%==y (
		call :Camera_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Camera_no
		exit /b
	)
	echo.
	echo アプリにカメラの使用を許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Camera_yes
	if '%userkey%'=='n' call :Camera_no
	exit /b
	
	rem "yse"の場合の処理
	:Camera_yes
	echo Camera yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Camera_no
	echo Camera no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----マイクの使用設定-----
:Microphone
	if %AllSettingKey%==y (
		call :Microphone_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Microphone_no
		exit /b
	)
	echo.
	echo アプリにマイクの使用を許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Microphone_yes
	if '%userkey%'=='n' call :Microphone_no
	exit /b
	
	rem "yse"の場合の処理
	:Microphone_yes
	echo Microphone yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Microphone_no
	echo Microphone no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----アプリの通知設定-----
:tuuti
	if %AllSettingKey%==y (
		call :tuuti_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :tuuti_no
		exit /b
	)
	echo.
	echo 通知へのアクセスを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :tuuti_yes
	if '%userkey%'=='n' call :tuuti_no
	exit /b
	
	rem "yse"の場合の処理
	:tuuti_yes
	echo tuuti yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:tuuti_no
	echo tuuti no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----アカウント情報へのアクセス設定-----
:Account
	if %AllSettingKey%==y (
		call :Account_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Account_no
		exit /b
	)
	echo.
	echo アカウント情報へのアクセスのを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Account_yes
	if '%userkey%'=='n' call :Account_no
	exit /b
	
	rem "yse"の場合の処理
	:Account_yes
	echo Account yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Account_no
	echo Account no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----連絡先へのアクセス設定-----
:renraku
	if %AllSettingKey%==y (
		call :renraku_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :renraku_no
		exit /b
	)
	echo.
	echo 連絡先へのアクセスを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :renraku_yes
	if '%userkey%'=='n' call :renraku_no
	exit /b
	
	rem "yes"の場合の処理
	:renraku_yes
	echo renraku yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:renraku_no
	echo renraku no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----カレンダーへのアクセス設定-----
:Calendar
	if %AllSettingKey%==y (
		call :Calendar_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Calendar_no
		exit /b
	)
	echo.
	echo カレンダーへのアクセスを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Calendar_yes
	if '%userkey%'=='n' call :Calendar_no
	exit /b
	
	rem "yes"の場合の処理
	:Calendar_yes
	echo Calendar yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Calendar_no
	echo Calendar no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----通話履歴へのアクセス設定-----
:CallHistory
	if %AllSettingKey%==y (
		call :CallHistory_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :CallHistory_no
		exit /b
	)
	echo.
	echo 通話履歴へのアクセスを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :CallHistory_yes
	if '%userkey%'=='n' call :CallHistory_no
	exit /b
	
	rem "yes"の場合の処理
	:CallHistory_yes
	echo CallHistory yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:CallHistory_no
	echo CallHistory no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----メールへのアクセス設定-----
:Mail
	if %AllSettingKey%==y (
		call :Mail_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Mail_no
		exit /b
	)
echo.
	echo メールへのアクセスを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Mail_yes
	if '%userkey%'=='n' call :Mail_no
	exit /b
	
	rem "yes"の場合の処理
	:Mail_yes
	echo Mail yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Mail_no
	echo Mail no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----タスクへのアクセス設定-----
:Task
	if %AllSettingKey%==y (
		call :Task_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Task_no
		exit /b
	)
	echo.
	echo タスクへのアクセスを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :renraku_yes
	if '%userkey%'=='n' call :renraku_no
	exit /b
	
	rem "yes"の場合の処理
	:Task_yes
	echo Task yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Task_no
	echo Task no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----メッセージの読み取りや送信設定-----
:Message
	if %AllSettingKey%==y (
		call :Message_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Message_no
		exit /b
	)
	echo.
	echo メッセージの読み取りや送信を許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Message_yes
	if '%userkey%'=='n' call :Message_no
	exit /b
	
	rem "yes"の場合の処理
	:Message_yes
	echo Message yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Message_no
	echo Message no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----アプリの無線を使ったデータ送受信設定-----
:Musen
	if %AllSettingKey%==y (
		call :Musen_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Musen_no
		exit /b
	)
	echo.
	echo アプリの無線を使ったデータ送受信を許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Musen_yes
	if '%userkey%'=='n' call :Musen_no
	exit /b
	
	rem "yes"の場合の処理
	:Musen_yes
	echo Musen yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Musen_no
	echo Musen no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----他のデバイスとの同期設定-----
:Sync
	if %AllSettingKey%==y (
		call :Sync_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :Sync_no
		exit /b
	)
	echo.
	echo 他のデバイスとの自動的な情報共有を許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Sync_yes
	if '%userkey%'=='n' call :Sync_no
	exit /b
	
	rem "yes"の場合の処理
	:Sync_yes
	echo Sync yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Sync_no
	echo Sync no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----バックグラウンドアプリの実行設定-----
:BackGroundApp
	if %AllSettingKey%==y (
		call :BackGroundApp_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :BackGroundApp_no
		exit /b
	)
	echo.
	echo バックグラウンドでアプリの起動を許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :BackGroundApp_yes
	if '%userkey%'=='n' call :BackGroundApp_no
	exit /b
	
	rem "yes"の場合の処理
	:BackGroundApp_yes
	echo BackGroundApp yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "0" /f
		exit /b
	
	rem "no"の場合の処理
	:BackGroundApp_no
	echo BackGroundApp no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
		exit /b
	
	
rem -----アプリの診断情報へのアクセス-----
:AppSindan
	if %AllSettingKey%==y (
		call :AppSindan_yes
		exit /b
	)
	if %AllSettingKey%==n (
		call :AppSindan_no
		exit /b
	)
	echo.
	echo アプリの診断情報へのアクセスを許可しますか? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :AppSindan_yes
	if '%userkey%'=='n' call :AppSindan_no
	exit /b
	
	rem "yes"の場合の処理
	:AppSindan_yes
	echo AppSindan yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"の場合の処理
	:Appsindan_no
	echo AppSindan no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b
