    .x64
    .model flat
    .code

start:
or  rax, 0FFFFFFFF11111111h   ;ok => Error A2237: Constant value too large
and rax, -5                   ;ok => valid
and eax, -1                   ;ok => valid
mov eax, 0xFFFFFFFF           ;ok => Error A2237: Constant value too large

or  rax, 0x7fffffff           ;ok => valid
or  rax, 0x80000000           ;ok => Error A2237: Constant value too large

or  rax, 99999999h            ;ok => Error A2237: Constant value too large
cmp rax, 99999999h            ;ok => Error A2237: Constant value too large
add rax, 99999999h            ;ok => Error A2237: Constant value too large

or  rax, 0FFFFFFFF11111111h   ;ok => Error A2237: Constant value too large
cmp rax, 0FFFFFFFF11111111h   ;ok => Error A2237: Constant value too large
add rax, 0FFFFFFFF11111111h   ;ok => Error A2237: Constant value too large

mov  rax, 0x8000000000000007  ;ok => valid
cmp  rax, 0x8000000000000007  ;ok => Error A2237: Constant value too large
or   rax, 0xffffffff0         ;ok => Error A2237: Constant value too large
or   rax, 8000000000000000h   ;ok => Error A2237: Constant value too large
mov  rax, 8000000000000000h   ;ok => valid as 48 B8 00 00 00 00 00 00 00 80    movabs rax, 0x8000000000000000
and  rax, 8000000000000000h   ;ok => Error A2237: Constant value too large
test rax, 800000000000000h    ;ok => Error A2237: Constant value too large
test rax, 8000000000000000h   ;ok => Error A2237: Constant value too large
test rax, 80000000000000000h  ;ok => Error A2237: Constant value too large
mov  rax, 80000000000000000h  ;ok => Error A2237: Constant value too large

end start
