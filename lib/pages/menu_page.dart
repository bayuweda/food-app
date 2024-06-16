import 'package:flutter/material.dart';
import 'package:food_app/componenet/button.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/componenet/tile_food.dart';
import 'package:food_app/pages/food_details.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    // salmon menu
    Food(
        name: 'salmon',
        price: 'Rp.10000',
        imagepath: 'lib/images/salmon.png',
        rating: '4,9',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
    // nigiri menu
    Food(
        name: 'nigiri',
        price: 'Rp.120000',
        imagepath: 'lib/images/nigiri.png',
        rating: '5',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.'),
    // sushi
    Food(
        name: 'sushi',
        price: 'Rp.1230000',
        imagepath: 'lib/images/sushi.png',
        rating: '5',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.'),
  ];
  // navigase ke food detail
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

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text(
            'Tokyo',
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
          centerTitle: true,
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
                      height: 100, // Atur tinggi gambar sesuai kebutuhan
                      width: 100, // Atur lebar gambar sesuai kebutuhan
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Cari makanan favorite"),
                ),
              ),
              const SizedBox(height: 20),
              // Menu list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "FOOD MENU",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                      fontSize: 20),
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
                          ))),
              const SizedBox(height: 10),
              // Favorite food
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
                margin:
                    const EdgeInsets.only(left: 25, right: 25, bottom: 25.0),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // images
                    Row(
                      children: [
                        Image.asset(
                          'lib/images/rolsushi.png',
                          height: 60,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // name
                              Text(
                                'Sushi',
                                style: TextStyle(fontSize: 18),
                              ),

                              // price
                              Text(
                                "Rp. 100000",
                                style: TextStyle(color: Colors.grey[700]),
                              )
                            ]),
                      ],
                    ),

                    // icon hati
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
