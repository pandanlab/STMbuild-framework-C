ENTRY(Reset_Handler)

MEMORY
{
    FLASH(rx) : ORIGIN = 0x08001000, LENGTH = 64K
    SRAM(rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}

__min_heap_size = 0x400;
__min_stack_size = 0x200;

SECTIONS
{
    .text :
    {
        KEEP(*(.isr_vector))
        *(.text*)
        *(.rodata*)
        _etext = .;
    } > FLASH
    
    .data :
    {
        _sdata = .;
        *(.data*)
        _edata = .;
    } > SRAM AT > FLASH
    
    .bss :
    {
        _sbss = .;
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } > SRAM
    
    /DISCARD/ :
    {
        *(.comment*)
        *(.ARM.attributes)
    }
}
