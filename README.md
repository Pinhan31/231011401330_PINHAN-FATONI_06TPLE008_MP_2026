# UTS Mobile Programming - Aplikasi Workshop Kampus

**Nama  :**  Pinhan Fatoni  
**NIM   :**  231011401330  
**Kelas :**  06TPLE008

---

## Jawaban Soal 1: Analisis Desain & UX

### 1. Struktur Hirarki Widget (Deep Dive)
Dalam Flutter, saya menggunakan konsep "Widget di dalam Widget" dengan alasan teknis berikut:
* **Scaffold**: Berperan sebagai "kerangka" halaman. Tanpa Scaffold, aplikasi tidak akan memiliki latar belakang standar, sistem navigasi, atau tempat untuk menaruh AppBar.
* **ListView.builder**: Digunakan untuk efisiensi. Berbeda dengan ListView biasa, `.builder` hanya me-render item yang terlihat di layar. Jika ada banyak workshop, aplikasi tidak akan lemot karena Flutter hanya memproses kartu yang sedang dilihat pengguna. Ini juga lebih hemat memori karena menggunakan konsep *recycling* (daur ulang) widget.
* **Kombinasi Column & Row**: `Column` digunakan untuk memberikan alur baca dari atas ke bawah (hirarki utama). Sedangkan `Row` memberikan detail horizontal (ikon + teks) agar informasi tidak memakan terlalu banyak ruang vertikal.

### 2. Alasan Strategis Pemilihan Widget
* **Card (Elevation & Shape)**: Efek bayangan (*elevation*) pada `Card` menciptakan dimensi Z-axis. Secara psikologi desain, ini memberi tahu pengguna bahwa kartu tersebut adalah elemen yang terpisah dari latar belakang dan bisa berinteraksi.
* **SizedBox vs Padding**: `Padding` digunakan untuk membungkus area besar agar konten tidak menyentuh tepi. Sedangkan `SizedBox` digunakan sebagai "spacer" (pengganjal) antar baris teks agar jaraknya konsisten (misal: 8.0 pixel). Ini membuat layout terlihat profesional dan terukur.

### 3. Mengatasi Masalah UI (Problem Solving)
Masalah "tampilan terlalu penuh" ditangani dengan dua teknik utama:
* **White Space (Ruang Kosong)**: Dengan menghindari *Cluttering*, mata pengguna memiliki tempat untuk beristirahat. Informasi yang terlalu berdesakan dapat membuat beban kognitif (*cognitive load*) otak menjadi tinggi.
* **Visual Anchor**: Dengan membuat judul menjadi **Bold** dan lebih besar, tercipta "jangkar visual". Pengguna bisa melakukan *skimming* (membaca cepat) hanya dengan melihat judul sebelum membaca detail lainnya.

### 4. Detail Kenyamanan Baca (UX)
UX adalah tentang bagaimana perasaan pengguna saat menggunakan aplikasi:
* **Ikonografi (Universal Language)**: Ikon adalah bahasa universal. Pengguna bisa mengenali informasi lokasi hanya dengan melihat ikon pin map sebelum membaca teksnya. Ini mempercepat pengambilan informasi.
* **Divider (Garis Pemisah)**: Berfungsi sebagai pemutus logis yang memisahkan antara "Identitas" (Judul Workshop) dengan "Atribut" (Waktu, Tempat, Kuota).
* **Affordance Tombol**: Penggunaan warna indigo kontras dan teks putih pada `ElevatedButton` memberikan instruksi yang jelas (*Call to Action*). Pengguna tidak perlu bingung mencari tempat mendaftar karena tombol adalah elemen paling menonjol.

---

## Jawaban Soal 2: Implementasi Kode Flutter

Jawaban untuk **Soal 2** berupa implementasi kode lengkap yang mewujudkan desain di atas berada pada file berikut di dalam repositori ini:

👉 **[lib/main.dart](./lib/main.dart)**

*Kode tersebut mencakup pembuatan halaman workshop, penggunaan widget kustom, dan penerapan prinsip UX yang telah dijelaskan dalam analisis Soal 1.*