import 'package:flutter/material.dart';
import "./user_transaction.dart";
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final purposeInput = TextEditingController();

  final amountInput = TextEditingController();
  DateTime? selectedDate;

//constructor used for passing the function to the widget
  void SubmitData(String val) {
    if (amountInput.text.isEmpty) {
      return;
    }
    final enteredPurpose = purposeInput.text;
    final enterAmount = double.parse(amountInput.text);

    if (enteredPurpose.isEmpty || enterAmount <= 0|| selectedDate == null) {
      return;
    }
    widget.addTransaction(purposeInput.text, 
    double.parse(amountInput.text),
    selectedDate
    );

    Navigator.of(context)
        .pop(); //this method is used to close the modal bottom sheet
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        
      selectedDate = pickedDate;
      });
    });
    print('...');
  }

  // const NewTransaction({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Purpose"),
              controller: purposeInput,
              onSubmitted: SubmitData, //(val) => SubmitData(val),
              // onChanged: (val) {
              //   PurposeInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: SubmitData,
              // onChanged: (val) {
              //   AmountInput = val;
              // },
            ),
            Row(
              children: [
                Text(selectedDate==null ? 'No Date Chosen!': DateFormat.yMd().format(selectedDate!),),
                FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ))
              ],
            ),
            FlatButton(
                onPressed: () {
                  // print(purposeInput.text);
                  // print(amountInput.text);
                  // print(PurposeInput);
                  // print(AmountInput);
                  SubmitData;
                },
                child: Text('Add Transaction'),
                textColor: Colors.purple)
          ],
        ),
      ),
    );
  }
}
