import 'package:flutter/material.dart';

class Newtransaction extends StatefulWidget {
  Newtransaction(
      void Function(String txtitle, double txamount) addingNewTransaction,
      {Key? key,
      required this.addingtx})
      : super(key: key);

  final Function addingtx;

  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    widget.addingtx(
      enteredTitle,
      enteredAmount,
    );

    amountController.clear();
    titleController.clear();
    Navigator.of(context).pop();
  }

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
                onSubmitted: (ctx) => submitData,
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
                onSubmitted: (ctx) => submitData,
                keyboardType: TextInputType.number,
              ),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text(
                "enter transaction",
                style: TextStyle(
                    decorationThickness: BorderSide.strokeAlignOutside,
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
