;D:\masm32\bin\ml /c /Zd /coff simplecaculator.asm
;D:\masm32\bin\Link /SUBSYSTEM:CONSOLE simplecaculator.obj
;simplecaculator.exe
.386
.model flat,stdcall
option casemap :none
include D:\masm32\include\windows.inc
include D:\masm32\include\masm32.inc
include D:\masm32\include\msvcrt.inc
include D:\masm32\include\kernel32.inc


includelib D:\masm32\lib\masm32.lib
includelib D:\masm32\lib\msvcrt.lib
includelib D:\masm32\lib\kernel32.lib

.data
dong1 db "1.x+y ",10,0
dong2 db "2.x-y ",10,0
dong3 db "3.x*y ",10,0
dong4 db "4.x/y ",10,0
dong5 db "5.Thoat ",10,0
nhapdong db "Lua chon cua ban",10,0
nhapx db "Nhap x: ",0
nhapy db "Nhap y: ",0
xuat db "Ket qua la: ",0
matherror db "so nhap co van de",0
int_format db "%d",0
integer db "Ket qua la: %d",0
.data?
x dword ?
y dword ?
chon dword ?
ketqua dword ?
nho dword ?


.code 
main:
; in ra menu lua chon
    push offset dong1
    call crt_printf
    add esp,8
    push offset dong2
    call crt_printf
    add esp,8
    push offset dong3
    call crt_printf
    add esp,8
    push offset dong4
    call crt_printf
    add esp,8
    push offset dong5
    call crt_printf
    add esp,8
    push offset nhapdong
    call crt_printf
    add esp,8
;chon phep tinh
    push offset chon
    push offset int_format
    call crt_scanf
    add esp,8
;nhap x,y
    push offset nhapx
    call crt_printf
    add esp,8

    push offset x
    push offset int_format
    call crt_scanf
    add esp,8
   
    push offset nhapy
    call crt_printf
    add esp,8

    push offset y
    push offset int_format
    call crt_scanf
    add esp,8
;thuc hien phep tinh
    cmp chon,1
    je cong
    cmp chon,2
    je tru
    cmp chon,3
    je nhan 
    cmp chon,4
    je chia
    cmp chon,5
    je exit
cong:
    mov eax,x
    add eax,y
    mov ketqua,eax
    push dword ptr ketqua
    push offset integer
    call crt_printf
    jmp exit
tru:   
    mov eax,x
    sub eax,y
    mov ketqua,eax
    push dword ptr ketqua
    push offset integer
    call crt_printf
    jmp exit
nhan:
    mov eax,x
    mov ebx,y
    mul ebx
    mov ketqua,eax
    push dword ptr ketqua
    push offset integer
    call crt_printf
    jmp exit
chia:
    cmp y,0
    je enrror
    jne thuchien
thuchien:
    mov eax,x
    mov ebx,y
    xor edx,edx
    div ebx
    mov ketqua,eax
    mov nho,edx
    push dword ptr ketqua
    push offset integer
    call crt_printf
    jmp exit
enrror:
    push offset matherror
    call crt_printf
exit:
    push 0
    call ExitProcess
end main 
