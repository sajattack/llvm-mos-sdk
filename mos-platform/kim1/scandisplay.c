
void scandisplay(unsigned char a, unsigned char b, unsigned char c) {
    asm(
       "sta     $F9             ; Rightmost display data \
        stx     $FA             ; Middle display data \
        sty     $FB             ; Leftmost display data \
        jmp     $1F1F           ; KERNAL display routine "
        : "+a"(a), "+x"(b), "+y"(c)  
        : : 
    );
}
