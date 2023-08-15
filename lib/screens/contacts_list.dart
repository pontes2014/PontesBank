import 'dart:ui';
import 'package:flutter_application_1/components/contact_card.dart';
import 'package:flutter_application_1/dataBase/app_database.dart';
import 'package:flutter_application_1/models/contact.dart';
import 'package:flutter_application_1/screens/form_screen.dart';

import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List<Contact> contacts = [];
  @override
  Widget build(BuildContext context) {
    //contacts.add(Contact(1, 'pedro', 5));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("No connection.");
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                final List<Contact> contacts = snapshot.data!;
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.indigoAccent,
                        Colors.purple,
                      ],
                    ),
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final Contact contact = contacts[index];
                      return ContactItem(
                        contact: contact,
                      );
                    },
                    itemCount: contacts.length,
                  ),
                );
              } else {
                return Text("No data available.");
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newContact = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormScreen()));

          if (newContact != null) {
            setState(() {
              contacts.add(newContact);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }
}
