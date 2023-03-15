@echo off

IF %3==turbo_bios (
    SET file_ext=bin
) ELSE (
   SET file_ext=com
)

nasm -f bin %2 -o bin\%3.%file_ext%
python %1\patch.py --patch %1\%3.fil --target bin\%3.%file_ext%