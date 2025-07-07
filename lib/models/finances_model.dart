enum Category { fpv, fic }

class FinancesModel {
  final String name;
  final double amount;
  final Category category;

  FinancesModel({
    required this.name,
    required this.amount,
    required this.category,
  });
  factory FinancesModel.fromMap(Map<String, dynamic> map) {
    return FinancesModel(
      name: map['name'],
      amount: map['amount'].toDouble(),
      category: map['category'].toString().toLowerCase() == 'fpv'
          ? Category.fpv
          : Category.fic,
    );
  }
}
