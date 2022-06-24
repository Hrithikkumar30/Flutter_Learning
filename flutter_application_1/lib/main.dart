import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/transactionList.dart';

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
  // final List<Transaction> transactions = [
  //   Transaction(
  //       id: 't1', title: 'New Shoes', amount: 2500, date: DateTime.now()),
  //   Transaction(id: 't2', title: 'Hair Cut', amount: 200, date: DateTime.now()),
  //   Transaction(id: 't3', title: 'movie', amount: 350, date: DateTime.now()),
  // ];
  // late String PurposeInput;
  // late String AmountInput;


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
           
          ],
        ));
  }
}
