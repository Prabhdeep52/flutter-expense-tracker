import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'expense tracker',
      theme: ThemeData(
      //  primarySwatch: Colors.,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page',),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title });
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> transactions = [
    Transaction(
      id: "helli",
      amount: 50,
      nameOfItem: "Soap",
      date: DateTime.now(),
    ),
    Transaction(
      id: "helo",
      amount: 50000,
      nameOfItem: "Bike",
      date: DateTime.now(),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              shadowColor: Colors.blueGrey,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(5),
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 1, 1),
                        child: TextField(decoration: InputDecoration(
                          hintText: "Item name",
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                          // prefixIcon: Icon(images/a_dot_ham.jpeg),

                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 1, 1),
                        child: TextField(decoration: InputDecoration(
                          hintText: "Cost" ,
                            contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        )),
                      ) ,
                      TextButton(onPressed: null, child : Text("enter transaction"))
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: transactions.map((tx) {
                return Card(
                  shadowColor: Colors.blueGrey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation:7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 10, 10)
                        , child: Text(tx.nameOfItem,
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
                                )
                            ),
                            child: Text('Rs ${tx.amount}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Text(
                              DateFormat.MMMEd().format(tx.date),
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
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

