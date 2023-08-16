import 'package:flutter/material.dart';

class CardInitial extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;
  const CardInitial({required this.icon,required this.route, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Navigator.pushNamed(context, route);
    },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 100,
        width: 300,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              width: 100,
              height: 100,
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                child: Text(text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
