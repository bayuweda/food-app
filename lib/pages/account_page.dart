import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  CameraController? _controller;
  late List<CameraDescription> _cameras;
  bool _isReady = false;
  XFile? _profileImage;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    // Menginisialisasi daftar kamera
    _cameras = await availableCameras();
  }

  Future<void> _initializeCamera() async {
    // Menginisialisasi kamera
    if (_cameras.isNotEmpty) {
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);

      // Pastikan kamera siap digunakan
      await _controller?.initialize();
      if (!mounted) {
        return;
      }
      setState(() {
        _isReady = true;
      });
    } else {
      print("Tidak ada kamera yang tersedia");
    }
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    // Ambil foto
    final XFile photo = await _controller!.takePicture();

    // Tampilkan hasil foto di aplikasi
    setState(() {
      _profileImage = photo;
      _isReady =
          false; // Menyembunyikan pratinjau kamera setelah mengambil gambar
      _controller?.dispose(); // Membebaskan kamera setelah digunakan
      _controller = null; // Menyetel ulang controller
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            backgroundImage: _profileImage != null
                ? FileImage(File(_profileImage!.path))
                : AssetImage('lib/images/sushibanner.png') as ImageProvider,
          ),
          SizedBox(height: 20),
          TextButton.icon(
            icon: Icon(Icons.camera_alt),
            label: Text('Ganti Foto Profil'),
            onPressed: () async {
              await _initializeCamera();
            },
          ),
          if (_isReady)
            Expanded(
              child: CameraPreview(_controller!),
            ),
        ],
      ),
    );
  }
}
