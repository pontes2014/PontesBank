import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/initial_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
            Image.asset('assets/images/image_principal-removebg-preview.png'),
            const Text('SERVICES',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w900)),
            CardInitial(
              icon: Icons.attach_money,
              text: 'TRANSFER',
              route: '/contacts',
            ),
            CardInitial(
              icon: Icons.feed,
              text: 'TRANSACTION FEED',
              route: '/feed',
            )
          ],
        )),
      ),
    );
  }
}
