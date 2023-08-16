import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  const ContactItem({required this.contact, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(contact.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        subtitle: Text(contact.accountNumber.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
