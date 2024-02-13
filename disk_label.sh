#!/usr/bin/sudo bash
echo "Enter label:"
read LABEL
grub-render-label -t "$LABEL" -f /boot/efi/EFI/grub/fonts/ascii.pf2 -o /boot/efi/EFI/BOOT/.disk_label
