import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  Newtransaction(
      void Function(String txtitle, double txamount) addingNewTransaction,
      {Key? key,
      required this.addingtx})
      : super(key: key);

  final Function addingtx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.all(5),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 1, 1),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Item name",
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                ),
                controller: titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 1, 1),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Cost",
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                ),
                controller: amountController,
              ),
            ),
            TextButton(
              onPressed: () => {
                addingtx(
                  titleController.text,
                  double.parse(amountController.text),
                ),
              },
              child: const Text(
                "enter transaction",
                style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
