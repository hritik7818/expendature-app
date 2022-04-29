import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double spendAmount;
  final double? spendPercent;
  final String label;

  ChartBar({
    required this.spendAmount,
    required this.spendPercent,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        print('Max height : ${constraints.maxHeight}');
        print('Min height : ${constraints.minHeight}');
        return Column(
          children: [
            //FittedBox Shrink the widget to being in their place or area.
            Container(
              height: constraints.maxHeight * .15,
              child: FittedBox(
                child: Text('\u{20B9}${spendAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .6,
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                        heightFactor: spendPercent,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .15,
              child: FittedBox(child: Text(label)),
            )
          ],
        );
      }),
    );
  }
}
