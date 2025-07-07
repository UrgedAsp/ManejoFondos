import 'package:manejo_fondos/models/finances_model.dart';

enum ActionType { suscrito, cancelado }

class TransactionModel extends FinancesModel {
  final DateTime date;
  final ActionType action;

  TransactionModel({
    required this.date,
    required this.action,
    required super.name,
    required super.amount,
    required super.category,
  });
}
