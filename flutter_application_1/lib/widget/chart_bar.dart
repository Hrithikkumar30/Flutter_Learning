import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);
  final String label;
  final double spendingAmount;
  // final spendingPercentage;
  final double spendingPercentageTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentageTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
                'Rs. ${spendingAmount.toStringAsFixed(0)}'),
          ),
        ), //toStringAsFixed(0) is used to convert the double value to string and it will show only two decimal places
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageTotal,
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
