import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/transactionList.dart';
import '../widget/new_transaction.dart';
import '../modules/transaction.dart';
import '../widget/chart.dart';

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
        primarySwatch: Colors.purple,
        
        accentColor: Colors.amber,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({Key? key}) : super(key: key);
  final purposeInput = TextEditingController();

  final amountInput = TextEditingController();
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 2500, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Hair Cut', amount: 200, date: DateTime.now()),
    // Transaction(id: 't3', title: 'movie', amount: 350, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {   //where method helps us to filter the list of transactions
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void StartAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context:
            ctx, //context is the context of the widget that calls the showModalBottomSheet() function
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        }); //builder is used as funvtion which returns the widget which is inside it     //showmodalbottomsheet is a function that shows a modal bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Self Expense Record'),
          actions: [
            // actions argument takes a list of widgets
            IconButton(
                onPressed: () {
                  StartAddNewTransaction(context);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recentTransactions),
              // Container(
              //   width: double.infinity,
              //   child: Card(
              //     color: Colors.purple,
              //     child: Text("CHART!"),
              //   ),
              // ),
              Column(
                children: [
                  TransactionList(_userTransactions),
                  // UserTransaction(),
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              StartAddNewTransaction(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return NewTransaction();
            }));
  }
}
