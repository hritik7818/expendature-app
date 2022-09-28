// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chartBar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get _groupTransactionsValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: 7 - index - 1));
      print(weekDay);
      var sumOfSpendingOnDay = 0.0;
      var totalAmountOfSpending = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          sumOfSpendingOnDay += recentTransactions[i].amount;
        }
        totalAmountOfSpending += recentTransactions[i].amount;
      }
      return {
        "label": DateFormat.E().format(weekDay).substring(0, 1),
        "totalAmount": sumOfSpendingOnDay,
        "spentPercent": recentTransactions.isEmpty
            ? 0.0
            : sumOfSpendingOnDay / totalAmountOfSpending
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
        top:
            MediaQuery.of(context).orientation == Orientation.portrait ? 20 : 0,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupTransactionsValue.map((element) {
            // flexible widget is used to wrap the widget to specify that it can take as much width or height according to it mainAxisAlignment using specify its fit property to tight.note- we also have an another widget like Flexible which is Expended it equivalent Flexible with fit property to FlexFit.tight ,we can also give a flex property to it which specify how many time more expand in comparison to another which has default value 1.
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  spendAmount: element["totalAmount"] as double,
                  spendPercent: element["spentPercent"] as double,
                  label: element["label"] as String),
            );
          }).toList(),
        ),
      ),
    );
  }
}
