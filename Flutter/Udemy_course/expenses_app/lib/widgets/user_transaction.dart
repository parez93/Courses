import 'package:expensesapp/models/transaction.dart';
import 'package:expensesapp/widgets/new_transaction.dart';
import 'package:expensesapp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _trxList = [
//    Transaction(title: "t1", amount: 12.80, date: DateTime.now()),
//    Transaction(title: "t2", amount: 13.80, date: DateTime.now()),
//    Transaction(title: "t3", amount: 14.80, date: DateTime.now()),
  ];

  void _addNewTransaction(String trxTitle, double trxAmount) {
    final Transaction trx = new Transaction(
        title: trxTitle, amount: trxAmount, date: new DateTime.now());
    setState(() {
      _trxList.add(trx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
//        TransactionList(_trxList),
      ],
    );
  }
}
