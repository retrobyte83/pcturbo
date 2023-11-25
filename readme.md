This repository contains the following resources related to the Orchid PCturbo-286e accelerator card.

### turbo.com

This contains a reasonably complete disassembly of the "turbo.com" driver that is used to activate and interact with the board. It was created using IDA and has been fixed-up to be compatible with being built with NASM. There is an optional post-build step that will adjust for the compilation differences compared to MASM, to make it identical to the original binary.
NOTE: This disassembly still has issues with references in the code and cannot be modified arbirtarily and still be expected to generate a working executable.

### turbo_bios.bin

This is a partial disassembly of the 8K bios image that is copied across to the board by turbo.com during initialisation. It can be compiled to the correct binary image but cannot be modified and still be expected to work.

### turbochk.com

This is a minimal code path from turbo.com that runs to the point that the board is initialised enough to accept the bios image being copied across. It expects to be able to use E000h for the shared memory location and the board jumpers to be IO 300h, IRQ 7.

### Schematic

Partial schematic of the Revision 1 PCturbo board, plus minimal schematics showing the ICs involved in the 286 CPU reset and timer circuits for Revision 1 and Revision 2 boards.
