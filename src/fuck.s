.syntax unified
.cpu cortex-a7
.thumb


.global main
.section .text
.type main, %function
main:
    .equ Shit, 0x40010000

    ldr r0, =test_data
    ldr r1, =Shit

    ldrb r2, [r0]
    ldrb r3, [r0, #1]
    adds r2, r2, r3
    ldrb r3, [r0, #2]
    adds r2, r2, r3

    str r2, [r1]

