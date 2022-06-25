import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transactionList.dart';
import '../modules/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 2500, date: DateTime.now()),
    Transaction(id: 't2', title: 'Hair Cut', amount: 200, date: DateTime.now()),
    Transaction(id: 't3', title: 'movie', amount: 350, date: DateTime.now()),
  ];

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
  @override
  Widget build(BuildContext context) {
    return Column(children: [NewTransaction(_addNewTransaction), TransactionList(_userTransactions)]);
  }
}