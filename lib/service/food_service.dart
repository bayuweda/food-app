import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:food_app/models/food.dart';

class FoodService {
  static const String baseUrl = 'http://localhost:3000/api/foods';
  DatabaseReference _foodRef =
      FirebaseDatabase.instance.reference().child('foods');

  Future<List<Food>> getFoods() async {
    List<Food> foods = [];

    // Ambil data dari Firebase Database
    await _foodRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        foods.add(Food.fromJson(value));
      });
    });

    return foods;
  }
}
