cmake_minimum_required(VERSION 3.20)


set(CMAKE_SYSTEM_NAME  Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

set(CPU_TYPE "cortex-a7")
set(CMAKE_EXE_LINKER_FLAGS "-nostdlib -mabi=aapcs -mcpu=${CPU_TYPE} -mthumb -n" CACHE INTERNAL "Linker options")
set(CMAKE_ASM_FLAGS "-gdwarf-2 -O2 -mthumb -fno-builtin -Wall -ffunction-sections -fdata-sections -fomit-frame-pointer -mabi=aapcs -mtune=${CPU_TYPE} -mcpu=${CPU_TYPE}" CACHE INTERNAL "ASM Compiler options")

project(fuckQemu ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(OUTPUT_EXE_NAME ${CMAKE_PROJECT_NAME}.elf)

set(SRC_DIR ${CMAKE_CURRENT_LIST_DIR}/src)
set(LD_SCRIPT_PATH ${CMAKE_CURRENT_LIST_DIR}/ldscript.ld)

add_executable(${OUTPUT_EXE_NAME}
    ${SRC_DIR}/fuck.s
    ${SRC_DIR}/test_data.s
    ${SRC_DIR}/startup.s
)

set_target_properties(${OUTPUT_EXE_NAME} PROPERTIES
        LINK_FLAGS "-T \"${LD_SCRIPT_PATH}\""
)