#!/usr/bin/env bash
# created by @luisadha

randomnumber="$$"

echo 'Alat membuat 12 Karakter untuk Kata-sandi'
echo ' '
echo -e "Cara Kerja:\n Kata-sandi akan disimpan di situs transfer.sh selama 14 hari. \nPerhatikan bahwa anda harus mengingat link dibawah agar dapat mengakses Kata-sandi anda yang baru saja dibuat. Dan Tolong jangan Beritahu/bagikan link ini ke Siapapun!."
echo
for ((n=0;n<12;n++))
do dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-12
done | tail -n 1 > $randomnumber.txt
curl ${STOREDLINK:="--upload-file ./$randomnumber.txt https://transfer.sh/$randomnumber.txt"}
echo
echo "Tautan ini berisi Kata-sandi dan akan kadaluarsa selama 14 hari";

rm -f $randomnumber.txt
