import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newtransaction extends StatefulWidget {
  Newtransaction(
      void Function(String txtitle, double txamount, DateTime selectedDate) addingNewTransaction,
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
  DateTime selectedDate = DateTime.now();

  // _NewtransactionState(this.selectedDate);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    widget.addingtx(
      enteredTitle,
      enteredAmount,
      selectedDate,
    );

    amountController.clear();
    titleController.clear();
    Navigator.of(context).pop();
  }

  // ignore: non_constant_identifier_names
  void datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      } else {
        setState(() {
          selectedDate = pickeddate;
        });
      }
    });
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
            Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Row(
                children: [
                  Text(selectedDate == null
                      ? "no date choosen !"
                      : DateFormat.yMMMEd().format(selectedDate)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                        onPressed: datePicker,
                        child: const Text(
                          "choose Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color.fromARGB(255, 67, 249, 58)),
                        )),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: submitData,
              child: Container(
                padding: const EdgeInsets.all(2),
                child: const Text(
                  "enter transaction",
                  style: TextStyle(
                      backgroundColor: Color.fromARGB(255, 5, 255, 163),
                      decorationThickness: BorderSide.strokeAlignOutside,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
