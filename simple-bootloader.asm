 ;EddOS
 ;2020 - 2021

 format binary as "img"
 use16
 org 0x7C00

 label interfata
 label reset
 mov ah, 0eh
 mov al, 7d
 int 10h
 int  10h

 mov ah, 01h
 mov cl, 07h
 mov ch, 0h
 int 10h

 mov ax, 1003h
 mov bl, 0x00
 mov bh, 0
 int 10h
 mov ax, 0h
 mov ah, 06h
 xor al, al
 xor cx, cx
 mov dx, 184fh
 mov bh, 83h
 int 10h


 mov ah, 02h
 mov bh, 0h
 mov dh, 0h
 mov dl, 0h


 int 10h

 mov ah, 0eh
 mov al, 178d
 int 10h

 mov ah, 02h
 mov dl, 01h
 int 10h

 mov ah, 09h
 mov al, 254d
 mov bx, 001ah

 mov cx, 0001d

 int 10h

 mov ah, 02h
 mov dl, 02h
 int 10h

 mov ah, 09h

 mov al, ']'
 mov bx, 001fh
 mov cx, 0001d
 int 10h

 mov bx, 0013h

 mov ah, 02h
 mov bh, 0h
 mov dh, 0h
 mov dl, 49h
 int 0h

 mov dl, 03h
 int 10h


 mov ah, 0eh
 mov al, 16d
 int 10h

 mov ah, 09h
 mov al, 176d
 mov cx, 76d

 int 10h

 mov ah, 02h
 mov dl, 4ah
 int 10h


 mov bh, 0h
 mov dh, 2h
 mov dl, 0h
 int 10h

 mov ah, 09h

 mov al, 223
 mov bx, 0080h
 mov cx, 0001d
 int 10h

 mov ah, 02h
 mov bh, 0h
 mov dh, 2h
 mov dl, 6h
 int 10h

 mov ah, 09h
 mov cx, 00074d
 int 10h

 mov ah, 02h
 mov bh, 0h
 mov dh, 18h
 mov dl, 0h

 int 10h

 mov ah, 0eh
 mov al, 'E'
 int 10h

 mov al, 'd'
 int 10h

 mov al, 'd'
 int 10h

 mov al, 'O'
 int 10h


 mov al, 'S'
 int 10h

 mov ah, 02h
 mov bh, 0h
 mov dh, 3h
 mov dl, 1h
 int 10h


 mov ah, 02h
 mov bh, 0h
 mov dh, 1h
 mov dl, 0h
 int 10h
 mov bl, 3h
 mov cl, 3h
 jmp _timp

 _edd:
 mov ah, 02h

 cmp cl, 1h
 je _crctX1

 cmp cl, 17h
 je _crctX2


 mov dl, bl
 mov dh, cl

 int 10h
 int 10h

 mov ah, 00h
 int 16h

 cmp al, 77h
 je _sus

 cmp al, 73h
 je _jos

 cmp al, 61h
 je _stanga

 cmp al, 64h
 je _dreapta

 cmp al, 65h
 je _bip

 cmp al, 72h
 je _timp

 cmp al, 70h
 je _urgenta

 jmp _edd

 _crctX1:

 mov cl, 2h
 jmp _edd

 _crctX2:

 mov cl, 16h
 jmp _edd

 _sus:
 dec cl
 cmp cl, 2
 jg mousejos
 jmp _edd


 _jos:
 inc cl
 cmp cl, 3
 je nu
 cmp cl, 21
 jng mousejos
 label labeljos
 jmp _edd
 _stanga:
 dec bl
 cmp cl, 2
 jg mousejos
 ;mov ah, 02h
 ;mov dl, bl
 ;mov dh, cl
 ;int 10h
 ;mov ah, 0eh
 ;mov al, 178d
 ;int 10h


 jmp _edd

 _dreapta:
 inc bl
 cmp cl, 2
 jg mousedrj

 ;mov al, 178d
 ;int 10h
 ;jmp _edd

 _bip:
 mov ah, 0eh
 mov al, 7d
 int 10h

 jmp _edd

 _reset:
 mov bl, 3h
 mov cl, 3h
 mov ah, 02h
 jmp _edd

 _urgenta:
 jmp interfata

 _timp:

 mov dl, 00h
 mov dh, 01h
 mov ah, 02h
 int 10h
 mov ah, 09h
 mov al, 23d
 mov bx, 0071h
 mov cx, 0001d
 int 10h

 mov bx, 0d

 mov dl, 01h
 mov dh, 01h
 mov ah, 02h
 int 10h

    label bruh

 int 1ah
 mov ax, cx
 mov cx, 4
 urmator:
 inc bx
 cmp bx, 3d
 je douapuncte
 label continuare
 push cx
 mov cl, 4
 rol ax, cl
 push ax
 and al, 0fh
 add al, '0'
 cmp al, '9'
 jle final

  add al, 'a'-'9'-1
      final:
  mov ah, 0eh
  int 10h
  pop ax
  pop cx
  loop urmator
  mov     ah, 09h

 mov al, ']'
 mov bx, 001fh
 mov cx, 0001d
 int 10h

 mov ah, 02h
 mov bh, 0h
 mov dh, 1h
 mov dl, 7h
 int 10h


 mov ah, 09h

 mov al, 205
 mov bx, 0019h
 mov cx, 0073d
 int 10h

  jmp _reset
  douapuncte:
   mov bh, ah
   mov ah, 0eh
   mov al, ':'
   int 10h
   mov ah, bh
   jmp continuare
  mousejos:
   mov ah, 0eh
   mov al, ' '
   int 10h
   label nu
   mov ah, 02h
   mov dh, cl
   mov dl, bl
   int 10h
   mov ah, 0eh
   mov al, 178d
   int 10h
   jmp labeljos
   mousedrj:
   mov ah, 0eh
 mov al, ' '
 int 10h
 jmp mousejos

 times 510-($-$$)db 0
 dw 0xAA55
