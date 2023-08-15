import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.indigoAccent,
            Colors.purple,
          ],
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text('Pontes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: const Text('BANK',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                )
              ],
            ),
            SizedBox(
              child: Image.asset(
                  'assets/images/image_principal-removebg-preview.png'),
            ),
            Container(
              child: SizedBox(
                  width: 200,
                  height: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.key, size: 35),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ))),
            )
          ],
        )),
      ),
    );
  }
}
