import 'package:flutter/material.dart';
import './user_transaction.dart';
import '../modules/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key? key}) : super(key: key);


  final List<Transaction> transactions;
  final Function deletetx ; //this is used to delete the transaction
  TransactionList(this.transactions , this.deletetx);
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
              elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),

              child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(onPressed: ()=> deletetx(transactions[index].id) ,icon: Icon(Icons.delete),
                    color: Colors.red
                    ),
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
