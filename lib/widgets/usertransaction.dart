// THIS ONE IS WIDGET OF THE WHOLE SECTION OF INPUT OF TRANSACTIONS AND THE LIST OF TRANSACTIONS
import 'package:flutter/material.dart';
import './transactionLists.dart';
import './newTransactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: "helli",
    //   amount: 50,
    //   nameOfItem: "Soap",
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "hello",
    //   amount: 50000,
    //   nameOfItem: "Bike",
    //   date: DateTime.now(),
    // ),
  ];

  void _addingNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: txamount,
        date: DateTime.now(),
        nameOfItem: txtitle);

    //now we will add newtx to the above usertransaction list and rebuild the widget using setstate

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Newtransaction(
          _addingNewTransaction,
          addingtx: _addingNewTransaction,
        ),
        TransactionList(_userTransactions),
      ],
    );
  }
}
