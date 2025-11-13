# Ensure RP2040 keymaps use the ChibiOS platform instead of inheriting the AVR
# defaults from rules.mk or QMK's global settings.
ifneq ($(filter RP2040,$(strip $(MCU))),)
    # Use a recursive assignment so PLATFORM always reflects the final MCU
    # selection, but allow developers to override it from the command line.
    ifneq ($(origin PLATFORM), command line)
        PLATFORM = chibios
    endif
endif
