import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTxn,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTxn;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${userTransaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          userTransaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle:
            Text(DateFormat.MMMMd().add_jm().format(userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                label: Text(
                  'Delete',
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => deleteTxn(userTransaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTxn(userTransaction.id),
              ),
      ),
    );
  }
}
