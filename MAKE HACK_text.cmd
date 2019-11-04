cd %~dp0

copy YggdraHack.gba YggdraHack_EngTrans.gba

cd "%~dp0Text"

echo: | (text-process-classic text_buildfile.txt --parser-exe "%~dp0Event Assembler/Tools/ParseFile.exe")

cd "%~dp0Event Assembler"

Core A FE8 "-output:%~dp0YggdraHack_EngTrans.gba" "-input:%~dp0ROM Buildfile.event"

cd ".."

start /w FEBuilder/FEBuilderGBA.exe --translate --fromrom=YggdraHack_EngTrans.gba --torom=FE8_Clean.gba --importfont YggdraHack_EngTrans.gba

pause
