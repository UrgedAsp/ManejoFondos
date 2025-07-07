import 'package:manejo_fondos/models/finances_model.dart';

class MockFinancesService {
  Future<List<FinancesModel>> getAvailableFunds() async {
    await Future.delayed(Duration(seconds: 3));
    final data = [
      {
        'id': '1',
        'name': 'FPV_BTG_PACTUAL_RECAUDADORA',
        'amount': 75000,
        'category': 'FPV',
      },
      {
        'id': '2',
        'name': 'FPV_BTG_PACTUAL_ECOPETROL',
        'amount': 125000,
        'category': 'FPV',
      },
      {'id': '3', 'name': 'DEUDAPRIVADA', 'amount': 50000, 'category': 'FIC'},
      {'id': '4', 'name': 'FDO-ACCIONES', 'amount': 250000, 'category': 'FIC'},
      {
        'id': '5',
        'name': 'FPV_BTG_PACTUAL_DINAMICA',
        'amount': 100000,
        'category': 'FPV',
      },
    ];
    return data.map((element) => FinancesModel.fromMap(element)).toList();
  }
}
