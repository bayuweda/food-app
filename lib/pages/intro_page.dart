import 'package:flutter/material.dart';
import 'package:food_app/componenet/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key); // Perbaikan pada constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 129, 74, 74),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            // shop name
            Text(
              "SHUSI MAN",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            SizedBox(
              height: 25,
            ),
            // icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('lib/images/sushi.png'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "THE TESTE JAPANESE FOOD",
              style: TextStyle(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 25,
            ),

            CustomButton(
              text: 'Mulai Pesan',
              onTap: () {
                // go to menu page
                Navigator.pushNamed(context, 'menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
