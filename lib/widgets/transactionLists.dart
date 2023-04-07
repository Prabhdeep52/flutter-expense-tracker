import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList(
      this.transactions, void Function(String id) deleteTransaction,
      {super.key, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                const Text(
                  "No transactions added yet !! ",
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    height: 200,
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
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
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
                          Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              children: [
                                Container(
                                  // margin:
                                  //     const EdgeInsets.fromLTRB(10, 3, 10, 2),
                                  // padding:
                                  //     const EdgeInsets.fromLTRB(10, 3, 10, 1),
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
                          ),
                          IconButton(
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: const Icon(Icons.delete_outlined),
                            color: Colors.redAccent,
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
