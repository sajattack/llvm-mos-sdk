/* Commodore KIM-1 linker script.*/

__ram_size = 1;
__STACKSIZE__ = 0x0080;
STARTADDRESS  = 0x0200;


INCLUDE imag-regs.ld

MEMORY {
    ram : ORIGIN = 0x0200, LENGTH = 0x1000 - 0x200
}


__rc0 = 0x0002;
INCLUDE imag-regs.ld
ASSERT(__rc31 == 0x0021, "Inconsistent zero page map.")

MEMORY { zp : ORIGIN = __rc31 + 1, LENGTH = 0x90 - (__rc31 + 1) }

SECTIONS {
    INCLUDE c.ld
}


REGION_ALIAS("c_readonly", ram)
REGION_ALIAS("c_writeable", ram)



/*INCLUDE commodore.ld*/

/* Grow stack downwards from end of RAM */
__stack = (__ram_size * 1024);

OUTPUT_FORMAT {
    /* Tells where to place the file's contents. */
    /*SHORT(nmi)*/
    TRIM(ram)
}
