import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trxList;

  final Function deleteTransaction;

  TransactionList(this.trxList, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: 500,
      child: trxList.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      "Nessuna transazione",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: trxList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            "€ ${trxList[index].amount.toStringAsFixed(2)}",
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      trxList[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      //trx.date.toString(),
                      new DateFormat('dd-MM-yyyy').format(trxList[index].date),
                    ),
                    trailing: mediaQuery.size.width > 460
                        ? FlatButton.icon(
                            textColor: Theme.of(context).errorColor,
                            onPressed: () =>
                                deleteTransaction(trxList[index].id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"),
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            onPressed: () =>
                                deleteTransaction(trxList[index].id),
                          ),
                  ),
                );
              },
            ),
    );
  }
}
