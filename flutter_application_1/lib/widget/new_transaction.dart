import 'package:flutter/material.dart';
import"./user_transaction.dart";

class NewTransaction extends StatelessWidget {
  final purposeInput = TextEditingController();
  final amountInput = TextEditingController();
  final Function addTransaction ;

  NewTransaction(this.addTransaction);
  
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
              // onChanged: (val) {
              //   PurposeInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountInput,
              // onChanged: (val) {
              //   AmountInput = val;
              // },
            ),
            FlatButton(
                onPressed: () {
                  // print(purposeInput.text);
                  // print(amountInput.text);
                  // print(PurposeInput);
                  // print(AmountInput);
                addTransaction(purposeInput.text , double.parse(amountInput.text));
                  
                },
                child: Text('Add Transaction'),
                textColor: Colors.purple)
          ],
        ),
      ),
    );
  }
}
