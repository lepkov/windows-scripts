FOR %%a IN (02 03 04 05 06 08 09 10 11 12 13 15 16 17 18 19 20 22 23 24 25 26 27 29 30 31) DO ForFiles /p "D:\data\backup1C" /s /D -30 /M *%%a.*.*.7z /c "cmd /c del @path"
