@echo off

rem win10����C���X�g�[�����̃��[�U�ݒ�

rem windows���C���X�g�[������Ă���t�H���_���J�����g��
pushd C:\

rem �O��̃R�}���h���s���ʂ�����
cls


rem -----���[�U�ݒ�̕ύX-----------
echo ���[�U�ݒ��ύX���܂��B^
     �ύX�������ԍ���I��ł��������B
echo 1:�J����
echo 2:�}�C�N
echo 3:�ʒm 
echo 4:�A�J�E���g���
echo 5:�A����
echo 6:�J�����_�[
echo 7:�ʘb����
echo 8:���[��
echo 9:�^�X�N
echo 10:���b�Z�[�W���O
echo 11:����
echo 12:�ق��̃f�o�C�X�Ƃ̓���
echo 13:�o�b�N�O���E���h�A�v��
echo 14:�A�v���̐f�f
echo 15:���ׂ�"Yes!!"
echo 16:���ׂ�"No..."
echo ���̑�:�I��
set setting=
set /p setting=
if not '%setting%'=='' (
	set /a condition=setting
	set AllSettingKey=0
	call :loop
)

rem -----���ꂼ��̐ݒ�ւ̏�������-----
:loop
	rem -----���ׂ�Yes-----
	if '%setting%'=='15' (
		set setting=1
		set condition=14
		set AllSettingKey=y
	)
	rem -----���ׂ�No-----
	if '%setting%'=='16' (
		set setting=1
		set condition=14
		set AllSettingKey=n
	)
	rem -----�e��ݒ�-------
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
	
	rem �ϐ��usetting�v��1�𑫂�
	set /a setting+=1
	
	rem �ϐ��usetting�v���ucondition�v���傫����΃v���O�������I������
	if %setting% gtr %condition% goto :quit
	
	rem ���ꂼ��̕ϐ��̒l��\��
	echo �usetting�v�̒l��%setting%, �ucondition�v�̒l��%condition%, �uAllSettingKey�v�̒l��%AllSettingKey%�ł��B
	
	goto :loop


rem -----�I��-----
:quit
	echo �I�����܂�
	pause
	exit



rem -----�J�����̎g�p�ݒ�-----
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
	echo �A�v���ɃJ�����̎g�p�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Camera_yes
	if '%userkey%'=='n' call :Camera_no
	exit /b
	
	rem "yse"�̏ꍇ�̏���
	:Camera_yes
	echo Camera yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Camera_no
	echo Camera no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�}�C�N�̎g�p�ݒ�-----
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
	echo �A�v���Ƀ}�C�N�̎g�p�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Microphone_yes
	if '%userkey%'=='n' call :Microphone_no
	exit /b
	
	rem "yse"�̏ꍇ�̏���
	:Microphone_yes
	echo Microphone yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Microphone_no
	echo Microphone no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�A�v���̒ʒm�ݒ�-----
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
	echo �ʒm�ւ̃A�N�Z�X�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :tuuti_yes
	if '%userkey%'=='n' call :tuuti_no
	exit /b
	
	rem "yse"�̏ꍇ�̏���
	:tuuti_yes
	echo tuuti yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:tuuti_no
	echo tuuti no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{52079E78-A92B-413F-B213-E8FE35712E72}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�A�J�E���g���ւ̃A�N�Z�X�ݒ�-----
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
	echo �A�J�E���g���ւ̃A�N�Z�X�̂������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Account_yes
	if '%userkey%'=='n' call :Account_no
	exit /b
	
	rem "yse"�̏ꍇ�̏���
	:Account_yes
	echo Account yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Account_no
	echo Account no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�A����ւ̃A�N�Z�X�ݒ�-----
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
	echo �A����ւ̃A�N�Z�X�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :renraku_yes
	if '%userkey%'=='n' call :renraku_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:renraku_yes
	echo renraku yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:renraku_no
	echo renraku no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{7D7E8402-7C54-4821-A34E-AEEFD62DED93}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�J�����_�[�ւ̃A�N�Z�X�ݒ�-----
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
	echo �J�����_�[�ւ̃A�N�Z�X�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Calendar_yes
	if '%userkey%'=='n' call :Calendar_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:Calendar_yes
	echo Calendar yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Calendar_no
	echo Calendar no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�ʘb�����ւ̃A�N�Z�X�ݒ�-----
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
	echo �ʘb�����ւ̃A�N�Z�X�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :CallHistory_yes
	if '%userkey%'=='n' call :CallHistory_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:CallHistory_yes
	echo CallHistory yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:CallHistory_no
	echo CallHistory no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{8BC668CF-7728-45BD-93F8-CF2B3B41D7AB}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----���[���ւ̃A�N�Z�X�ݒ�-----
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
	echo ���[���ւ̃A�N�Z�X�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Mail_yes
	if '%userkey%'=='n' call :Mail_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:Mail_yes
	echo Mail yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Mail_no
	echo Mail no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{9231CB4C-BF57-4AF3-8C55-FDA7BFCC04C5}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�^�X�N�ւ̃A�N�Z�X�ݒ�-----
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
	echo �^�X�N�ւ̃A�N�Z�X�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :renraku_yes
	if '%userkey%'=='n' call :renraku_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:Task_yes
	echo Task yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Task_no
	echo Task no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E390DF20-07DF-446D-B962-F5C953062741}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----���b�Z�[�W�̓ǂݎ��⑗�M�ݒ�-----
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
	echo ���b�Z�[�W�̓ǂݎ��⑗�M�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Message_yes
	if '%userkey%'=='n' call :Message_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:Message_yes
	echo Message yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Message_no
	echo Message no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�A�v���̖������g�����f�[�^����M�ݒ�-----
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
	echo �A�v���̖������g�����f�[�^����M�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Musen_yes
	if '%userkey%'=='n' call :Musen_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:Musen_yes
	echo Musen yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Musen_no
	echo Musen no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----���̃f�o�C�X�Ƃ̓����ݒ�-----
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
	echo ���̃f�o�C�X�Ƃ̎����I�ȏ�񋤗L�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :Sync_yes
	if '%userkey%'=='n' call :Sync_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:Sync_yes
	echo Sync yes
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Sync_no
	echo Sync no
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b


rem -----�o�b�N�O���E���h�A�v���̎��s�ݒ�-----
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
	echo �o�b�N�O���E���h�ŃA�v���̋N���������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :BackGroundApp_yes
	if '%userkey%'=='n' call :BackGroundApp_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:BackGroundApp_yes
	echo BackGroundApp yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "0" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:BackGroundApp_no
	echo BackGroundApp no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
		exit /b
	
	
rem -----�A�v���̐f�f���ւ̃A�N�Z�X-----
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
	echo �A�v���̐f�f���ւ̃A�N�Z�X�������܂���? y/n
	set userkey=
	set /p userkey=
	if not '%userkey%'=='' set userkey=%userkey:~0,1%
	if '%userkey%'=='y' call :AppSindan_yes
	if '%userkey%'=='n' call :AppSindan_no
	exit /b
	
	rem "yes"�̏ꍇ�̏���
	:AppSindan_yes
	echo AppSindan yes
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Allow" /f
		exit /b
	
	rem "no"�̏ꍇ�̏���
	:Appsindan_no
	echo AppSindan no
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f
		exit /b
