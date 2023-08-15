import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/contact.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'bytebank.db');

  return openDatabase(path, onCreate: (db, version) async {
    await db.execute('CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT, '
        'account_number INTEGER)');
  }, version: 1);
}

Future<int> save(Contact contact) async {
  final db = await createDatabase();

  final contactMap = {
    'name': contact.name,
    'account_number': contact.accountNumber,
  };

  return await db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  final db = await createDatabase();

  final maps = await db.query('contacts');

  final List<Contact> contacts = [];
  for (final map in maps) {
    final contact = Contact(
      map['id'] as int,
      map['name'] as String,
      map['account_number'] as int,
    );
    contacts.add(contact);
  }

  return contacts;
}
