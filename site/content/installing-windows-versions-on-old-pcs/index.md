# Installing Windows versions on old PCs

Installation on a HP/Compaq machine.

# Windows 98

Create a FreeDOS USB boot disk using Rufus: select Freedos from in there, then go.

Download the SATA CDROM driver from here.[ODD_DOS_driver.zip](ODD_DOS_driver.zip)

Unzip the file, then copy the files (excluding folders) to the USB disk just created. This creates a config.sys file with the CDROM driver present.

Boot from the USB disk, and go to the D: drive (or whatever other letter is the CDROM)

Start setup with the keys /nm /is /im /nr

This should start setup.

Sadly enough this hangs after a while with prompts to add diskettes in A: and B: - game over.

Round 2: Easy2Boot

Follow the procedure described on the Easy2boot website: [https://www.youtube.com/watch?v=7\_GEsE2\_j4Y](https://www.youtube.com/watch?v=7_GEsE2_j4Y)

Once you get to the boot without USB drive you get “Insufficient memory to run Windows” because you have 1.5GB of memory, sigh. See this: [https://www.ibm.com/support/pages/windows-9598-error-insufficient-memory-initialize-windows-ibm-intellistation-m-pro-type-6889](https://www.ibm.com/support/pages/windows-9598-error-insufficient-memory-initialize-windows-ibm-intellistation-m-pro-type-6889)

- Boot and press F8, select “Command prompt only”
- CD to \\WINDOWS
- Type “edit system.ini”
- Find the \[386Enh\] section and add:  
MaxPhysPage=3B000
- Save the file
- Reboot

Safe mode still causes a memory error; this can be fixed by using option 4 (step by step), allowing himemx.exe to run to claim memory, then answering “load all device drivers” with NO.

Alternatively, it appears that safe mode uses the file “system.cb” as a system.ini file. Adding the MaxPhysPage setting there might work too.
