import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'widgets/newTransactions.dart';
import 'widgets/transactionLists.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'expense tracker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'OpenSans',
      ),
      home: const MyHomePage(
        title: 'EXPENSE TRACKER ',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openWindow(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return Card(
            child: GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: Newtransaction(_addingNewTransaction,
                  addingtx: _addingNewTransaction),
            ),
          );
        });
  }

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("EXPENSE TRACKER"),
        shape: const Border(bottom: BorderSide(style: BorderStyle.none)),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.greenAccent,
        titleTextStyle:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 24),
                margin: const EdgeInsets.all(7),
                child: const Icon(
                  Icons.airplay_outlined,
                  size: 45,
                ),
              ),
             
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Newtransaction(
                    //   _addingNewTransaction,
                    //   addingtx: _addingNewTransaction,
                    // ),
                    TransactionList(_userTransactions),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openWindow(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
