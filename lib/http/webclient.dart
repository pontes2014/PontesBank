import 'dart:convert';
import 'package:flutter_application_1/models/contact.dart';
import 'package:flutter_application_1/screens/transfer_feed.dart';
import 'package:http/http.dart' as http;

Future<List<Transaction>> findAll() async {
  final url = Uri.parse('http://192.168.1.67:8080/transactions');
  final response = await http.get(url);
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transactionItem = Transaction(
      transactionJson['value'],
      Contact(0, contactJson['name'], contactJson['accountNumber']),
    );
    transactions.add(transactionItem);
  }
  return transactions;
}
