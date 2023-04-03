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
      child: transactions.isEmpty
          ? Column(
              children: [
                const Text(
                  "No transactions added yet !! ",
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    height: 250,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: const Text(
                    "click the button to add new transaction",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: const Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      shadowColor: Color.fromARGB(255, 0, 0, 0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      elevation: 3,
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 3, 10, 1),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.none,
                                )),
                                child: Text(
                                    'Rs ${transactions[index].amount.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Text(
                                  DateFormat.MMMEd()
                                      .format(transactions[index].date),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: transactions.length,
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
            ),
    );
  }
}
