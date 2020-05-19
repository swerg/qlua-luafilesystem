md .bin-tmp\x32
md .bin-tmp\x64-Lua51
md .bin-tmp\x64-Lua53

copy .build\Win32\Release\*.dll .bin-tmp\x32
copy .build\x64\Release\*.dll .bin-tmp\x64-Lua51
copy .build\x64\Release-Lua53\*.dll .bin-tmp\x64-Lua53

copy nul .bin-tmp\ReadMe.txt
echo \x32       -- для QUIK 6.x, 7.x >> .bin-tmp\ReadMe.txt
echo \x64-Lua51 -- для QUIK 8.0-8.4 >> .bin-tmp\ReadMe.txt
echo \x64-Lua53 -- для QUIK 8.5 и далее >> .bin-tmp\ReadMe.txt

del /Q lfs.dll.zip 

cd .bin-tmp
"C:\Program Files\7-Zip\7z.exe" a -r -tZip ..\lfs.dll.zip *.dll ReadMe.txt
cd ..

rd /S /Q .bin-tmp