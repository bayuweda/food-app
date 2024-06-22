import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_app/models/food.dart';

class FoodService {
  static const String baseUrl = 'http://localhost:3000/api/foods';

  static Future<List<Food>> getFoods() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((food) => Food.fromJson(food)).toList();
    } else {
      throw Exception('Failed to load foods');
    }
  }
}
