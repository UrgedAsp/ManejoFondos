import 'package:flutter/material.dart';
import 'package:manejo_fondos/models/finances_model.dart';

enum Action { add, remove }

class AccountProvider extends ChangeNotifier {
  double balance = 500000;
  List<FinancesModel> finances = [];

  void addFinance(String name, double amount, Category category) {
    finances.add(FinancesModel(name: name, amount: amount, category: category));
    updateBalance(amount, Action.remove);
    notifyListeners();
  }

  void removeFinance(FinancesModel finance) {
    finances.remove(finance);
    updateBalance(finance.amount, Action.add);
    notifyListeners();
  }

  List<FinancesModel> getFinances() {
    return finances;
  }

  double getBalance() {
    return balance;
  }

  void updateBalance(double amount, Action action) {
    if (action == Action.add) {
      balance += amount;
    } else if (action == Action.remove) {
      balance -= amount;
    }
    notifyListeners();
  }
}
