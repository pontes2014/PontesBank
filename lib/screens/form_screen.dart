import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/contact.dart';
import 'package:flutter_application_1/dataBase/app_database.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        backgroundColor: Colors.indigoAccent,
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                ),
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: _accountNumberController,
                decoration: const InputDecoration(
                    labelText: 'Account Number',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: SizedBox(
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.parse(_accountNumberController.text);
                    final Contact newContact = Contact(1, name, accountNumber);

                    await save(newContact);

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context, newContact); //
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: const Text(
                    'Create',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
