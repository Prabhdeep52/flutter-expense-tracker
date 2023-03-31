import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.blueGrey,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                  child: Text(transactions[index].nameOfItem,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 3, 10, 2),
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 1),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.none,
                      )),
                      child: Text('Rs ${transactions[index].amount}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Text(DateFormat.MMMEd().format(transactions[index].date),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ))
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
