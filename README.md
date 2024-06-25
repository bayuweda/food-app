# Food App README

## Pendahuluan
README ini memberikan gambaran umum tentang kode sumber untuk MenuPage di aplikasi Food App yang dibangun dengan Flutter. Aplikasi ini mengambil data menu makanan dari API, menampilkannya dalam daftar, dan memungkinkan pengguna untuk menavigasi ke tampilan detail setiap item makanan.

## Prasyarat
- Flutter SDK
- Dart
- Paket http
- Server API yang berjalan yang menyediakan data menu makanan

## Instalasi
1. Pastikan Anda telah menginstal Flutter. Jika belum, ikuti petunjuk [di sini](https://flutter.dev/docs/get-started/install).
2. Clone repositori ini ke mesin lokal Anda.
3. Arahkan ke direktori proyek.
4. Jalankan flutter pub get untuk menginstal dependensi yang diperlukan.

## Gambaran Umum Kode Sumber

### File Utama
- menu_page.dart: Berisi widget MenuPage utama dan manajemen state-nya.
- button.dart: Komponen tombol kustom yang digunakan di bagian promo.
- tile_food.dart: Komponen tile kustom untuk menampilkan item makanan.
- food.dart: Kelas model yang mewakili item makanan.
- food_details.dart: Halaman untuk menampilkan informasi detail tentang item makanan.

### Widget MenuPage
Widget MenuPage adalah widget stateful yang mewakili layar menu utama aplikasi.

```dart
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}
