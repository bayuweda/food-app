# Food App README
merupakan sebuah aplikasi flutter dengan judul Sushi man yang merupakan aplikasi pemesanan makanan online yang terdiri dari halaman login, food menu, food detail

## Prasyarat
- Flutter SDK
- Dart
- Paket http
- Server API yang berjalan yang menyediakan data menu makanan
  
## Desain Figma
- Login page
- ![login page](https://github.com/bayuweda/food-app/assets/60813633/12dbb4a4-21db-4694-8c44-a20e049ef558)

- Intro Page
- ![intro page](https://github.com/bayuweda/food-app/assets/60813633/e68dae16-b921-4959-80c0-69e29bd7ccb7)

- Menu page
- ![menu page](https://github.com/bayuweda/food-app/assets/60813633/764e8dce-9daa-4bf9-b731-038130a206bb)

- Food detail page
- ![food detail](https://github.com/bayuweda/food-app/assets/60813633/eff0d092-ba51-46b2-92ed-ddd910957fa9)


## Instalasi
1. Pastikan Anda telah menginstal Flutter. Jika belum, ikuti petunjuk [di sini](https://flutter.dev/docs/get-started/install).
2. Clone repositori ini ke mesin lokal Anda.
3. Arahkan ke direktori proyek.
4. Jalankan flutter pub get untuk menginstal dependensi yang diperlukan.
5. gunakan perintah cd food_api untuk masuk ke folder food_api
6. jalankan perintah node index.js untuk mengaktifkan server untuk bisa mengakses data menu
7. buka terminal baru dan jalankan flutter run

## Gambaran Umum Kode Sumber

### File Utama
- menu_page.dart: Berisi widget MenuPage utama dan manajemen state-nya.
- button.dart: Komponen tombol kustom yang digunakan di bagian promo.
- food_details.dart: Halaman untuk menampilkan informasi detail tentang item makanan.



### page menu
Widget MenuPage adalah widget stateful yang mewakili layar menu utama aplikasi.

```dart
import 'dart:convert';
import 'package:food_app/pages/account_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_app/componenet/button.dart';
import 'package:food_app/componenet/tile_food.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/pages/food_details.dart';
import 'package:food_app/pages/location.dart'; // Import halaman lokasi

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Food> foodMenu = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Uri url = Uri.parse('http://localhost:3000/api/foodMenu');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Food> foods = [];
      for (var item in jsonData) {
        Food food = Food(
          name: item['name'],
          price: item['price'],
          imagepath: item['imagepath'],
          rating: item['rating'],
          description: item['description'],
        );
        foods.add(food);
      }
      setState(() {
        foodMenu = foods;
      });
    } else {
      print('Gagal mengambil data dari API');
    }
  }

  void navigateToFoodDetail(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  void navigateToLocationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPage(),
      ),
    );
  }

  void navigateToAccountPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 129, 74, 74),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Kembali ke halaman menu
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Lokasi Kami'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                navigateToLocationPage(); // Navigasi ke halaman lokasi
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Akun'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                navigateToAccountPage(); // Navigasi ke halaman lokasi
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 95, 36, 31),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dapatkan 32% promo",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        CustomButton(
                          text: 'Tukarkan',
                          onTap: () {
                            // Aksi ketika tombol ditekan
                            // Pindah ke halaman menu (atau jalankan fungsi yang sesuai)
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    'lib/images/sushibanner.png',
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Cari makanan favorite",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "FOOD MENU",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetail(index),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25.0),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/images/rolsushi.png',
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sushi',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Rp. 100000",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


### page food detail


```dart
import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrement() {
    setState(() {
      quantityCount--;
    });
  }

  void increment() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Details',
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // list view food detail
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagepath,
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  widget.food.name,
                  style: TextStyle(color: Colors.grey[900], fontSize: 35),
                ),
                const SizedBox(height: 10),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.food.description,
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          )),
          Container(
            color: Color.fromARGB(255, 95, 36, 31),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.price,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 117, 80, 77),
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            color: Colors.white,
                            onPressed: decrement,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 117, 80, 77),
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            onPressed: increment,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

### button component
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const CustomButton({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: null, // Menggunakan lebar sesuai konten
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 117, 80, 77),
            padding: EdgeInsets.symmetric(vertical: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}



