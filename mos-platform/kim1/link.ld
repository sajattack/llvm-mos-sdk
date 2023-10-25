/* Commodore KIM-1 linker script.*/

__ram_size = 1;
__STACKSIZE__ = 0x0080;
STARTADDRESS  = 0x0200;
__rc0 = 0xe0;


INCLUDE imag-regs.ld

MEMORY {
    zp : ORIGIN = 0x00, LENGTH = 0xe0
    ram : ORIGIN = 0x0200, LENGTH = 0x1000 - 0x200
}


/*PROVIDE(irq = _irq_default);*/
/*PROVIDE(nmi = _irq_default);*/


REGION_ALIAS("c_readonly", ram)
REGION_ALIAS("c_writeable", ram)



/*INCLUDE commodore.ld*/
SECTIONS { INCLUDE c.ld }

/* Grow stack downwards from end of RAM */
__stack = (__ram_size * 1024);

OUTPUT_FORMAT {
    /* Tells where to place the file's contents. */
    /*SHORT(nmi)*/
    SHORT(ORIGIN(ram))
    TRIM(ram)
}
