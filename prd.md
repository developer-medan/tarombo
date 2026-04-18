# PRD: Aplikasi Tarombo Digital (Silsilah Batak Toba)

## 1. Project Overview
Aplikasi ini adalah platform digital untuk mencatat, memvisualisasikan, dan mengelola silsilah keluarga (Tarombo) Batak Toba. Fokus utamanya adalah mempertahankan akurasi silsilah patriarki (garis laki-laki) sambil tetap memberikan ruang bagi garis keturunan perempuan (Boru).

## 2. Requirements (Functional & Non-Functional)

### Functional
- User dapat membuat dan mengedit entri anggota keluarga.
- Sistem mampu memproses relasi kompleks (poligami, adopsi, atau pernikahan antar marga).
- Sistem dapat menghitung panggilan kekerabatan (Tutur).
- Manajemen privasi data per individu dan per cabang keluarga.

### Non-Functional
- **Scalability**: Mampu menangani ribuan dahan tanpa lag pada UI.
- **Security**: Enkripsi data pribadi sesuai UU PDP.
- **Reliability**: Data tetap sinkron antara perangkat mobile dan server.

## 3. Core Features
- **Dynamic Tree Viewer**: Visualisasi pohon silsilah yang dapat di-pan dan zoom.
- **Tutur Engine**: Kalkulator otomatis untuk menentukan sebutan (misal: Amangboru, Tulang, Nantulang) antar dua pengguna.
- **Profile Management**: Detail informasi seperti nomor urut keturunan (Sundut), gelar (Ompu), dan lokasi makam/asal (Bona Pasogit).
- **Verification System**: Validasi data oleh anggota keluarga yang lebih tua atau admin marga.
- **Offline Support**: Akses data keluarga yang tersimpan di cache saat tanpa internet.

## 4. User Flow
1. **Registration & Identity**: User daftar -> Input Marga & Sundut (generasi ke-berapa).
2. **Search/Create**: Cari nama Ayah/Kakek di database global.
   - **Ketemu**: Ajukan permohonan "Join Branch".
   - **Tidak Ketemu**: Buat dahan baru (Root Node).
3. **Growth**: Tambahkan pasangan, anak, atau saudara.
4. **Interaction**: Klik profil anggota lain untuk melihat hubungan "Tutur" secara otomatis.

## 5. System Architecture
Menggunakan pola Clean Architecture untuk memastikan kode mudah diuji dan dikembangkan.
- **Frontend**: Flutter dengan BLoC atau Cubit untuk state management pohon yang kompleks.
- **Backend**: Golang dengan Gin atau Echo framework.
- **Communication**: RESTful API atau gRPC untuk performa tinggi.
- **Caching**: Redis (Server-side) dan Drift/Hive (Client-side).

## 6. Database Schema (Relational Approach)
Mengingat ini adalah data silsilah, struktur Parent-Child adalah kuncinya.

### Table: members
| Column | Type | Description |
|---|---|---|
| `id` | UUID (PK) | Unique ID |
| `full_name` | String | Nama lengkap |
| `gender` | Enum | MALE, FEMALE |
| `marga_id` | Int (FK) | Referensi ke tabel marga |
| `sundut` | Int | Generasi ke-berapa dari leluhur utama |
| `father_id` | UUID (FK) | Self-referencing ke members.id |
| `mother_id` | UUID (FK) | Self-referencing ke members.id |
| `is_verified` | Boolean | Status validasi adat |

### Table: marriages
| Column | Type | Description |
|---|---|---|
| `id` | UUID (PK) | Unique ID |
| `husband_id` | UUID (FK) | Referensi ke members.id |
| `wife_id` | UUID (FK) | Referensi ke members.id |
| `marriage_order` | Int | Untuk mendukung poligami (Istri 1, 2, dst) |

## 7. Tech Stack
| Layer | Technology | Reason |
|---|---|---|
| **Mobile** | Flutter | Single codebase untuk Android/iOS, performa rendering grafis pohon yang kuat. |
| **Backend** | Golang | Sangat cepat untuk kalkulasi rekursif (penelusuran dahan silsilah). |
| **Database** | PostgreSQL | Mendukung Recursive Common Table Expressions (CTE) untuk kueri silsilah. |
| **State Mgmt** | BLoC | Menangani perubahan data besar pada UI Tree secara terprediksi. |
| **DevOps** | Docker | Konsistensi lingkungan pengembangan. |

## 8. Design Guidelines

### 8.1 Visual Identity & Mood
- **Cultural Modernism**: Menggabungkan estetika modern (bersih, minimalis) dengan aksen tradisional Batak (seperti motif Gorga) sebagai elemen dekoratif non-distraktif.
- **Color Palette**:
  - **Primary**: Maroon/Deep Red (#800000) – Melambangkan keberanian dan kekuatan (identik dengan warna kain Ulos).
  - **Secondary**: Charcoal Black (#1A1A1A) dan Bone White (#F9F9F9) – Untuk kontras tinggi dan keterbacaan.
  - **Accent**: Gold (#D4AF37) – Digunakan terbatas untuk penanda garis keturunan bangsawan/raja atau status verifikasi.

### 8.2 Typography (Legibility First)
- **Font Family**: Menggunakan font Sans-Serif (seperti Inter atau Roboto) untuk data teknis agar bersih.
- **Scalability**: Memberikan opsi pengaturan ukuran font di dalam aplikasi bagi pengguna lansia.
- **Hierarchy**: Nama anggota keluarga harus menggunakan bold dengan ukuran minimal 16pt, sedangkan keterangan sundut atau gelar menggunakan ukuran 12pt.

### 8.3 Interaction Design (The Tree Experience)
- **Gesture-Based Navigation**: Mendukung pinch-to-zoom dan drag-to-pan untuk menjelajahi dahan keluarga yang luas.
- **Node Design**: Kotak anggota keluarga (Node) dibedakan secara visual: Biru muda/simbol khusus untuk Laki-laki (pembawa marga) dan Merah muda/simbol khusus untuk Perempuan (Boru). Setiap node harus menampilkan informasi minimal: Nama, Gelar, dan Status (Hidup/Wafat).
- **Dynamic Loading**: Menggunakan shimmer effect saat memuat dahan keluarga yang besar agar UX terasa responsif.

### 8.4 User Interface (UI) Components
- **The "Tutur" Card**: Sebuah overlay atau bottom sheet yang muncul saat dua profil dibandingkan, menampilkan sebutan kekerabatan dengan teks yang besar dan jelas.
- **Search Bar**: Selalu tersedia di bagian atas untuk akses cepat ke nama leluhur tanpa harus menelusuri pohon secara manual.
- **Floating Action Button (FAB)**: Untuk menambahkan anggota keluarga baru, diletakkan di posisi yang mudah dijangkau jempol (kanan bawah).

### 8.5 Accessibility (Inclusion)
- **High Contrast Mode**: Memastikan garis hubungan antar generasi (garis vertikal/horizontal) terlihat jelas bagi pengguna dengan gangguan penglihatan ringan.
- **Haptic Feedback**: Memberikan getaran halus saat berhasil menyimpan data atau saat beralih antar dahan keluarga.