// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  void submit() {
    if (_titleController.text.isEmpty ||
        double.parse(_amountController.text) <= 0) {
      return;
    }
    widget.addNewTransaction(_titleController.text,
        double.parse(_amountController.text), _selectedDate);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Picked Date : ${DateFormat.yMMMd().format(_selectedDate)}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                FlatButton(
                  onPressed: presentDatePicker,
                  child: Text(
                    "choose Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            RaisedButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: submit,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
