.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib C:\Users\денис\Desktop\лабы\KDA-2024_2.0\KDA-2024\Debug\KDA-2024_LIB.lib

ExitProcess PROTO:DWORD 
SYSPAUSE PROTO 
soutl PROTO : BYTE 
noutl PROTO : SDWORD 
_pow PROTO  : SDWORD, : SDWORD 
_abs PROTO  : SDWORD 
_compare PROTO  : BYTE, : BYTE 

.STACK 4096

.CONST
	null_division BYTE 'ERROR: DIVISION BY ZERO', 0
	OVER_FLOW BYTE 'ERROR: OVERFLOW', 0
	true BYTE '1', 0
	false BYTE '0', 0
	empty_string BYTE 0
	short0 SDWORD -1
	short1 SDWORD 0
	str2 BYTE "str1", 0
	str3 BYTE "str2", 0
	str4 BYTE "Функция сравнения строк:", 0
	str5 BYTE "Арифм. операции:", 0
	short6 SDWORD 5
	short7 SDWORD 5
	str8 BYTE "Контрольный пример выражения: ", 0
	short9 SDWORD 5
	short10 SDWORD 11
	short11 SDWORD 2
	short12 SDWORD 178
	short13 SDWORD 19
	short14 SDWORD 255
	short15 SDWORD 19
	str16 BYTE "FFH + 23O = ", 0
	str17 BYTE "Вызов функции:", 0
	short18 SDWORD -4
	short19 SDWORD 3
	short20 SDWORD 32760
	short21 SDWORD 32760
	str22 BYTE "Условный оператор:", 0
	short23 SDWORD 0
	str24 BYTE "positive", 0
	short25 SDWORD 1
	str26 BYTE "negative", 0
	short27 SDWORD -1
	bool28 DWORD 0
.DATA
	res10 SDWORD 0
	str150 DWORD empty_string
	str250 DWORD empty_string
	res50 SDWORD 0
	i50 SDWORD 0
	asd50 SDWORD 0
	num50 SDWORD 0
	num150 SDWORD 0
	num250 SDWORD 0
	c50 SDWORD 0
	flag50 DWORD 0

.CODE

func1 PROC b1 : SDWORD, a1 : SDWORD
	push short0
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov res10, eax
	mov eax, a1
	cmp eax, short1
	jl ifi1
	jge else1
ifi1:
	push a1
	call _abs
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov res10, eax
	jmp ifEnd1
else1:
	push a1
	push b1
	call _pow
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov res10, eax
ifEnd1:
	push res10
	jmp local0
local0:
	pop eax
	ret
func1 ENDP

main PROC
	push offset str2
	pop str150

	push offset str3
	pop str250


push offset str4
call soutl
	push str250
	push str150
	call _compare
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov res50, eax

push res50
call noutl

push offset str5
call soutl
	push short6
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov i50, eax
	push short7
	push i50
	push i50
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop ebx
	pop eax
	cmp ebx,0
	je SOMETHINGWRONG
	cdq
	idiv ebx
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov asd50, eax

push asd50
call noutl

push offset str8
call soutl
	push short9
	push short10
	push short11
	call _pow
	push eax
	push short12
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop eax
	pop ebx
	mul ebx
	push eax
	push short13
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov i50, eax

push i50
call noutl
	push short14
	push short15
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov i50, eax

push offset str16
call soutl

push i50
call noutl

push offset str17
call soutl
	push short18
	push short19
	call func1
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov num50, eax

push num50
call noutl
	push short20
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov num150, eax
	push short21
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov num250, eax
	push num150
	push num250
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov num150, eax

push num150
call noutl

push offset str22
call soutl
	mov eax, i50
	cmp eax, short23
	jz ifi2
	jnz else2
ifi2:

push offset str24
call soutl
	push short25
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov c50, eax
	jmp ifEnd2
else2:

push offset str26
call soutl
	push short27
	pop eax
	cmp eax, 32767
	jg overflow
	cmp eax, -32768
	jl overflow
	mov c50, eax
ifEnd2:

push c50
call noutl
	push bool28
	pop flag50

	call SYSPAUSE
	push 0
	call ExitProcess
SOMETHINGWRONG::
	push offset null_division
	call soutl
jmp THEEND
overflow::
	push offset OVER_FLOW
	call soutl
THEEND:
	call SYSPAUSE
	push -1
	call ExitProcess
main ENDP
end main