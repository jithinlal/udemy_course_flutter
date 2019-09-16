import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this._addTx);

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    this._addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
//                    onChanged: (val) {
//                      this.titleInput = val;
//                    },
              controller: this.titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
//                    onChanged: (val) {
//                      this.amountInput = val;
//                    },
              controller: this.amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            FlatButton(
              onPressed: _submitData,
              textColor: Colors.purple,
              child: Text(
                'Add Transaction',
              ),
            )
          ],
        ),
      ),
    );
  }
}
