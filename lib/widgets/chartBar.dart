import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendigPercentOftotal});
  final String label;
  final double spendingAmount;
  final double spendigPercentOftotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 25,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        const SizedBox(
          height: 2,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              // color: const Color.fromARGB(255, 91, 89, 89),
            ),
            FractionallySizedBox(
              heightFactor: spendigPercentOftotal,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(212, 23, 222, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            )
          ]),
        ),
        Text(label),
      ],
    );
  }
}
