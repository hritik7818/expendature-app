import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double spendAmount;
  final double? spendPercent;
  final String label;

  ChartBar(
      {required this.spendAmount,
      required this.spendPercent,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //FittedBox Shrink the widget to being in their place or area.
        FittedBox(
          child: Text('\$${spendAmount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 193, 193, 193),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: spendPercent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(label)
      ],
    );
  }
}
