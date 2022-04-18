// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transactionsLists.dart';
import './widgets/newTransaction.dart';
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeApp(),
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.green,
      ),
      title: 'Flutter App',
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  final List<Transaction> _transactions = [
    Transaction(
      id: "t1",
      title: "Smartphone",
      amount: 1000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
    Transaction(
      id: "t2",
      title: "Shoes",
      amount: 7000,
      date: DateTime.now().toLocal(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(
          amount: amount,
          title: title,
          id: DateTime.now().toString(),
          date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal expense",
        ),
        actions: [
          IconButton(
            onPressed: () {
              startNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(),
            TransactionsList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startNewTransaction(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
