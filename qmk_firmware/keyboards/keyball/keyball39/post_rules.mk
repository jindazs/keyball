# SPDX-License-Identifier: GPL-2.0-or-later
#
# Apply MCU-specific defaults after keymaps have had a chance to override the
# MCU/bootloader/platform so RP2040 builds can switch away from the AVR toolchain
# that the stock keymaps use.

# Normalize the MCU name once so we can reuse the predicate.
KEYBALL39_IS_RP2040 := $(filter RP2040,$(strip $(MCU)))

ifeq ($(origin BOOTLOADER), undefined)
    ifneq ($(KEYBALL39_IS_RP2040),)
        BOOTLOADER = rp2040
    else
        BOOTLOADER = caterina
    endif
endif

ifeq ($(origin PLATFORM), undefined)
    ifneq ($(KEYBALL39_IS_RP2040),)
        PLATFORM = chibios
    else
        PLATFORM = avr
    endif
endif
