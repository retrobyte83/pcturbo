�f PCturbo-286e System Version 1.26  $
(C) Copyright 1986 More Computing. All Rights Reserved.
$Z�126            � �          ---stack base---ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss 
Cannot access the PCturbo-286e Card. Please check all
board jumpers and try again.

$Error in command argument string: $                                  $
PCturbo-286e Card not responding. Please check all board
jumpers and try again.

$
STARTUP ERROR - cannot access daughtercard memory as configured.

This TURBO.COM has been configured for a memory daughtercard acting
as AT-style expansion memory, but the daughtercard cannot be accessed.
Check the main board's 1M / 2M jumper (should be 2M), and re-install.

$Cannot open/read file 286BIOS.BIN
$Internal format error - 286 Bios code missing
$EMMXXXX0 
STARTUP ERROR - Extended Memory (EMM) driver installed at same memory
                segment address as TURBO.COM.

                Please RE-INSTALL your PCturbo-286e system software.

$Already executing on the PCturbo-286!
$Now executing on host machine.
$Turbo Already Loaded. (/! option used. Use Alt-grey+ to swap)
$PCMAIN: Interface Error - Unexpected command interrupt
$PCMAIN: Interface Error - Spurious int 7 occurred
$STARTUP ERROR - Not enough memory to load program.
$286BIOS.BIN PCturbo-286TURBO Command Software Configuration:
$   Dual Port Memory Address .... $:0 (hex)
$   I/O Port Address ............ $ to $   Interrupt Request Line ...... $   Fast color/graphics update .. $   Hard Disk boot flag ......... $ON
$OFF
$   DOS Memory Size on PCturbo... $   Hercules Mono Graphics Adapter Installed$   Orchid DBUS EGA Card Installed$   Memory Daughtercard Installed as AT memory$   Memory Daughtercard Installed as EMS memory$Hit Any Key to Continue...$Initializing 1 Meg DaughterCard...$                                  $The /S option of the turbo command is not currently supported.
$**** Coprocessing Version of PCturbo-286e System ***** 
**                                                  ** 
**     YOU MUST READ the DISK Warning in the        ** 
**     \ADVANCED\README file before doing any       ** 
**     co-processing OR you may LOSE DISK DATA.     ** 
**                                                  ** 
****************************************************** 
$     COMPAQ                                                                                                                                                           �  �Ȏ؎����������м��������*���� ����
� �u����� �  ��&�>8 ���e� ��u���� � �������	� ��u
��r�� �< u����� �� =�!r�A�g�� u�� �% �9�u��i� �>l t���Z�3
�T�>�u���G�t
�A�>�t���	�2� �>uu
�J��V�������&��>o t���� ��!��  �޿�� ���>�tH��������
� �u/�d &����&�>��Z��u&����&�>����u������d��x���x���x�� �x��� ������&�  �Z&� Z�&�>  �Zu&�> Z�u�	����A� ��	�9� �t
�1� ORCHID CGA EMULORCHID HGC FULL          ��  �  s�� �� �~ �S Ã>�u� � ø  ��&�> � t�  ��&�>@ � t���þ�� t���	 u����Ë>�� ��Ë>�1����&�� &�E�
 &�E�@ &�E�B ��1���&� ���É���&�@ ���É��1������&� ��&�
 ��&�@ ��&�B �ú�� �ú�������!�  �Ǿ�� ����PSVU� .�<$t��F��]^[X�.������.����� �.����.����.�����.�� 06/05/87$       PCturbo-286 Internal Error: No request blocks avaliable.
$PCturbo-286 Internal Error: Unknown cause.
$*************************************************************************
* A HARDWARE ERROR (PARITY CHECK) has occured on the PCturbo-286 Board. *
* This condition REQUIRES that the machine be RESET and a diagnostic    *
* run to try and determine the failure cause (See User Manual).         *
*                                                                       *
* This error makes continued operation of the PCturbo-286 UNRELIABLE.   *
* You should therefore REBOOT (Ctl-Alt-Del) the system IMMEDIATELY.     *
*                                                                       *
* If you have up-to-date BACKUPS of ALL DATA ON THIS SYSTEM, and want   *
* to attempt to save work in progress on the PCturbo, you may attempt   *
* to continue by pressing the F1 key. SAVE your WORK IMMEDIATELY on a   *
* SCRATCH FLOPPY ONLY then REBOOT AS SOON AS POSSIBLE !!                *
* Continued operation is UNRELIABLE and should be attemped ONLY with    *
* proper backup and if the work in progress is irreproducible.          *
*************************************************************************
$PCMAIN: Interface Error - Unknown PID $ �                                      	.�|�.�#!4	.�#!Z[X�����PCturbo-286e