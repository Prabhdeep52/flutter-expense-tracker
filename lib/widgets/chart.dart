import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '/models/transaction.dart';
import 'package:intl/intl.dart';
import 'chartBar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransactions});
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.0;

// calculating the sum if the transaction is done on  present day.
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.day == weekday.day) {
          totalsum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransValues.fold(
        0.0, (sum, item) => sum + (item['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: data['day'] as String,
                  spendingAmount: maxSpending == 0
                      ? 0
                      : (data["amount"] as double) / maxSpending,
                  spendigPercentOftotal: maxSpending == 0
                      ? 0
                      : (data['amount'] as double) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
