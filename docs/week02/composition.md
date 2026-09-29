# Justifikasi Komposisi Widget (AFL 1)

## 1. FriendInputSection
* Trigger: Readability dan Reuse. Karena nantinya akan susah dibaca makanya kodenya jadinya dipisah aja dan juga widget ini nanti akan dipersiapkan untuk digunakan berulang untuk menambahkan baris teman
* What state it owns: Stateless
* What events it reports upward: Pasif

## 2. MenuInputSection
* Trigger: Readability dan Reuse. Karena widget ini nantinya akan dipanggil terus untuk membuat textfield baru untuk di isi menu dan harga
* What state it owns: Stateless. 
* What events it reports upward: Pasif.(tombol ikon tambah cuma hiasan)

## 3. TaxDiscountSection
* Trigger: Readability. agar terpisah dari daftar pesanan utama.
* What state it owns: Stateless.
* What events it reports upward: Pasif.

## 4. ReceiptSummary
* Trigger: Readability. Memisahkan area nota dari pengisian. agar mempermudah modifikasi desain kartu nota tanpa menyentuh form input di atasnya.
* What state it owns: Stateless.
* What events it reports upward: Pasif.