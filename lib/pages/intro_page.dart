import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/componenet/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 129, 74, 74),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('lib/images/sushi.png'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "THE TASTE JAPANESE FOOD",
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
                Navigator.pushNamed(context, 'menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
