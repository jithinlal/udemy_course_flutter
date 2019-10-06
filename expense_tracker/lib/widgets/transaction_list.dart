import 'package:expense_tracker/model/Transaction.dart';
import 'package:expense_tracker/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTx;
  TransactionList(this._transactions, this._deleteTx);
  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: <Widget>[
              ...this
                  ._transactions
                  .map(
                    (tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: _deleteTx,
                    ),
                  )
                  .toList(),
            ],
          );
  }
}
