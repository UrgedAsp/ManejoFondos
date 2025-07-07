import 'package:flutter/material.dart';
import 'package:manejo_fondos/models/finances_model.dart';
import 'package:manejo_fondos/models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  final List<TransactionModel> _transactions = [];

  void addTransaction({
    required FinancesModel finance,
    required ActionType action,
  }) {
    TransactionModel newTransaction = TransactionModel(
      date: DateTime.now(),
      action: action,
      name: finance.name,
      amount: finance.amount,
      category: finance.category,
    );
    _transactions.add(newTransaction);
    notifyListeners();
  }

  List<TransactionModel> get transactions => _transactions;
}