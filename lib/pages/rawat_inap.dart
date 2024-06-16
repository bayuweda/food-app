import 'package:flutter/material.dart';
import 'package:food_app/componenet/image.dart'; // Pastikan Anda mengimpor file komponen

class RawatPage extends StatelessWidget {
  const RawatPage({Key? key}) : super(key: key); // Perbaikan pada constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icon panah kembali
          onPressed: () {},
        ),
        actions: [
          // Gambar di sebelah kanan AppBar
          Image.asset(
            'lib/images/Setting_fill.png',
            width: 40, // Sesuaikan lebar gambar sesuai kebutuhan Anda
            height: 40, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rawat inap",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 24),
            ),
            // Memanggil komponen ImageWithTitle
            ImageWithTitle(
              imagePath:
                  'lib/images/merta1.png', // Sesuaikan dengan path gambar Anda
              title: 'Nama Tempat',
              address: 'Alamat Tempat',
              description: 'Deskripsi bla bla bla dan lain sebagainya.',
            ),
            ImageWithTitle(
              imagePath:
                  'lib/images/merta1.png', // Sesuaikan dengan path gambar Anda
              title: 'Nama Tempat',
              address: 'Alamat Tempat',
              description: 'Deskripsi bla bla bla dan lain sebagainya.',
            ),
            ImageWithTitle(
              imagePath:
                  'lib/images/merta1.png', // Sesuaikan dengan path gambar Anda
              title: 'Nama Tempat',
              address: 'Alamat Tempat',
              description: 'Deskripsi bla bla bla dan lain sebagainya.',
            ),
            ImageWithTitle(
              imagePath:
                  'lib/images/merta1.png', // Sesuaikan dengan path gambar Anda
              title: 'Nama Tempat',
              address: 'Alamat Tempat',
              description: 'Deskripsi bla bla bla dan lain sebagainya.',
            ),
            ImageWithTitle(
              imagePath:
                  'lib/images/merta1.png', // Sesuaikan dengan path gambar Anda
              title: 'Nama Tempat',
              address: 'Alamat Tempat',
              description: 'Deskripsi bla bla bla dan lain sebagainya.',
            ),
          ],
        ),
      ),
    );
  }
}
