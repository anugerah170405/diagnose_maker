# 🩺 Diagnosa Maker

**Diagnosa Maker** adalah aplikasi berbasis Command Line Interface (CLI) yang dikembangkan menggunakan **Dart**, sebagai implementasi konsep *Object-Oriented Programming (OOP)* dalam tugas kelompok mata kuliah OOP.

Aplikasi ini menggunakan pendekatan **Decision Tree** untuk menentukan hasil diagnosa berdasarkan input gejala dari pengguna.

---

## 🎯 Tujuan Proyek

* Mengimplementasikan konsep OOP dalam studi kasus nyata
* Membangun sistem berbasis decision logic
* Menerapkan struktur project modular dan terorganisir
* Melatih kolaborasi tim dalam pengembangan perangkat lunak

---

## ⚙️ Teknologi

* **Language:** Dart
* **Environment:** Terminal / CLI
* **Paradigm:** Object-Oriented Programming
* **Architecture Style:** Layered structure (Model–Controller–Utility)

---

## 🧠 Konsep OOP yang Diimplementasikan

* Class & Object
* Encapsulation
* Constructor
* Method abstraction
* Separation of Concerns
* Decision Tree Logic Pattern

---

## 📂 Struktur Project

```
lib/
│
├── colors_util.dart        # Utility untuk styling warna terminal
├── message_util.dart       # Utility untuk formatting pesan
├── table_util.dart         # Utility untuk menampilkan tabel CLI
│
├── model/
│   └── diagnoseData.dart   # Model data untuk diagnosa
│
├── controller.dart         # Logic utama pengontrol alur program
├── decisionTree.dart       # Implementasi decision tree
│
├── main.dart               # Entry point aplikasi
│
├── diagnosa.json           # Data referensi diagnosa
│
└── README.md
```

---

## 🔄 Alur Kerja Program

1. Program dijalankan melalui `main.dart`
2. `controller.dart` mengatur alur interaksi user
3. `decisionTree.dart` memproses input berdasarkan struktur pohon keputusan
4. Data diagnosa diambil dari `diagnosa.json`
5. Output ditampilkan menggunakan utility (warna, tabel, pesan)

---

## ▶️ Cara Menjalankan

Pastikan Dart sudah terinstall:

```bash
dart --version
```

Jalankan aplikasi:

```bash
dart run ./main.dart
```

---

## 👥 Tim Pengembang

**Kelompok 2**

* Londok Stieven
* Gari Anugrah
* Mamahit Sthaford

---

## 📌 Catatan

Program ini dibuat untuk keperluan pembelajaran dan simulasi akademik.
Tidak dimaksudkan untuk penggunaan medis nyata.