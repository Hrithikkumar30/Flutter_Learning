import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 2500, date: DateTime.now()),
    Transaction(id: 't2', title: 'Hair Cut', amount: 200, date: DateTime.now()),
    Transaction(id: 't3', title: 'movie', amount: 350, date: DateTime.now()),
  ];
  // late String PurposeInput;
  // late String AmountInput;
  final purposeInput = TextEditingController();
  final amountInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Self Expense Record'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART!"),
              ),
            ),
            Card(
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
                          print(purposeInput.text);
                          print(amountInput.text);
                          // print(PurposeInput);
                          // print(AmountInput);
                        },
                        child: Text('Add Transaction'),
                        textColor: Colors.purple)
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 120, 9, 216),
                                width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Rs.${tx.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
