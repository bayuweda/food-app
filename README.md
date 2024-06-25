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

### halaman login
Widget MenuPage adalah widget stateful yang mewakili layar menu utama aplikasi.

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/pages/intro_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Latar belakang merah penuh
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100), // Padding tambahan dari atas
                  Text(
                    'Selamat Datang di Sushi Man',
                    textAlign: TextAlign.center, // Posisi teks di tengah
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Ganti warna teks menjadi putih
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Colors.white), // Ganti warna label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    style: TextStyle(
                        color: Colors.black), // Ganti warna teks input
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Colors.white), // Ganti warna label
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    style: TextStyle(
                        color: Colors.black), // Ganti warna teks input
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (_isLogin) {
                          _login();
                        } else {
                          _register();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Ganti warna button menjadi putih
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
                    ),
                    child: Text(
                      _isLogin ? 'Login' : 'Register',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red), // Ganti warna teks button
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? 'Don\'t have an account? Register'
                          : 'Already have an account? Login',
                      style: TextStyle(
                          color: Colors.white), // Ganti warna teks tambahan
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

