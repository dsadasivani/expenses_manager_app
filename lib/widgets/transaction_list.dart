import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: userTransactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    DateFormat.yMMMMd()
                        .add_jm()
                        .format(userTransactions[index].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}
