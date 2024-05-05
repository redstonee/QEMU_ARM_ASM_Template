.syntax unified
.cpu cortex - a7
.thumb

/* start address for the initialization values of the .data section. defined in linker script */
    .word _sidata
/* start address for the .data section. defined in linker script */
    .word _sdata
/* end address for the .data section. defined in linker script */
    .word _edata
/* start address for the .bss section. defined in linker script */
    .word _sbss
/* end address for the .bss section. defined in linker script */
    .word _ebss

.global Reset_Handler
.global Default_Handler
.global g_pfnVectors

.section .text.Reset_Handler
.type Reset_Handler, % function
Reset_Handler:
    /* Initialize the stack pointer */
    ldr r0, =_estack
    mov sp, r0
    
    ldr r0, =_sdata
    ldr r1, =_edata
    ldr r2, =_sidata
    movs r3, #0
    b LoopCopyDataInit

CopyDataInit:
    ldr r4, [r2, r3]
    str r4, [r0, r3]
    adds r3, r3, #4

LoopCopyDataInit:
    adds r4, r0, r3
    cmp r4, r1
    bcc CopyDataInit

/* Zero fill the bss segment. */
    ldr r2, =_sbss
    ldr r4, =_ebss
    movs r3, #0
    b LoopFillZerobss

FillZerobss:
    str r3, [r2]
    adds r2, r2, #4

LoopFillZerobss:
    cmp r2, r4
    bcc FillZerobss

    // Call main
    bl main

.section .text.Default_Handler, "ax", % progbits
.size Default_Handler, . - Default_Handler
Default_Handler:
infinite_loop:
    b infinite_loop

.section .isr_vector, "a", % progbits
.type g_pfnVectors, % object
.size g_pfnVectors, . - g_pfnVectors
g_pfnVectors:
    .word Reset_Handler
    .word Undefined_Handler
    .word SWI_Handler
    .word Prefetch_Abort_Handler
    .word Data_Abort_Handler
    .word 0
    .word IRQ_Handler
    .word FIQ_Handler

.weak Undefined_Handler
.thumb_set Undefined_Handler, Default_Handler

.weak SWI_Handler
.thumb_set SWI_Handler, Default_Handler

.weak Prefetch_Abort_Handler
.thumb_set Prefetch_Abort_Handler, Default_Handler

.weak Data_Abort_Handler
.thumb_set Data_Abort_Handler, Default_Handler

.weak IRQ_Handler
.thumb_set IRQ_Handler, Default_Handler

.weak FIQ_Handler
.thumb_set FIQ_Handler, Default_Handler
