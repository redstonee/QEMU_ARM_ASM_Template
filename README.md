# Assembly Project Template for QEMU
This is a template project for developing assembly programs using QEMU.  
The project is based on the [QEMU](https://www.qemu.org/) emulator.  
There are configurations for debugging in VS Code with gdb, so you can easily debug your programs.  

Make sure you have installed the following tools:  
- [QEMU](https://www.qemu.org/)
- [CMake](https://cmake.org/)
- [GNU Make](https://www.gnu.org/software/make/) or [Ninja](https://ninja-build.org/)
- [Arm GNU Toolchain](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain)
- [VS Code](https://code.visualstudio.com/) (optional)

**The suffix of `run_qemu` script is `.bat`, however you can also rename it to `.sh` if you're gonna run it on a UNIX-like OS. Don't forget to modify that in [VS Code tasks configuration](.vscode/tasks.json#L13).**