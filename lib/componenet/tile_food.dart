import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(left: 25),
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // images
              Image.asset(
                food.imagepath,
                height: 140,
              ),
              // name
              Text(
                food.name,
                style: TextStyle(fontSize: 20),
              ),

              // price dan rating

              SizedBox(
                width: 168,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(food.price),

                    // rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(food.rating),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
