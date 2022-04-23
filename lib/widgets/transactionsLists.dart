// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors22, prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final deleteListElement;
  TransactionsList(this.transactions, this.deleteListElement);

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < transactions.length; i++) {
      print(transactions[i].title);
    }
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions is done yet !",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png'),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: FittedBox(
                              child: Text(
                                '\u{20B9}${transactions[index].amount}',
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                        trailing: IconButton(
                          onPressed: () =>
                              deleteListElement(transactions[index].id),
                          icon: Icon(Icons.delete_rounded),
                          color: Colors.red,
                          iconSize: 25,
                        )),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
