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
      Container(
        height:300,
        child: transactions.isEmpty ? 
        Column(
          children: <Widget>[
            Text('No transactions added yet!',
            
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: Image.asset('assets/images/wait.png',
              fit: BoxFit.cover,
              ),
            ),
          ],
        )
        : ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'Rs. '+transactions[index].amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: transactions.length,
        ))
        ;
  }}
        



        // :ListView(
          
//                   children: transactions.map((tx) {
//                     return Card(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin:
//                                 EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: Color.fromARGB(255, 120, 9, 216),
//                                     width: 2)),
//                             padding: EdgeInsets.all(10),
//                             child: Text(
//                               'Rs.${tx.amount.toStringAsFixed(2)}',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.purple),
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 tx.title,
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w700),
//                               ),
//                               Text(
//                                 DateFormat.yMMMd().format(tx.date),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   }).toList(),
    
//         ),
//       );
//   }
// }
