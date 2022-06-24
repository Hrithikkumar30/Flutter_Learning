import 'package:flutter/material.dart';
import './user_transaction.dart';
import '../modules/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);


  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  
  
  @override
  Widget build(BuildContext context) {
    return 
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
    );
  }
}
