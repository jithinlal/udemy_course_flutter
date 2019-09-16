import 'package:expense_tracker/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
//  String titleInput;
//  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.blue,
            elevation: 5,
            child: Container(
              width: double.infinity,
              child: Text(
                'Chart',
              ),
            ),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
