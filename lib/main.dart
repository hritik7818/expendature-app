// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transactionsLists.dart';
import './widgets/newTransaction.dart';
import '../models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.green,
        fontFamily: "OpenSans",
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

  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(Transaction(
        amount: amount,
        title: title,
        id: DateTime.now().toString(),
        date: date,
      ));
    });
  }

  void _deleteListElement(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "Personal expense",
        style: TextStyle(
          fontFamily: "OpenSans",
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            startNewTransaction(context);
          },
          icon: Icon(Icons.add),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // MediaQuery.of(context).size.height gives a whole height of the screen from status bar to bottom.
              // If we want to calculate the height of particular widget. we can store the widget in a variable and get its height by variableName.preferredSize.height
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  .26,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  .74,
              // color: Colors.red,
              child: TransactionsList(_transactions, _deleteListElement),
            ),
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
