cd %~dp0

copy YggdraHack.gba YggdraHack_EngTrans.gba

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0YggdraHack_EngTrans.gba" "-input:%~dp0ROM Buildfile.event"

pause
